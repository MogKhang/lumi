// Stable client/device identity, persisted in localStorage so the server-side
// device list and tokens stay consistent across launches. Mirrors the Dart
// apps' getOrCreateClientIdentifier().

const CLIENT_ID_KEY = 'lumi.clientIdentifier';

export const APP_NAME = 'Lumi';
export const APP_VERSION = '2.2.4';
export const DEVICE_NAME = 'Lumi (webOS)';
export const PLATFORM = 'webOS';

function uuid() {
	if (typeof crypto !== 'undefined' && crypto.randomUUID) {
		return crypto.randomUUID();
	}
	// Fallback for older webOS WebKit without randomUUID.
	return 'xxxxxxxx-xxxx-4xxx-yxxx-xxxxxxxxxxxx'.replace(/[xy]/g, (c) => {
		const r = (Math.random() * 16) | 0;
		const v = c === 'x' ? r : (r & 0x3) | 0x8;
		return v.toString(16);
	});
}

/**
 * The stable client identifier for this install. Used as the Plex
 * X-Plex-Client-Identifier so the server treats this app as a single
 * recurring device.
 */
export function getClientIdentifier() {
	let id = localStorage.getItem(CLIENT_ID_KEY);
	if (!id) {
		id = uuid();
		localStorage.setItem(CLIENT_ID_KEY, id);
	}
	return id;
}
