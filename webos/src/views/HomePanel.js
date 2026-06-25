// Home tab content: the server's pinned Home hubs as a vertical shelf of rows.
// Continue Watching leads (hourglass-prefixed to match the Android/Apple apps),
// followed by the hubs the user pinned in Plex server settings.
//
// A plain vertical Scroller wraps the rows; each row is a horizontal Scroller
// (MediaRow). Plain Scrollers compose for 5-way focus, so the vertical Scroller
// follows focus down to the bottom row and the rows follow focus left/right.

import {useState, useEffect, useCallback, useRef} from 'react';
import Button from '@enact/limestone/Button';
import BodyText from '@enact/limestone/BodyText';
import Spinner from '@enact/limestone/Spinner';
import {Scroller} from '@enact/limestone/Scroller';

import MediaRow from '../components/MediaRow';
import {useAppState} from '../state/AppState';

const CONTINUE_WATCHING_TITLE = '⏳ Continue Watching';

const HomePanel = ({onOpenItem}) => {
	const {client} = useAppState();
	const [loading, setLoading] = useState(true);
	const [error, setError] = useState('');
	const [continueWatching, setContinueWatching] = useState([]);
	const [hubs, setHubs] = useState([]);

	// Captures the vertical Scroller's scrollTo so we can force it to the top
	// when the first row is focused (Enact's Scroller otherwise aligns the
	// focused poster flush to the top and hides that row's hub title).
	const scrollToRef = useRef(null);
	const setScrollTo = useCallback((fn) => {
		scrollToRef.current = fn;
	}, []);
	const scrollToTop = useCallback(() => {
		if (scrollToRef.current) scrollToRef.current({position: {y: 0}, animate: true});
	}, []);

	const load = useCallback(async () => {
		if (!client) return;
		setLoading(true);
		setError('');
		try {
			const [cw, pinnedHubs] = await Promise.all([
				client.fetchContinueWatching().catch(() => []),
				client.fetchHomeHubs().catch(() => [])
			]);
			setContinueWatching(cw);
			setHubs(pinnedHubs);
		} catch (e) {
			setError(e.message || 'Failed to load.');
		} finally {
			setLoading(false);
		}
	}, [client]);

	useEffect(() => {
		const t = setTimeout(load, 0);
		return () => clearTimeout(t);
	}, [load]);

	const imageFor = useCallback(
		// Use the show poster for episodes (Continue Watching), at the larger
		// poster size so titles/logos are legible.
		(item) => (client ? client.imageUrl(client.posterPath(item), {width: 400, height: 600}) : ''),
		[client]
	);

	if (loading) return <Spinner>Loading…</Spinner>;
	if (error) {
		return (
			<div style={{padding: '0 48px'}}>
				<BodyText>{error}</BodyText>
				<Button onClick={load}>Retry</Button>
			</div>
		);
	}

	const hasContinue = continueWatching.length > 0;

	return (
		<Scroller direction="vertical" verticalScrollbar="hidden" style={{height: '100%'}} cbScrollTo={setScrollTo}>
			<div style={{padding: '12px 48px 96px'}}>
				{hasContinue && (
					<MediaRow
						title={CONTINUE_WATCHING_TITLE}
						items={continueWatching}
						imageFor={imageFor}
						onSelect={onOpenItem}
						onRowFocus={scrollToTop}
					/>
				)}
				{hubs.map((hub, i) => (
					<MediaRow
						key={hub.key}
						title={hub.title}
						items={hub.items}
						imageFor={imageFor}
						onSelect={onOpenItem}
						// If there's no Continue Watching row, the first hub is the top
						// row and must reveal its title the same way.
						onRowFocus={!hasContinue && i === 0 ? scrollToTop : undefined}
					/>
				))}
			</div>
		</Scroller>
	);
};

export default HomePanel;
