/* global MediaSource */
// Plex playback URL construction + a webOS direct-play capability check.
//
// Strategy (per the project plan): DIRECT-PLAY first when the TV can decode the
// source container/codecs, otherwise fall back to a server HLS TRANSCODE.
//   - Direct play: stream the original Part file: {baseUrl}{part.key}?X-Plex-Token
//   - Transcode:  /video/:/transcode/universal/start.m3u8?... (HLS, played
//     natively by webOS <video>).
//
// webOS 22 hardware reliably decodes H.264/HEVC video and AAC/AC3/EAC3 audio in
// mp4/mkv/ts containers; anything outside that we transcode.

import {qs} from '../http';
import {APP_NAME, APP_VERSION, PLATFORM, getClientIdentifier} from '../identity';

const DIRECT_VIDEO = ['h264', 'hevc', 'h265'];
const DIRECT_AUDIO = ['aac', 'ac3', 'eac3', 'mp3'];
const DIRECT_CONTAINERS = ['mp4', 'mkv', 'mov', 'm4v', 'ts'];

/**
 * Decide whether the TV can direct-play this media, using the source codecs and
 * a MediaSource.isTypeSupported probe where possible.
 * @param {{container?:string, videoCodec?:string, audioCodec?:string}} media
 */
export function canDirectPlay(media) {
	if (!media) return false;
	const v = (media.videoCodec || '').toLowerCase();
	const a = (media.audioCodec || '').toLowerCase();
	const c = (media.container || '').toLowerCase();

	const codecOk = DIRECT_VIDEO.includes(v) && DIRECT_AUDIO.includes(a) && DIRECT_CONTAINERS.includes(c);
	if (!codecOk) return false;

	// Best-effort confirmation via MSE. Map to an mp4 codec string; if the API
	// is unavailable (older WebKit) trust the codec allow-list above.
	try {
		if (typeof MediaSource !== 'undefined' && MediaSource.isTypeSupported) {
			const vc = v === 'h264' ? 'avc1.640028' : 'hvc1.1.6.L93.B0';
			const probe = `video/mp4; codecs="${vc}"`;
			return MediaSource.isTypeSupported(probe);
		}
	} catch {
		// ignore and fall through to the allow-list result
	}
	return true;
}

/** Direct-play URL for a Part (original file), token-appended. */
export function directPlayUrl(baseUrl, partKey, token) {
	if (!partKey) return '';
	return `${baseUrl}${partKey}?${qs({'X-Plex-Token': token})}`;
}

/**
 * Build the HLS transcode start URL. Mirrors the Dart universal-transcoder
 * params, trimmed to what webOS needs. `offsetMs` resumes from a position.
 */
export function transcodeUrl(baseUrl, ratingKey, token, {offsetMs = 0, maxVideoBitrate} = {}) {
	const session = getClientIdentifier();
	const profileExtra =
		'add-transcode-target(type=videoProfile&context=streaming' +
		'&protocol=hls&container=mpegts&videoCodec=h264%2Chevc&audioCodec=aac)';

	const params = {
		hasMDE: '1',
		path: `/library/metadata/${ratingKey}`,
		mediaIndex: '0',
		partIndex: '0',
		protocol: 'hls',
		fastSeek: '1',
		directPlay: '0',
		directStream: '1',
		subtitleSize: '100',
		audioBoost: '100',
		location: 'lan',
		autoAdjustQuality: '0',
		mediaBufferSize: '102400',
		session,
		subtitles: 'none',
		copyts: '1',
		'X-Plex-Client-Profile-Extra': profileExtra,
		'X-Plex-Incomplete-Segments': '1',
		'X-Plex-Product': APP_NAME,
		'X-Plex-Version': APP_VERSION,
		'X-Plex-Client-Identifier': getClientIdentifier(),
		'X-Plex-Platform': PLATFORM,
		'X-Plex-Session-Identifier': session,
		'X-Plex-Token': token
	};
	if (offsetMs > 0) params.offset = String(Math.floor(offsetMs / 1000));
	if (maxVideoBitrate) params.maxVideoBitrate = String(maxVideoBitrate);

	return `${baseUrl}/video/:/transcode/universal/start.m3u8?${qs(params)}`;
}
