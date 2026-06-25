// Plex PIN/QR sign-in, matching the Android TV / Apple TV pattern: on mount we
// create a PIN, render a QR code encoding the Plex auth URL, and poll until the
// user scans + approves it on their phone. On success, resolve servers and let
// the user pick one; saving it makes it the active server.

import {useState, useEffect, useRef, useCallback} from 'react';
import QRCode from 'qrcode';
import Button from '@enact/limestone/Button';
import BodyText from '@enact/limestone/BodyText';
import Heading from '@enact/limestone/Heading';
import Item from '@enact/limestone/Item';
import Spinner from '@enact/limestone/Spinner';
import {Panel, Header} from '@enact/limestone/Panels';

import {createPin, getAuthUrl, pollPinUntilClaimed, fetchServers} from '../services/plex/plexAuth';
import {useAppState} from '../state/AppState';

const QR_SIZE = 320;

const PlexLoginPanel = ({onBack, onAuthenticated, ...rest}) => {
	const {saveAllServers} = useAppState();
	const [phase, setPhase] = useState('starting'); // starting | waiting | picking | error
	const [qrDataUrl, setQrDataUrl] = useState('');
	const [servers, setServers] = useState([]);
	const [error, setError] = useState('');
	const cancelled = useRef(false);

	const start = useCallback(async () => {
		cancelled.current = false;
		setPhase('starting');
		setError('');
		setQrDataUrl('');
		try {
			const {id, code: pinCode} = await createPin();
			if (cancelled.current) return;

			// Encode the same auth URL the mobile apps use into a QR the user
			// scans with their phone. Falls back to the plain code if QR fails.
			const url = getAuthUrl(pinCode);
			try {
				const dataUrl = await QRCode.toDataURL(url, {width: QR_SIZE, margin: 1});
				if (!cancelled.current) setQrDataUrl(dataUrl);
			} catch {
				// non-fatal: the on-screen code + plex.tv/link still works
			}
			setPhase('waiting');

			const token = await pollPinUntilClaimed(id, {shouldCancel: () => cancelled.current});
			if (cancelled.current) return;
			if (!token) {
				setError('Sign-in timed out. Try again.');
				setPhase('error');
				return;
			}
			const found = await fetchServers(token);
			if (cancelled.current) return;
			if (found.length === 0) {
				setError('No Plex servers found on this account.');
				setPhase('error');
				return;
			}
			setServers(found);
			setPhase('picking');
		} catch (e) {
			if (!cancelled.current) {
				setError(e.message || 'Plex sign-in failed.');
				setPhase('error');
			}
		}
	}, []);

	useEffect(() => {
		// Defer kickoff so the effect body doesn't synchronously setState.
		const t = setTimeout(start, 0);
		return () => {
			cancelled.current = true;
			clearTimeout(t);
		};
	}, [start]);

	const pickServer = useCallback(
		(picked) => {
			// Save EVERY accessible server (so the Movies/Shows dropdowns can span
			// all of them), marking the chosen one active for the Home hubs.
			const records = servers.map((server) => {
				// Prefer a direct (non-relay, remote) connection; fall back sensibly.
				const conn =
					server.connections.find((c) => !c.relay && !c.local) ||
					server.connections.find((c) => !c.relay) ||
					server.connections[0];
				return {
					id: `plex:${server.clientIdentifier}`,
					backend: 'plex',
					name: server.name,
					baseUrl: conn ? conn.uri : '',
					accessToken: server.accessToken,
					clientIdentifier: server.clientIdentifier
				};
			});
			saveAllServers(records, `plex:${picked.clientIdentifier}`);
			onAuthenticated();
		},
		[servers, saveAllServers, onAuthenticated]
	);

	return (
		<Panel {...rest}>
			<Header title="Sign in with Plex" subtitle="Scan the QR code with your phone" />
			<div style={{padding: '0 48px'}}>
				{phase === 'starting' && <Spinner>Preparing…</Spinner>}

				{phase === 'waiting' && (
					<div style={{display: 'flex', gap: '48px', alignItems: 'center'}}>
						<div
							style={{
								background: '#fff',
								padding: '16px',
								borderRadius: '12px',
								width: QR_SIZE,
								height: QR_SIZE,
								display: 'flex',
								alignItems: 'center',
								justifyContent: 'center'
							}}
						>
							{qrDataUrl ? (
								<img src={qrDataUrl} alt="Plex sign-in QR code" width={QR_SIZE} height={QR_SIZE} />
							) : (
								<Spinner />
							)}
						</div>
						<div>
							<Heading showLine>Link your account</Heading>
							<BodyText>Scan this QR code with your phone to sign in to Plex.</BodyText>
							<div style={{marginTop: '16px'}}>
								<Spinner>Waiting for approval…</Spinner>
							</div>
							<Button onClick={onBack}>Cancel</Button>
						</div>
					</div>
				)}

				{phase === 'picking' && (
					<>
						<Heading showLine>Choose a server</Heading>
						{servers.map((s) => (
							<Item key={s.clientIdentifier} onClick={() => pickServer(s)}>
								{s.name}
							</Item>
						))}
					</>
				)}

				{phase === 'error' && (
					<>
						<BodyText>{error}</BodyText>
						<Button onClick={start}>Retry</Button>
						<Button onClick={onBack}>Back</Button>
					</>
				)}
			</div>
		</Panel>
	);
};

export default PlexLoginPanel;
