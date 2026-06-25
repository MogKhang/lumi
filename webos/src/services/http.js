// Small fetch wrapper: timeout, JSON parsing, and a typed error. Kept minimal
// on purpose — the backend clients layer their own auth headers on top.

export class HttpError extends Error {
	constructor(message, status, body) {
		super(message);
		this.name = 'HttpError';
		this.status = status;
		this.body = body;
	}
}

const DEFAULT_TIMEOUT = 15000;

/**
 * fetch() with a timeout and JSON convenience.
 * @param {string} url
 * @param {object} [opts]
 * @param {string} [opts.method]
 * @param {object} [opts.headers]
 * @param {string|object} [opts.body] object bodies are JSON-encoded
 * @param {number} [opts.timeout] ms
 * @returns {Promise<{status:number, data:any, headers:Headers}>}
 */
export async function request(url, opts = {}) {
	const {method = 'GET', headers = {}, body, timeout = DEFAULT_TIMEOUT} = opts;

	const controller = new AbortController();
	const timer = setTimeout(() => controller.abort(), timeout);

	let payload = body;
	const finalHeaders = {...headers};
	if (body && typeof body === 'object') {
		payload = JSON.stringify(body);
		if (!finalHeaders['Content-Type']) finalHeaders['Content-Type'] = 'application/json';
	}

	try {
		const res = await fetch(url, {method, headers: finalHeaders, body: payload, signal: controller.signal});
		const text = await res.text();
		let data = null;
		if (text) {
			try {
				data = JSON.parse(text);
			} catch {
				data = text; // non-JSON response (rare for these APIs)
			}
		}
		if (!res.ok) {
			throw new HttpError(`HTTP ${res.status} for ${url}`, res.status, data);
		}
		return {status: res.status, data, headers: res.headers};
	} catch (e) {
		if (e.name === 'AbortError') {
			throw new HttpError(`Request timed out: ${url}`, 0, null);
		}
		throw e;
	} finally {
		clearTimeout(timer);
	}
}

/** Encode an object as a query string (skips null/undefined). */
export function qs(params) {
	return Object.entries(params)
		.filter(([, v]) => v !== null && v !== undefined && v !== '')
		.map(([k, v]) => `${encodeURIComponent(k)}=${encodeURIComponent(v)}`)
		.join('&');
}

/** Sleep helper for poll loops. */
export const delay = (ms) => new Promise((r) => setTimeout(r, ms));
