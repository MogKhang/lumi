// A type-filtered library browser used by the Movies and Shows tabs. It:
//   - resolves all libraries of the given type ('movie' | 'show') across every
//     accessible Plex server,
//   - shows a Dropdown to switch between them (label includes the server name
//     when more than one server is present),
//   - defaults to the first library alphabetically on the active server (or the
//     remembered selection for this tab),
//   - renders the selected library's items in a VirtualGridList.

import {useState, useEffect, useCallback, useMemo, useRef} from 'react';
import BodyText from '@enact/limestone/BodyText';
import Dropdown from '@enact/limestone/Dropdown';
import ImageItem from '@enact/limestone/ImageItem';
import Spinner from '@enact/limestone/Spinner';
import {VirtualGridList} from '@enact/limestone/VirtualList';
import ri from '@enact/ui/resolution';

import {useAppState, makeClient} from '../state/AppState';
import {getTabLibrary, setTabLibrary} from '../services/serverRegistry';

const PAGE = 50;
const POSTER_W = 220;
const POSTER_H = 330;
const CAPTION_H = 78;

const TypeLibraryBrowser = ({type, onOpenItem}) => {
	const {servers, active} = useAppState();

	// Cache a client per server id so we don't rebuild them on every render.
	const clients = useMemo(() => {
		const map = {};
		for (const s of servers) map[s.id] = makeClient(s);
		return map;
	}, [servers]);

	const [choices, setChoices] = useState([]); // [{serverId, serverName, libraryId, title}]
	const [selected, setSelected] = useState(null); // {serverId, libraryId}
	const [resolving, setResolving] = useState(true);

	const [items, setItems] = useState([]);
	const [total, setTotal] = useState(0);
	const [loading, setLoading] = useState(false);
	const [error, setError] = useState('');
	// Guards against concurrent / duplicate page loads (the cause of the freeze:
	// triggering loadPage from render fired it many times before state settled).
	const loadingMore = useRef(false);
	const itemsRef = useRef([]);
	const totalRef = useRef(0);

	// Resolve all matching-type libraries across every server.
	useEffect(() => {
		let cancelled = false;
		setResolving(true);
		(async () => {
			const found = [];
			await Promise.all(
				servers.map(async (s) => {
					const c = clients[s.id];
					if (!c) return;
					try {
						const libs = await c.fetchLibraries();
						for (const lib of libs) {
							if (lib.type === type) {
								found.push({serverId: s.id, serverName: s.name, libraryId: lib.id, title: lib.title});
							}
						}
					} catch {
						// skip unreachable server
					}
				})
			);
			if (cancelled) return;

			// Sort by library title alphabetically (default selection = first).
			found.sort((a, b) => a.title.localeCompare(b.title));
			setChoices(found);

			// Restore remembered selection, else first on the active server, else first overall.
			const remembered = getTabLibrary(type);
			const match =
				(remembered && found.find((f) => f.serverId === remembered.serverId && f.libraryId === remembered.libraryId)) ||
				found.find((f) => active && f.serverId === active.id) ||
				found[0] ||
				null;
			setSelected(match ? {serverId: match.serverId, libraryId: match.libraryId} : null);
			setResolving(false);
		})();
		return () => {
			cancelled = true;
		};
	}, [servers, clients, type, active]);

	// Load items whenever the selected library changes.
	const loadPage = useCallback(
		async (start) => {
			if (!selected) return;
			const c = clients[selected.serverId];
			if (!c) return;
			loadingMore.current = true;
			try {
				const {items: page, total: t} = await c.fetchLibraryContent(selected.libraryId, {start, size: PAGE});
				totalRef.current = t;
				setTotal(t);
				setItems((prev) => {
					const next = start === 0 ? page : [...prev, ...page];
					itemsRef.current = next;
					return next;
				});
			} catch (e) {
				setError(e.message || 'Failed to load library.');
			} finally {
				setLoading(false);
				loadingMore.current = false;
			}
		},
		[selected, clients]
	);

	useEffect(() => {
		if (!selected) return undefined;
		itemsRef.current = [];
		totalRef.current = 0;
		loadingMore.current = false;
		setItems([]);
		setError('');
		setLoading(true);
		const t = setTimeout(() => loadPage(0), 0);
		return () => clearTimeout(t);
	}, [selected, loadPage]);

	// Append the next page when scrolling stops near the end. Driven by
	// onScrollStop (not render) and guarded by loadingMore so it fires once.
	const onScrollStop = useCallback(() => {
		const loaded = itemsRef.current.length;
		const t = totalRef.current;
		if (loadingMore.current || loaded === 0 || loaded >= t) return;
		loadPage(loaded);
	}, [loadPage]);

	const selectedIndex = useMemo(() => {
		if (!selected) return 0;
		const i = choices.findIndex((c) => c.serverId === selected.serverId && c.libraryId === selected.libraryId);
		return i < 0 ? 0 : i;
	}, [choices, selected]);

	const multiServer = useMemo(() => new Set(choices.map((c) => c.serverId)).size > 1, [choices]);
	const dropdownItems = useMemo(
		() => choices.map((c) => (multiServer ? `${c.title} — ${c.serverName}` : c.title)),
		[choices, multiServer]
	);

	const onSelectLibrary = useCallback(
		({selected: idx}) => {
			const choice = choices[idx];
			if (!choice) return;
			setTabLibrary(type, choice.serverId, choice.libraryId);
			setSelected({serverId: choice.serverId, libraryId: choice.libraryId});
		},
		[choices, type]
	);

	const imageFor = useCallback(
		(item) => {
			const c = selected ? clients[selected.serverId] : null;
			return c ? c.imageUrl(item.thumb, {width: POSTER_W, height: POSTER_H}) : '';
		},
		[selected, clients]
	);

	const renderItem = useCallback(
		({index, ...itemRest}) => {
			const item = items[index];
			if (!item) return <div {...itemRest} />;
			return (
				<ImageItem
					{...itemRest}
					src={imageFor(item)}
					label={item.year ? String(item.year) : ''}
					onClick={() => onOpenItem(item)}
				>
					{item.title}
				</ImageItem>
			);
		},
		[items, imageFor, onOpenItem]
	);

	if (resolving) return <Spinner>Loading…</Spinner>;
	if (choices.length === 0) {
		return <BodyText style={{padding: '0 48px'}}>No {type === 'movie' ? 'movie' : 'TV'} libraries found.</BodyText>;
	}

	return (
		<div style={{height: '100%', display: 'flex', flexDirection: 'column'}}>
			<div style={{padding: '0 48px 12px'}}>
				<Dropdown
					title="Library"
					selected={selectedIndex}
					onSelect={onSelectLibrary}
					width="large"
				>
					{dropdownItems}
				</Dropdown>
			</div>
			{error ? <BodyText style={{padding: '0 48px'}}>{error}</BodyText> : null}
			<div style={{flex: 1, minHeight: 0}}>
				<VirtualGridList
					dataSize={items.length}
					itemRenderer={renderItem}
					itemSize={{minWidth: ri.scale(POSTER_W), minHeight: ri.scale(POSTER_H + CAPTION_H)}}
					spacing={ri.scale(24)}
					onScrollStop={onScrollStop}
				/>
			</div>
		</div>
	);
};

export default TypeLibraryBrowser;
