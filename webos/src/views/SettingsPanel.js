// Settings tab content: account actions (switch active server, sign out) plus
// preference stubs (Theme / Language / Quality / Switch profile) wired in a
// later milestone. "Add server" re-runs the Plex sign-in.

import {useCallback} from 'react';
import BodyText from '@enact/limestone/BodyText';
import Heading from '@enact/limestone/Heading';
import Item from '@enact/limestone/Item';
import RadioItem from '@enact/limestone/RadioItem';
import {Scroller} from '@enact/limestone/Scroller';

import {useAppState} from '../state/AppState';

const SettingsPanel = ({onAddServer}) => {
	const {servers, active, switchActive, signOutAll} = useAppState();

	const onPick = useCallback((id) => () => switchActive(id), [switchActive]);

	return (
		<Scroller>
			<div style={{padding: '0 48px'}}>
				<Heading showLine>Server</Heading>
				{servers.map((s) => (
					<RadioItem key={s.id} selected={active && s.id === active.id} onClick={onPick(s.id)}>
						{s.name}
					</RadioItem>
				))}
				<Item onClick={onAddServer}>Add / switch server (sign in)…</Item>

				<Heading showLine>Preferences</Heading>
				<Item disabled>Theme</Item>
				<Item disabled>Language</Item>
				<Item disabled>Quality</Item>
				<Item disabled>Switch profile</Item>
				<BodyText size="small">These preferences will be wired up in a later milestone.</BodyText>

				<Heading showLine>Account</Heading>
				<Item onClick={signOutAll}>Sign out</Item>
			</div>
		</Scroller>
	);
};

export default SettingsPanel;
