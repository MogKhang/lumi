import {useState, useCallback} from 'react';
import ThemeDecorator from '@enact/limestone/ThemeDecorator';

import AppStateProvider, {useAppState} from '../state/AppState';
import PlexLoginPanel from '../views/PlexLoginPanel';
import MainShell from '../views/MainShell';

import css from './App.module.less';

// Top-level: unauthenticated users see the Plex QR sign-in; once a server is
// saved, the MainShell (left sidebar: Home/Movies/Shows/Settings) takes over and
// owns all in-app navigation, including media detail drill-down.
const Routed = () => {
	const {isAuthenticated} = useAppState();
	const [showLogin, setShowLogin] = useState(!isAuthenticated);

	const onAuthenticated = useCallback(() => setShowLogin(false), []);
	const onAddServer = useCallback(() => setShowLogin(true), []);
	// Back from login only returns to the shell if a server already exists.
	const onLoginBack = useCallback(() => {
		if (isAuthenticated) setShowLogin(false);
	}, [isAuthenticated]);

	if (showLogin) {
		return <PlexLoginPanel onBack={onLoginBack} onAuthenticated={onAuthenticated} />;
	}
	return <MainShell onAddServer={onAddServer} />;
};

const App = (props) => (
	<div {...props} className={css.app}>
		<AppStateProvider>
			<Routed />
		</AppStateProvider>
	</div>
);

export default ThemeDecorator(App);
