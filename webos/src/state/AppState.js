// App-wide state via React context: the authenticated servers, the active one,
// and helpers to build per-server clients. Backed by serverRegistry
// (localStorage) so it survives relaunch.

import {createContext, useContext, useState, useCallback, useMemo} from 'react';

import {
	getServers,
	getActiveServer,
	saveServer as persistServer,
	saveServers as persistServers,
	setActiveServer,
	removeServer as dropServer,
	clearServers
} from '../services/serverRegistry';
import {createPlexClient} from '../services/plex/plexClient';

// Build an authenticated media client for a saved server record. Plex-only for
// now; the `backend` switch is where Jellyfin slots back in later.
export function makeClient(server) {
	if (!server) return null;
	if (server.backend === 'plex') return createPlexClient(server);
	return null;
}

const AppStateContext = createContext(null);

const AppStateProvider = ({children}) => {
	const [servers, setServers] = useState(() => getServers());
	const [active, setActive] = useState(() => getActiveServer());

	const refresh = useCallback(() => {
		setServers(getServers());
		setActive(getActiveServer());
	}, []);

	const addServer = useCallback(
		(server) => {
			persistServer(server);
			refresh();
		},
		[refresh]
	);

	// Save the full set of accessible servers at login, marking one active.
	const saveAllServers = useCallback(
		(records, activeId) => {
			persistServers(records, activeId);
			refresh();
		},
		[refresh]
	);

	const switchActive = useCallback(
		(id) => {
			setActiveServer(id);
			refresh();
		},
		[refresh]
	);

	const removeServer = useCallback(
		(id) => {
			dropServer(id);
			refresh();
		},
		[refresh]
	);

	const signOutAll = useCallback(() => {
		clearServers();
		setServers([]);
		setActive(null);
	}, []);

	const client = useMemo(() => makeClient(active), [active]);

	const value = useMemo(
		() => ({
			servers,
			active,
			client,
			addServer,
			saveAllServers,
			switchActive,
			removeServer,
			signOutAll,
			isAuthenticated: !!active
		}),
		[servers, active, client, addServer, saveAllServers, switchActive, removeServer, signOutAll]
	);

	return <AppStateContext.Provider value={value}>{children}</AppStateContext.Provider>;
};

export const useAppState = () => {
	const ctx = useContext(AppStateContext);
	if (!ctx) throw new Error('useAppState must be used within AppStateProvider');
	return ctx;
};

export default AppStateProvider;
