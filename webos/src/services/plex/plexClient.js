// Authenticated Plex client for browsing, built on a saved server record
// ({baseUrl, accessToken, clientIdentifier}). Mirrors the subset of
// lib/services/plex_client.dart that M2 needs: libraries, library content,
// home hubs, and image URLs. Plex returns a `MediaContainer` envelope.

import {request, qs} from '../http';
import {APP_NAME, PLATFORM, DEVICE_NAME, getClientIdentifier} from '../identity';

export function createPlexClient(server) {
	const baseUrl = (server.baseUrl || '').replace(/\/+$/, '');
	const token = server.accessToken;

	function headers() {
		return {
			Accept: 'application/json',
			'X-Plex-Product': APP_NAME,
			'X-Plex-Device-Name': DEVICE_NAME,
			'X-Plex-Platform': PLATFORM,
			'X-Plex-Client-Identifier': getClientIdentifier(),
			'X-Plex-Token': token
		};
	}

	async function get(path, params) {
		const query = params ? `?${qs(params)}` : '';
		const {data} = await request(`${baseUrl}${path}${query}`, {headers: headers()});
		return data && data.MediaContainer ? data.MediaContainer : {};
	}

	// Normalise a Plex metadata item to the shape our views consume.
	function mapItem(m) {
		return {
			id: m.ratingKey,
			type: m.type, // movie | show | season | episode | ...
			title: m.title,
			parentTitle: m.parentTitle,
			grandparentTitle: m.grandparentTitle,
			year: m.year,
			originallyAvailableAt: m.originallyAvailableAt,
			summary: m.summary,
			thumb: m.thumb,
			art: m.art,
			// The show's poster for episodes/seasons, so we can show it instead of
			// the episode still in Continue Watching / show contexts.
			grandparentThumb: m.grandparentThumb,
			parentThumb: m.parentThumb,
			viewOffset: m.viewOffset,
			duration: m.duration,
			leafCount: m.leafCount,
			viewedLeafCount: m.viewedLeafCount,
			parentIndex: m.parentIndex,
			index: m.index
		};
	}

	return {
		server,
		baseUrl,

		/** Image URL for a Plex thumb/art path (relative key), token-appended. */
		imageUrl(path, {width, height} = {}) {
			if (!path) return '';
			if (/^https?:\/\//.test(path)) return path;
			// Use Plex's photo transcoder when a size is requested for crisp,
			// right-sized art; otherwise return the raw token'd URL.
			if (width || height) {
				const inner = `${baseUrl}${path}?${qs({'X-Plex-Token': token})}`;
				const params = qs({
					width: width || height,
					height: height || width,
					minSize: 1,
					url: inner,
					'X-Plex-Token': token
				});
				return `${baseUrl}/photo/:/transcode?${params}`;
			}
			return `${baseUrl}${path}?${qs({'X-Plex-Token': token})}`;
		},

		/**
		 * The poster path to display for an item. For episodes (and seasons) we
		 * prefer the SHOW's poster (grandparentThumb) over the episode still, so
		 * Continue Watching shows the show artwork like the other Lumi apps.
		 */
		posterPath(item) {
			if (!item) return '';
			if (item.type === 'episode' || item.type === 'season') {
				return item.grandparentThumb || item.parentThumb || item.thumb || '';
			}
			return item.thumb || '';
		},

		/** Library sections (Movies, TV Shows, …). */
		async fetchLibraries() {
			const c = await get('/library/sections');
			const dirs = c.Directory || [];
			return dirs.map((d) => ({
				id: d.key,
				title: d.title,
				type: d.type, // movie | show | artist | photo
				thumb: d.thumb,
				art: d.art
			}));
		},

		/** All items in a library section. */
		async fetchLibraryContent(libraryId, {start = 0, size = 50} = {}) {
			const c = await get(`/library/sections/${libraryId}/all`, {
				'X-Plex-Container-Start': start,
				'X-Plex-Container-Size': size
			});
			const items = (c.Metadata || []).map(mapItem);
			return {items, total: c.totalSize ?? c.size ?? items.length};
		},

		/** Continue Watching (on deck + in-progress), like the TV home row. */
		async fetchContinueWatching({count = 20} = {}) {
			const c = await get('/hubs', {
				identifier: 'home.continue,home.ondeck',
				count,
				includeGuids: 1
			});
			const hubs = c.Hub || [];
			const seen = new Set();
			const out = [];
			for (const hub of hubs) {
				for (const m of hub.Metadata || []) {
					if (seen.has(m.ratingKey)) continue;
					seen.add(m.ratingKey);
					out.push(mapItem(m));
				}
			}
			return out;
		},

		/**
		 * All hubs pinned/promoted to the server's Home (the ones configured in
		 * Plex server settings — "Recently Added in Movies", "Recently Released",
		 * etc.). Returns an array of {key, title, items}. Excludes the
		 * continue/ondeck hubs (rendered separately as Continue Watching).
		 */
		async fetchHomeHubs({count = 16} = {}) {
			const c = await get('/hubs', {count, includeGuids: 1});
			const hubs = c.Hub || [];
			return hubs
				.filter((h) => {
					const id = h.hubIdentifier || '';
					const title = (h.title || '').toLowerCase();
					// Exclude continue/ondeck (shown as Continue Watching) and the
					// playlists hub (not wanted on Home).
					if (id.startsWith('home.continue') || id.startsWith('home.ondeck')) return false;
					if (id.startsWith('home.playlists') || id.includes('playlist')) return false;
					if (title.includes('playlist')) return false;
					return true;
				})
				.map((h) => ({
					key: h.hubIdentifier || h.title,
					title: h.title,
					items: (h.Metadata || []).map(mapItem)
				}))
				.filter((h) => h.items.length > 0);
		},

		/** Single item with children where relevant (used in M2 detail). */
		async fetchItem(id) {
			const c = await get(`/library/metadata/${id}`);
			const first = (c.Metadata || [])[0];
			return first ? mapItem(first) : null;
		},

		/** Children of a show/season (seasons or episodes). */
		async fetchChildren(parentId) {
			const c = await get(`/library/metadata/${parentId}/children`);
			return (c.Metadata || []).map(mapItem);
		}
	};
}
