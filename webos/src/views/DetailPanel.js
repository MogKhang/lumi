// Item detail: artwork, summary, and (for shows/seasons) a row of children
// (seasons or episodes). Play is wired in M4 — for now it's a disabled stub so
// the navigation and metadata are fully testable.

import {useState, useEffect, useCallback} from 'react';
import BodyText from '@enact/limestone/BodyText';
import Button from '@enact/limestone/Button';
import Heading from '@enact/limestone/Heading';
import Image from '@enact/limestone/Image';
import Spinner from '@enact/limestone/Spinner';
import {Panel, Header} from '@enact/limestone/Panels';

import MediaRow from '../components/MediaRow';
import {useAppState} from '../state/AppState';

const DetailPanel = ({item, onOpenItem, onBack, ...rest}) => {
	const {client} = useAppState();
	const [full, setFull] = useState(item);
	const [children, setChildren] = useState([]);
	const [loading, setLoading] = useState(true);

	const load = useCallback(async () => {
		if (!client || !item) return;
		setLoading(true);
		try {
			const detail = (await client.fetchItem(item.id)) || item;
			setFull(detail);
			// Shows/seasons have children (seasons/episodes); movies/episodes don't.
			if (detail.type === 'show' || detail.type === 'season') {
				const kids = await client.fetchChildren(item.id).catch(() => []);
				setChildren(kids);
			} else {
				setChildren([]);
			}
		} finally {
			setLoading(false);
		}
	}, [client, item]);

	useEffect(() => {
		const t = setTimeout(load, 0);
		return () => clearTimeout(t);
	}, [load]);

	const imageFor = useCallback(
		(it) => (client ? client.imageUrl(it.thumb, {width: 200, height: 300}) : ''),
		[client]
	);

	const art = client ? client.imageUrl(full.art || full.thumb, {width: 640, height: 360}) : '';
	const childrenTitle = full.type === 'show' ? 'Seasons' : 'Episodes';

	return (
		<Panel {...rest}>
			<Header
				title={full.title || ''}
				subtitle={full.year ? String(full.year) : ''}
				slotBefore={onBack ? <Button icon="arrowhookleft" onClick={onBack} aria-label="Back" /> : null}
			/>
			<div style={{padding: '0 48px'}}>
				{loading && <Spinner>Loading…</Spinner>}
				{!loading && (
					<>
						<div style={{display: 'flex', gap: '32px'}}>
							{art ? <Image src={art} style={{width: 480, height: 270, borderRadius: '8px'}} /> : null}
							<div style={{flex: 1}}>
								<BodyText>{full.summary || 'No description available.'}</BodyText>
								<div style={{marginTop: '16px'}}>
									{/* Playback arrives in M4. */}
									<Button disabled>Play (coming in M4)</Button>
								</div>
							</div>
						</div>

						{children.length > 0 && (
							<div style={{marginTop: '24px'}}>
								<Heading showLine>{childrenTitle}</Heading>
								<MediaRow title="" items={children} imageFor={imageFor} onSelect={onOpenItem} />
							</div>
						)}
					</>
				)}
			</div>
		</Panel>
	);
};

export default DetailPanel;
