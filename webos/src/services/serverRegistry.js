// Persists authenticated servers and UI selections in localStorage. A "server"
// is the minimal record needed to make authenticated API calls. The user may
// have access to several Plex servers; we store them all so the Movies/Shows
// dropdowns can list libraries across every server, while one stays "active"
// (the server chosen on the Select Server screen, used for the Home hubs).
//
// Record shape:
//   { id, backend: 'plex', name, baseUrl, accessToken, clientIdentifier? }

const SERVERS_KEY = 'lumi.servers';
const ACTIVE_KEY = 'lumi.activeServerId';
// Remembered library selection per type tab: {movie:{serverId,libraryId}, show:{…}}
const TAB_LIB_KEY = 'lumi.tabLibrary';

function read() {
	try {
		return JSON.parse(localStorage.getItem(SERVERS_KEY)) || [];
	} catch {
		return [];
	}
}

function write(servers) {
	localStorage.setItem(SERVERS_KEY, JSON.stringify(servers));
}

export function getServers() {
	return read();
}

export function getActiveServer() {
	const id = localStorage.getItem(ACTIVE_KEY);
	const servers = read();
	return servers.find((s) => s.id === id) || servers[0] || null;
}

export function setActiveServer(id) {
	localStorage.setItem(ACTIVE_KEY, id);
}

/** Add or replace a single server (dedup by id) and make it active. */
export function saveServer(server) {
	const servers = read().filter((s) => s.id !== server.id);
	servers.push(server);
	write(servers);
	setActiveServer(server.id);
	return server;
}

/**
 * Replace the full server list (used at login when we resolve every server the
 * account can reach), and set the chosen one active.
 */
export function saveServers(servers, activeId) {
	write(servers);
	if (activeId) setActiveServer(activeId);
	else if (servers[0]) setActiveServer(servers[0].id);
}

export function removeServer(id) {
	write(read().filter((s) => s.id !== id));
	if (localStorage.getItem(ACTIVE_KEY) === id) {
		const next = read()[0];
		if (next) setActiveServer(next.id);
		else localStorage.removeItem(ACTIVE_KEY);
	}
}

export function clearServers() {
	localStorage.removeItem(SERVERS_KEY);
	localStorage.removeItem(ACTIVE_KEY);
	localStorage.removeItem(TAB_LIB_KEY);
}

// --- Per-tab library selection (Movies / Shows) ----------------------------

function readTabLib() {
	try {
		return JSON.parse(localStorage.getItem(TAB_LIB_KEY)) || {};
	} catch {
		return {};
	}
}

/** Remembered {serverId, libraryId} for a type tab ('movie' | 'show'), or null. */
export function getTabLibrary(type) {
	return readTabLib()[type] || null;
}

export function setTabLibrary(type, serverId, libraryId) {
	const all = readTabLib();
	all[type] = {serverId, libraryId};
	localStorage.setItem(TAB_LIB_KEY, JSON.stringify(all));
}
