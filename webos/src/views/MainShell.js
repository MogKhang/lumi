// The authenticated app shell: a vertical left sidebar (TabLayout) with
// Home, Movies, Shows, Settings (always expanded). Selecting a media item from
// any tab pushes a Detail view on top (Panels stack overlay); the remote Back
// key pops it, handled explicitly via Cancelable so it works even though the
// detail stack starts at Panels index 0 (where the built-in back button hides).

import {useState, useCallback} from 'react';
import TabLayout, {Tab} from '@enact/limestone/TabLayout';
import Panels from '@enact/limestone/Panels';
import Cancelable from '@enact/ui/Cancelable';

import HomePanel from './HomePanel';
import TypeLibraryBrowser from './TypeLibraryBrowser';
import SettingsPanel from './SettingsPanel';
import DetailPanel from './DetailPanel';
import PlayerPanel from './PlayerPanel';

const TAB = {HOME: 0, MOVIES: 1, SHOWS: 2, SETTINGS: 3};

// Each tab's content fills the tab area; a full-height wrapper gives the inner
// Scroller/VirtualGridList a sized parent to scroll within.
const fill = {height: '100%'};

// A Panels stack that pops on the remote Back/cancel key (Cancelable, modal so
// it wins over the shell). Used for the detail drill-down.
const CancelablePanels = Cancelable({modal: true, onCancel: 'onBack'}, Panels);

const MainShell = ({onAddServer}) => {
	const [tab, setTab] = useState(TAB.HOME);
	// Detail drill-down stack layered above the tabs.
	const [detailStack, setDetailStack] = useState([]);
	// The video player is a separate full-screen layer ABOVE everything (not a
	// Panels child — VideoPlayer needs to own the whole viewport).
	const [playing, setPlaying] = useState(null);

	const openItem = useCallback((item) => setDetailStack((s) => [...s, {type: 'detail', item}]), []);
	const openPlayer = useCallback((item) => setPlaying(item), []);
	const closePlayer = useCallback(() => setPlaying(null), []);
	const pop = useCallback(() => setDetailStack((s) => s.slice(0, -1)), []);
	const onSelectTab = useCallback(({index}) => setTab(index), []);

	// Player takes over the whole screen when active.
	if (playing) {
		return <PlayerPanel item={playing} onBack={closePlayer} />;
	}

	if (detailStack.length > 0) {
		return (
			<CancelablePanels index={detailStack.length - 1} onBack={pop} noCloseButton>
				{detailStack.map((entry, i) => (
					<DetailPanel
						key={`${entry.item.id}:${i}`}
						item={entry.item}
						onBack={pop}
						onOpenItem={openItem}
						onPlay={openPlayer}
					/>
				))}
			</CancelablePanels>
		);
	}

	return (
		<TabLayout orientation="vertical" index={tab} onSelect={onSelectTab} collapsed={false}>
			<Tab title="Home" icon="home">
				<div style={fill}>
					<HomePanel onOpenItem={openItem} />
				</div>
			</Tab>
			<Tab title="Movies" icon="play">
				<div style={fill}>
					<TypeLibraryBrowser type="movie" onOpenItem={openItem} />
				</div>
			</Tab>
			<Tab title="Shows" icon="list">
				<div style={fill}>
					<TypeLibraryBrowser type="show" onOpenItem={openItem} />
				</div>
			</Tab>
			<Tab title="Settings" icon="gear">
				<div style={fill}>
					<SettingsPanel onAddServer={onAddServer} />
				</div>
			</Tab>
		</TabLayout>
	);
};

export default MainShell;
