// Plex PIN/OAuth authentication, mirroring lib/services/plex_auth_service.dart.
//   1. createPin()            -> {id, code}
//   2. getAuthUrl(code)       -> URL the user opens to claim the PIN
//   3. pollPinUntilClaimed()  -> authToken once claimed
//   4. fetchServers(token)    -> reachable PMS connections
//
// On a TV the user opens the auth URL on their phone (we show the URL + code),
// approves, and we poll until plex.tv hands back the token.

import {request, qs, delay} from '../http';
import {APP_NAME, PLATFORM, DEVICE_NAME, getClientIdentifier} from '../identity';

const PLEX_API = 'https://plex.tv/api/v2';
const CLIENTS_API = 'https://clients.plex.tv/api/v2';

function commonHeaders(authToken) {
	const headers = {
		Accept: 'application/json',
		'X-Plex-Product': APP_NAME,
		'X-Plex-Device-Name': DEVICE_NAME,
		'X-Plex-Platform': PLATFORM,
		'X-Plex-Client-Identifier': getClientIdentifier()
	};
	if (authToken) headers['X-Plex-Token'] = authToken;
	return headers;
}

/** Create a strong PIN. Returns {id, code}. */
export async function createPin() {
	const {data} = await request(`${PLEX_API}/pins?strong=true`, {
		method: 'POST',
		headers: commonHeaders()
	});
	return {id: data.id, code: data.code};
}

/** URL the user visits (phone) to claim the PIN. */
export function getAuthUrl(code) {
	const params = qs({
		clientID: getClientIdentifier(),
		code,
		'context[device][product]': APP_NAME
	});
	return `https://app.plex.tv/auth#?${params}`;
}

/** One poll. Returns the authToken if claimed, else null. */
export async function checkPin(pinId) {
	try {
		const {data} = await request(`${PLEX_API}/pins/${pinId}`, {headers: commonHeaders()});
		return data.authToken || null;
	} catch {
		return null;
	}
}

/**
 * Poll the PIN until claimed or timeout. Exponential backoff 1s→2s→4s capped
 * at 5s, matching the Dart pollWithBackoff behaviour.
 * @param {number} pinId
 * @param {object} [opts]
 * @param {number} [opts.timeoutMs]
 * @param {() => boolean} [opts.shouldCancel]
 */
export async function pollPinUntilClaimed(pinId, {timeoutMs = 120000, shouldCancel} = {}) {
	const end = Date.now() + timeoutMs;
	let wait = 1000;
	while (Date.now() < end) {
		if (shouldCancel && shouldCancel()) return null;
		const token = await checkPin(pinId);
		if (token) return token;
		await delay(wait);
		wait = Math.min(wait * 2, 5000);
	}
	return null;
}

/**
 * Resolve the authenticated user's Plex servers and their connections.
 * Returns an array of {name, clientIdentifier, accessToken, connections:[{uri,local,relay}]}.
 */
export async function fetchServers(authToken) {
	const url = `${CLIENTS_API}/resources?includeHttps=1&includeRelay=1&includeIPv6=1`;
	const {data} = await request(url, {headers: commonHeaders(authToken)});
	const resources = Array.isArray(data) ? data : [];
	return resources
		.filter((r) => r.provides && r.provides.includes('server'))
		.map((r) => ({
			name: r.name,
			clientIdentifier: r.clientIdentifier,
			accessToken: r.accessToken || authToken,
			owned: !!r.owned,
			connections: (r.connections || []).map((c) => ({
				uri: c.uri,
				address: c.address,
				port: c.port,
				local: !!c.local,
				relay: !!c.relay
			}))
		}));
}

/** Verify a stored plex.tv token is still valid. */
export async function verifyToken(authToken) {
	try {
		await request(`${PLEX_API}/user`, {headers: commonHeaders(authToken)});
		return true;
	} catch {
		return false;
	}
}
