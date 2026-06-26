// Full-screen video playback (M4). Resolves the stream (direct-play or HLS
// transcode), plays it via limestone's VideoPlayer (TV controls + D-pad seek),
// resumes from the saved offset, and reports progress to Plex on a ~10s ticker
// plus on pause/stop so Continue Watching and resume stay in sync.

import {useState, useEffect, useRef, useCallback} from 'react';
import VideoPlayer from '@enact/limestone/VideoPlayer';
import Spinner from '@enact/limestone/Spinner';
import BodyText from '@enact/limestone/BodyText';
import Button from '@enact/limestone/Button';

import {useAppState} from '../state/AppState';

const REPORT_INTERVAL_MS = 10000;

const PlayerPanel = ({item, onBack}) => {
	const {client} = useAppState();
	const [info, setInfo] = useState(null); // {url, isTranscode, ratingKey, duration, offsetMs, title}
	const [error, setError] = useState('');
	const videoRef = useRef(null);
	const lastTimeMs = useRef(0);
	const durationMs = useRef(0);
	const resumed = useRef(false);
	const reportTimer = useRef(null);

	// Resolve the playback URL once.
	useEffect(() => {
		let cancelled = false;
		(async () => {
			try {
				const pb = await client.getPlaybackInfo(item.id);
				if (!cancelled) {
					durationMs.current = pb.duration || 0;
					lastTimeMs.current = pb.offsetMs || 0;
					setInfo(pb);
				}
			} catch (e) {
				if (!cancelled) setError(e.message || 'Could not start playback.');
			}
		})();
		return () => {
			cancelled = true;
		};
	}, [client, item]);

	const report = useCallback(
		(state) => {
			if (!info) return;
			client.reportTimeline(info.ratingKey, {
				timeMs: lastTimeMs.current,
				state,
				durationMs: durationMs.current
			});
		},
		[client, info]
	);

	// Periodic progress reporting while playing.
	useEffect(() => {
		if (!info) return undefined;
		reportTimer.current = setInterval(() => report('playing'), REPORT_INTERVAL_MS);
		return () => {
			if (reportTimer.current) clearInterval(reportTimer.current);
			// Final stop report on unmount (back/exit).
			report('stopped');
		};
	}, [info, report]);

	const onLoadedMetadata = useCallback(() => {
		// Resume: seek to the saved offset once the media is ready. For a
		// transcode the server already started at the offset, so only seek for
		// direct play.
		if (resumed.current) return;
		resumed.current = true;
		if (info && !info.isTranscode && info.offsetMs > 1000 && videoRef.current) {
			const media = videoRef.current.getMediaState ? videoRef.current.getMediaState() : null;
			const video = videoRef.current.getVideoNode ? videoRef.current.getVideoNode() : null;
			const node = (video && video.node) || (media && media.node);
			if (node) node.currentTime = info.offsetMs / 1000;
		}
	}, [info]);

	const onTimeUpdate = useCallback((ev) => {
		const t = ev && ev.currentTime;
		const d = ev && ev.duration;
		if (typeof t === 'number') lastTimeMs.current = t * 1000;
		if (typeof d === 'number' && d > 0) durationMs.current = d * 1000;
	}, []);

	const onPause = useCallback(() => report('paused'), [report]);
	const onPlay = useCallback(() => report('playing'), [report]);
	const onEnded = useCallback(() => {
		report('stopped');
		onBack();
	}, [report, onBack]);

	// Surface media-element errors (the most common cause of a black screen:
	// CORS/mixed-content block, unsupported codec, or a bad URL).
	const onVideoError = useCallback(() => {
		const node =
			videoRef.current && videoRef.current.getVideoNode ? videoRef.current.getVideoNode() : null;
		const code = node && node.error ? node.error.code : '?';
		setError(`Playback error (media code ${code}). URL: ${info ? info.url : ''}`);
	}, [info]);

	if (error) {
		return (
			<div style={{padding: '48px'}}>
				<BodyText>{error}</BodyText>
				<Button onClick={onBack}>Back</Button>
			</div>
		);
	}
	if (!info) {
		return (
			<div style={{display: 'flex', height: '100%', alignItems: 'center', justifyContent: 'center'}}>
				<Spinner>Preparing playback…</Spinner>
			</div>
		);
	}

	return (
		<div style={{position: 'fixed', inset: 0, background: '#000', zIndex: 100}}>
			<VideoPlayer
				ref={videoRef}
				title={info.title || item.title}
				source={info.url}
				onBack={onBack}
				onLoadedMetadata={onLoadedMetadata}
				onTimeUpdate={onTimeUpdate}
				onPause={onPause}
				onPlay={onPlay}
				onEnded={onEnded}
				onError={onVideoError}
				autoCloseTimeout={5000}
			/>
		</div>
	);
};

export default PlayerPanel;
