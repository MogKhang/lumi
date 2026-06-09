///
/// Generated file. Do not edit.
///
// coverage:ignore-file
// ignore_for_file: type=lint, unused_import
// dart format off

part of 'strings.g.dart';

// Path: <root>
typedef TranslationsEn = Translations; // ignore: unused_element
class Translations with BaseTranslations<AppLocale, Translations> {
	/// Returns the current translations of the given [context].
	///
	/// Usage:
	/// final t = Translations.of(context);
	static Translations of(BuildContext context) => InheritedLocaleData.of<AppLocale, Translations>(context).translations;

	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	Translations({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver, TranslationMetadata<AppLocale, Translations>? meta})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = meta ?? TranslationMetadata(
		    locale: AppLocale.en,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ) {
		$meta.setFlatMapFunction(_flatMapFunction);
	}

	/// Metadata for the translations of <en>.
	@override final TranslationMetadata<AppLocale, Translations> $meta;

	/// Access flat map
	dynamic operator[](String key) => $meta.getTranslation(key);

	late final Translations _root = this; // ignore: unused_field

	Translations $copyWith({TranslationMetadata<AppLocale, Translations>? meta}) => Translations(meta: meta ?? this.$meta);

	// Translations
	late final TranslationsAppEn app = TranslationsAppEn.internal(_root);
	late final TranslationsAuthEn auth = TranslationsAuthEn.internal(_root);
	late final TranslationsCommonEn common = TranslationsCommonEn.internal(_root);
	late final TranslationsScreensEn screens = TranslationsScreensEn.internal(_root);
	late final TranslationsUpdateEn update = TranslationsUpdateEn.internal(_root);
	late final TranslationsMediaDetailEn mediaDetail = TranslationsMediaDetailEn.internal(_root);
	late final TranslationsSettingsEn settings = TranslationsSettingsEn.internal(_root);
	late final TranslationsSearchEn search = TranslationsSearchEn.internal(_root);
	late final TranslationsHotkeysEn hotkeys = TranslationsHotkeysEn.internal(_root);
	late final TranslationsFileInfoEn fileInfo = TranslationsFileInfoEn.internal(_root);
	late final TranslationsMediaMenuEn mediaMenu = TranslationsMediaMenuEn.internal(_root);
	late final TranslationsAccessibilityEn accessibility = TranslationsAccessibilityEn.internal(_root);
	late final TranslationsTooltipsEn tooltips = TranslationsTooltipsEn.internal(_root);
	late final TranslationsVideoControlsEn videoControls = TranslationsVideoControlsEn.internal(_root);
	late final TranslationsUserStatusEn userStatus = TranslationsUserStatusEn.internal(_root);
	late final TranslationsMessagesEn messages = TranslationsMessagesEn.internal(_root);
	late final TranslationsSubtitlingStylingEn subtitlingStyling = TranslationsSubtitlingStylingEn.internal(_root);
	late final TranslationsMpvConfigEn mpvConfig = TranslationsMpvConfigEn.internal(_root);
	late final TranslationsDialogEn dialog = TranslationsDialogEn.internal(_root);
	late final TranslationsProfilesEn profiles = TranslationsProfilesEn.internal(_root);
	late final TranslationsConnectionsEn connections = TranslationsConnectionsEn.internal(_root);
	late final TranslationsDiscoverEn discover = TranslationsDiscoverEn.internal(_root);
	late final TranslationsErrorsEn errors = TranslationsErrorsEn.internal(_root);
	late final TranslationsLibrariesEn libraries = TranslationsLibrariesEn.internal(_root);
	late final TranslationsAboutEn about = TranslationsAboutEn.internal(_root);
	late final TranslationsServerSelectionEn serverSelection = TranslationsServerSelectionEn.internal(_root);
	late final TranslationsHubDetailEn hubDetail = TranslationsHubDetailEn.internal(_root);
	late final TranslationsLogsEn logs = TranslationsLogsEn.internal(_root);
	late final TranslationsLicensesEn licenses = TranslationsLicensesEn.internal(_root);
	late final TranslationsNavigationEn navigation = TranslationsNavigationEn.internal(_root);
	late final TranslationsLiveTvEn liveTv = TranslationsLiveTvEn.internal(_root);
	late final TranslationsGenresEn genres = TranslationsGenresEn.internal(_root);
	late final TranslationsCollectionsEn collections = TranslationsCollectionsEn.internal(_root);
	late final TranslationsPlaylistsEn playlists = TranslationsPlaylistsEn.internal(_root);
	late final TranslationsDownloadsEn downloads = TranslationsDownloadsEn.internal(_root);
	late final TranslationsShadersEn shaders = TranslationsShadersEn.internal(_root);
	late final TranslationsCompanionRemoteEn companionRemote = TranslationsCompanionRemoteEn.internal(_root);
	late final TranslationsVideoSettingsEn videoSettings = TranslationsVideoSettingsEn.internal(_root);
	late final TranslationsExternalPlayerEn externalPlayer = TranslationsExternalPlayerEn.internal(_root);
	late final TranslationsMetadataEditEn metadataEdit = TranslationsMetadataEditEn.internal(_root);
	late final TranslationsMatchScreenEn matchScreen = TranslationsMatchScreenEn.internal(_root);
	late final TranslationsServerTasksEn serverTasks = TranslationsServerTasksEn.internal(_root);
	late final TranslationsAddServerEn addServer = TranslationsAddServerEn.internal(_root);
	late final TranslationsLanguagesEn languages = TranslationsLanguagesEn.internal(_root);
}

// Path: app
class TranslationsAppEn {
	TranslationsAppEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Lumi'
	String get title => 'Lumi';

	/// en: 'App coi phim dỏm nhất Việt Nam'
	String get tagline => 'App coi phim dỏm nhất Việt Nam';
}

// Path: auth
class TranslationsAuthEn {
	TranslationsAuthEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Sign in'
	String get signIn => 'Sign in';

	/// en: 'Sign in with Plex'
	String get signInWithPlex => 'Sign in with Plex';

	/// en: 'Show QR Code'
	String get showQRCode => 'Show QR Code';

	/// en: 'Authenticate'
	String get authenticate => 'Authenticate';

	/// en: 'Authentication timed out. Please try again.'
	String get authenticationTimeout => 'Authentication timed out. Please try again.';

	/// en: 'Scan this QR code to sign in'
	String get scanQRToSignIn => 'Scan this QR code to sign in';

	/// en: 'Waiting for authentication... Please complete sign-in in your browser.'
	String get waitingForAuth => 'Waiting for authentication...\nPlease complete sign-in in your browser.';

	/// en: 'Use browser'
	String get useBrowser => 'Use browser';

	/// en: 'or'
	String get or => 'or';

	/// en: 'Connect to Jellyfin'
	String get connectToJellyfin => 'Connect to Jellyfin';

	/// en: 'Use Quick Connect'
	String get useQuickConnect => 'Use Quick Connect';

	/// en: 'Quick Connect code'
	String get quickConnectCode => 'Quick Connect code';

	/// en: 'Open your Jellyfin server in a web browser, sign in, and choose Quick Connect from the user menu. Enter this code to approve sign-in.'
	String get quickConnectInstructions => 'Open your Jellyfin server in a web browser, sign in, and choose Quick Connect from the user menu. Enter this code to approve sign-in.';

	/// en: 'Waiting for approval…'
	String get quickConnectWaiting => 'Waiting for approval…';

	/// en: 'Cancel'
	String get quickConnectCancel => 'Cancel';

	/// en: 'Quick Connect code expired before approval. Please try again.'
	String get quickConnectExpired => 'Quick Connect code expired before approval. Please try again.';
}

// Path: common
class TranslationsCommonEn {
	TranslationsCommonEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Cancel'
	String get cancel => 'Cancel';

	/// en: 'Save'
	String get save => 'Save';

	/// en: 'Close'
	String get close => 'Close';

	/// en: 'Clear'
	String get clear => 'Clear';

	/// en: 'Reset'
	String get reset => 'Reset';

	/// en: 'Later'
	String get later => 'Later';

	/// en: 'Submit'
	String get submit => 'Submit';

	/// en: 'Confirm'
	String get confirm => 'Confirm';

	/// en: 'Retry'
	String get retry => 'Retry';

	/// en: 'Logout'
	String get logout => 'Logout';

	/// en: 'Unknown'
	String get unknown => 'Unknown';

	/// en: 'Refresh'
	String get refresh => 'Refresh';

	/// en: 'Yes'
	String get yes => 'Yes';

	/// en: 'No'
	String get no => 'No';

	/// en: 'Delete'
	String get delete => 'Delete';

	/// en: 'Shuffle'
	String get shuffle => 'Shuffle';

	/// en: 'Add to...'
	String get addTo => 'Add to...';

	/// en: 'Create new'
	String get createNew => 'Create new';

	/// en: 'Connect'
	String get connect => 'Connect';

	/// en: 'Disconnect'
	String get disconnect => 'Disconnect';

	/// en: 'Play'
	String get play => 'Play';

	/// en: 'Pause'
	String get pause => 'Pause';

	/// en: 'Resume'
	String get resume => 'Resume';

	/// en: 'Error'
	String get error => 'Error';

	/// en: 'Search'
	String get search => 'Search';

	/// en: 'Home'
	String get home => 'Home';

	/// en: 'Back'
	String get back => 'Back';

	/// en: 'Settings'
	String get settings => 'Settings';

	/// en: 'Mute'
	String get mute => 'Mute';

	/// en: 'OK'
	String get ok => 'OK';

	/// en: 'Reconnect'
	String get reconnect => 'Reconnect';

	/// en: 'Exit'
	String get exit => 'Exit';

	/// en: 'View All'
	String get viewAll => 'View All';

	/// en: 'Checking network...'
	String get checkingNetwork => 'Checking network...';

	/// en: 'Refreshing servers...'
	String get refreshingServers => 'Refreshing servers...';

	/// en: 'Loading servers...'
	String get loadingServers => 'Loading servers...';

	/// en: 'Connecting to servers...'
	String get connectingToServers => 'Connecting to servers...';

	/// en: 'Starting offline mode...'
	String get startingOfflineMode => 'Starting offline mode...';

	/// en: 'Loading...'
	String get loading => 'Loading...';

	/// en: 'Fullscreen'
	String get fullscreen => 'Fullscreen';

	/// en: 'Exit fullscreen'
	String get exitFullscreen => 'Exit fullscreen';

	/// en: 'Press back again to exit'
	String get pressBackAgainToExit => 'Press back again to exit';

	/// en: 'Done'
	String get done => 'Done';
}

// Path: screens
class TranslationsScreensEn {
	TranslationsScreensEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Licenses'
	String get licenses => 'Licenses';

	/// en: 'Switch Profile'
	String get switchProfile => 'Switch Profile';

	/// en: 'Subtitle Styling'
	String get subtitleStyling => 'Subtitle Styling';

	/// en: 'mpv.conf'
	String get mpvConfig => 'mpv.conf';

	/// en: 'Logs'
	String get logs => 'Logs';
}

// Path: update
class TranslationsUpdateEn {
	TranslationsUpdateEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Update Available'
	String get available => 'Update Available';

	/// en: 'Version ${version} is available'
	String versionAvailable({required Object version}) => 'Version ${version} is available';

	/// en: 'Current: ${version}'
	String currentVersion({required Object version}) => 'Current: ${version}';

	/// en: 'Skip This Version'
	String get skipVersion => 'Skip This Version';

	/// en: 'View Release'
	String get viewRelease => 'View Release';

	/// en: 'You are on the latest version'
	String get latestVersion => 'You are on the latest version';

	/// en: 'Failed to check for updates'
	String get checkFailed => 'Failed to check for updates';
}

// Path: mediaDetail
class TranslationsMediaDetailEn {
	TranslationsMediaDetailEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Watch Now'
	String get watchNow => 'Watch Now';

	/// en: 'Add to Playlist'
	String get addToPlaylist => 'Add to Playlist';

	/// en: 'Plot'
	String get plot => 'Plot';

	/// en: 'Season'
	String get season => 'Season';

	/// en: 'Episodes'
	String get episodes => 'Episodes';

	/// en: 'Episode'
	String get episode => 'Episode';

	/// en: 'Episodes'
	String get episodesListHeader => 'Episodes';

	/// en: 'Seasons'
	String get seasonsColumn => 'Seasons';
}

// Path: settings
class TranslationsSettingsEn {
	TranslationsSettingsEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Settings'
	String get title => 'Settings';

	/// en: 'Support Lumi'
	String get supportDeveloper => 'Support Lumi';

	/// en: 'Donate via Liberapay to fund development'
	String get supportDeveloperDescription => 'Donate via Liberapay to fund development';

	/// en: 'Language'
	String get language => 'Language';

	/// en: 'Theme'
	String get theme => 'Theme';

	/// en: 'Appearance'
	String get appearance => 'Appearance';

	/// en: 'Video Playback'
	String get videoPlayback => 'Video Playback';

	/// en: 'Configure playback behavior'
	String get videoPlaybackDescription => 'Configure playback behavior';

	/// en: 'Advanced'
	String get advanced => 'Advanced';

	/// en: 'Episode Poster Style'
	String get episodePosterMode => 'Episode Poster Style';

	/// en: 'Series Poster'
	String get seriesPoster => 'Series Poster';

	/// en: 'Season Poster'
	String get seasonPoster => 'Season Poster';

	/// en: 'Thumbnail'
	String get episodeThumbnail => 'Thumbnail';

	/// en: 'Display featured content carousel on home screen'
	String get showHeroSectionDescription => 'Display featured content carousel on home screen';

	/// en: 'Seconds'
	String get secondsLabel => 'Seconds';

	/// en: 'Minutes'
	String get minutesLabel => 'Minutes';

	/// en: 's'
	String get secondsShort => 's';

	/// en: 'm'
	String get minutesShort => 'm';

	/// en: 'Enter duration (${min}-${max})'
	String durationHint({required Object min, required Object max}) => 'Enter duration (${min}-${max})';

	/// en: 'System'
	String get systemTheme => 'System';

	/// en: 'Light'
	String get lightTheme => 'Light';

	/// en: 'Dark'
	String get darkTheme => 'Dark';

	/// en: 'OLED'
	String get oledTheme => 'OLED';

	/// en: 'Library Density'
	String get libraryDensity => 'Library Density';

	/// en: 'Compact'
	String get compact => 'Compact';

	/// en: 'Comfortable'
	String get comfortable => 'Comfortable';

	/// en: 'View Mode'
	String get viewMode => 'View Mode';

	/// en: 'Grid'
	String get gridView => 'Grid';

	/// en: 'List'
	String get listView => 'List';

	/// en: 'Show Hero Section'
	String get showHeroSection => 'Show Hero Section';

	/// en: 'Use Home Layout'
	String get useGlobalHubs => 'Use Home Layout';

	/// en: 'Show home page hubs like the official client. When off, shows per-library recommendations instead.'
	String get useGlobalHubsDescription => 'Show home page hubs like the official client. When off, shows per-library recommendations instead.';

	/// en: 'Show Server Name on Hubs'
	String get showServerNameOnHubs => 'Show Server Name on Hubs';

	/// en: 'Always display the server name in hub titles. When off, only shows for duplicate hub names.'
	String get showServerNameOnHubsDescription => 'Always display the server name in hub titles. When off, only shows for duplicate hub names.';

	/// en: 'Group Libraries by Server'
	String get groupLibrariesByServer => 'Group Libraries by Server';

	/// en: 'Show a header for each media server in the sidebar when you're connected to multiple servers.'
	String get groupLibrariesByServerDescription => 'Show a header for each media server in the sidebar when you\'re connected to multiple servers.';

	/// en: 'Always Keep Sidebar Open'
	String get alwaysKeepSidebarOpen => 'Always Keep Sidebar Open';

	/// en: 'Sidebar stays expanded and content area adjusts to fit'
	String get alwaysKeepSidebarOpenDescription => 'Sidebar stays expanded and content area adjusts to fit';

	/// en: 'Show Unwatched Count'
	String get showUnwatchedCount => 'Show Unwatched Count';

	/// en: 'Display unwatched episode count on shows and seasons'
	String get showUnwatchedCountDescription => 'Display unwatched episode count on shows and seasons';

	/// en: 'Show Episode Number on Cards'
	String get showEpisodeNumberOnCards => 'Show Episode Number on Cards';

	/// en: 'Show episode number alongside the season (e.g. S2 E3) on episode cards'
	String get showEpisodeNumberOnCardsDescription => 'Show episode number alongside the season (e.g. S2 E3) on episode cards';

	/// en: 'Show Season Posters on Tabs'
	String get showSeasonPostersOnTabs => 'Show Season Posters on Tabs';

	/// en: 'Display the season's poster above each season tab on a show's detail page'
	String get showSeasonPostersOnTabsDescription => 'Display the season\'s poster above each season tab on a show\'s detail page';

	/// en: 'Hide Spoilers for Unwatched Episodes'
	String get hideSpoilers => 'Hide Spoilers for Unwatched Episodes';

	/// en: 'Blur thumbnails and hide descriptions for episodes you haven't watched yet'
	String get hideSpoilersDescription => 'Blur thumbnails and hide descriptions for episodes you haven\'t watched yet';

	/// en: 'Player Backend'
	String get playerBackend => 'Player Backend';

	/// en: 'Audio Language'
	String get audioLanguage => 'Audio Language';

	/// en: 'None'
	String get none => 'None';

	/// en: 'Advanced (Recommended)'
	String get exoPlayer => 'Advanced (Recommended)';

	/// en: 'Standard'
	String get mpv => 'Standard';

	/// en: 'Hardware Decoding'
	String get hardwareDecoding => 'Hardware Decoding';

	/// en: 'Use hardware acceleration when available'
	String get hardwareDecodingDescription => 'Use hardware acceleration when available';

	/// en: 'Buffer Size'
	String get bufferSize => 'Buffer Size';

	/// en: '${size}MB'
	String bufferSizeMB({required Object size}) => '${size}MB';

	/// en: 'Auto (Recommended)'
	String get bufferSizeAuto => 'Auto (Recommended)';

	/// en: 'Your device has ${heap}MB of memory. A ${size}MB buffer may cause playback issues.'
	String bufferSizeWarning({required Object heap, required Object size}) => 'Your device has ${heap}MB of memory. A ${size}MB buffer may cause playback issues.';

	/// en: 'Default Quality'
	String get defaultQualityTitle => 'Default Quality';

	/// en: 'Used when starting playback. Lower values reduce bandwidth.'
	String get defaultQualityDescription => 'Used when starting playback. Lower values reduce bandwidth.';

	/// en: 'Switch Server'
	String get switchServer => 'Switch Server';

	/// en: 'Subtitle Styling'
	String get subtitleStyling => 'Subtitle Styling';

	/// en: 'Customize subtitle appearance'
	String get subtitleStylingDescription => 'Customize subtitle appearance';

	/// en: 'Small Skip Duration'
	String get smallSkipDuration => 'Small Skip Duration';

	/// en: 'Large Skip Duration'
	String get largeSkipDuration => 'Large Skip Duration';

	/// en: 'Rewind on Resume'
	String get rewindOnResume => 'Rewind on Resume';

	/// en: '${seconds} seconds'
	String secondsUnit({required Object seconds}) => '${seconds} seconds';

	/// en: 'Default Sleep Timer'
	String get defaultSleepTimer => 'Default Sleep Timer';

	/// en: '${minutes} minutes'
	String minutesUnit({required Object minutes}) => '${minutes} minutes';

	/// en: 'Remember track selections per show/movie'
	String get rememberTrackSelections => 'Remember track selections per show/movie';

	/// en: 'Automatically save audio and subtitle language preferences when you change tracks during playback'
	String get rememberTrackSelectionsDescription => 'Automatically save audio and subtitle language preferences when you change tracks during playback';

	/// en: 'Show chapter markers on seek bar'
	String get showChapterMarkersOnTimeline => 'Show chapter markers on seek bar';

	/// en: 'Segment the seek bar at chapter boundaries'
	String get showChapterMarkersOnTimelineDescription => 'Segment the seek bar at chapter boundaries';

	/// en: 'Click on video to toggle play/pause'
	String get clickVideoTogglesPlayback => 'Click on video to toggle play/pause';

	/// en: 'If enabled, clicking on the video player will play/pause the video. Otherwise, clicking will show/hide the playback controls.'
	String get clickVideoTogglesPlaybackDescription => 'If enabled, clicking on the video player will play/pause the video. Otherwise, clicking will show/hide the playback controls.';

	/// en: 'Video Player Controls'
	String get videoPlayerControls => 'Video Player Controls';

	/// en: 'Keyboard Shortcuts'
	String get keyboardShortcuts => 'Keyboard Shortcuts';

	/// en: 'Customize keyboard shortcuts'
	String get keyboardShortcutsDescription => 'Customize keyboard shortcuts';

	/// en: 'Video Player Navigation'
	String get videoPlayerNavigation => 'Video Player Navigation';

	/// en: 'Use arrow keys to navigate video player controls'
	String get videoPlayerNavigationDescription => 'Use arrow keys to navigate video player controls';

	/// en: 'Debug Logging'
	String get debugLogging => 'Debug Logging';

	/// en: 'Enable detailed logging for troubleshooting'
	String get debugLoggingDescription => 'Enable detailed logging for troubleshooting';

	/// en: 'View Logs'
	String get viewLogs => 'View Logs';

	/// en: 'View application logs'
	String get viewLogsDescription => 'View application logs';

	/// en: 'Clear Cache'
	String get clearCache => 'Clear Cache';

	/// en: 'This will clear all cached images and data. The app may take longer to load content after clearing the cache.'
	String get clearCacheDescription => 'This will clear all cached images and data. The app may take longer to load content after clearing the cache.';

	/// en: 'Cache cleared successfully'
	String get clearCacheSuccess => 'Cache cleared successfully';

	/// en: 'Reset Settings'
	String get resetSettings => 'Reset Settings';

	/// en: 'This will reset all settings to their default values. This action cannot be undone.'
	String get resetSettingsDescription => 'This will reset all settings to their default values. This action cannot be undone.';

	/// en: 'Settings reset successfully'
	String get resetSettingsSuccess => 'Settings reset successfully';

	/// en: 'Backup'
	String get backup => 'Backup';

	/// en: 'Export Settings'
	String get exportSettings => 'Export Settings';

	/// en: 'Save your preferences to a file'
	String get exportSettingsDescription => 'Save your preferences to a file';

	/// en: 'Settings exported'
	String get exportSettingsSuccess => 'Settings exported';

	/// en: 'Could not export settings'
	String get exportSettingsFailed => 'Could not export settings';

	/// en: 'Import Settings'
	String get importSettings => 'Import Settings';

	/// en: 'Restore preferences from a file'
	String get importSettingsDescription => 'Restore preferences from a file';

	/// en: 'This will replace your current settings. Continue?'
	String get importSettingsConfirm => 'This will replace your current settings. Continue?';

	/// en: 'Settings imported'
	String get importSettingsSuccess => 'Settings imported';

	/// en: 'Could not import settings'
	String get importSettingsFailed => 'Could not import settings';

	/// en: 'This file isn't a valid Lumi settings export'
	String get importSettingsInvalidFile => 'This file isn\'t a valid Lumi settings export';

	/// en: 'Sign in before importing settings'
	String get importSettingsNoUser => 'Sign in before importing settings';

	/// en: 'Shortcuts reset to defaults'
	String get shortcutsReset => 'Shortcuts reset to defaults';

	/// en: 'About'
	String get about => 'About';

	/// en: 'App information and licenses'
	String get aboutDescription => 'App information and licenses';

	/// en: 'Updates'
	String get updates => 'Updates';

	/// en: 'Update Available'
	String get updateAvailable => 'Update Available';

	/// en: 'Check for Updates'
	String get checkForUpdates => 'Check for Updates';

	/// en: 'Automatically check for updates on startup'
	String get autoCheckUpdatesOnStartup => 'Automatically check for updates on startup';

	/// en: 'Show a notification when a new version is available at launch'
	String get autoCheckUpdatesOnStartupDescription => 'Show a notification when a new version is available at launch';

	/// en: 'Please enter a valid number'
	String get validationErrorEnterNumber => 'Please enter a valid number';

	/// en: 'Duration must be between ${min} and ${max} ${unit}'
	String validationErrorDuration({required Object min, required Object max, required Object unit}) => 'Duration must be between ${min} and ${max} ${unit}';

	/// en: 'Shortcut already assigned to ${action}'
	String shortcutAlreadyAssigned({required Object action}) => 'Shortcut already assigned to ${action}';

	/// en: 'Shortcut updated for ${action}'
	String shortcutUpdated({required Object action}) => 'Shortcut updated for ${action}';

	/// en: 'Auto Skip'
	String get autoSkip => 'Auto Skip';

	/// en: 'Auto Skip Intro'
	String get autoSkipIntro => 'Auto Skip Intro';

	/// en: 'Automatically skip intro markers after a few seconds'
	String get autoSkipIntroDescription => 'Automatically skip intro markers after a few seconds';

	/// en: 'Auto Skip Credits'
	String get autoSkipCredits => 'Auto Skip Credits';

	/// en: 'Automatically skip credits and play next episode'
	String get autoSkipCreditsDescription => 'Automatically skip credits and play next episode';

	/// en: 'Force Fallback Markers'
	String get forceSkipMarkerFallback => 'Force Fallback Markers';

	/// en: 'Use chapter title patterns for skip markers even when Plex provides native markers'
	String get forceSkipMarkerFallbackDescription => 'Use chapter title patterns for skip markers even when Plex provides native markers';

	/// en: 'Auto Skip Delay'
	String get autoSkipDelay => 'Auto Skip Delay';

	/// en: 'Wait ${seconds} seconds before auto-skipping'
	String autoSkipDelayDescription({required Object seconds}) => 'Wait ${seconds} seconds before auto-skipping';

	/// en: 'Intro Marker Pattern'
	String get introPattern => 'Intro Marker Pattern';

	/// en: 'Regex pattern to match intro markers in chapter titles'
	String get introPatternDescription => 'Regex pattern to match intro markers in chapter titles';

	/// en: 'Credits Marker Pattern'
	String get creditsPattern => 'Credits Marker Pattern';

	/// en: 'Regex pattern to match credits markers in chapter titles'
	String get creditsPatternDescription => 'Regex pattern to match credits markers in chapter titles';

	/// en: 'Invalid regular expression'
	String get invalidRegex => 'Invalid regular expression';

	/// en: 'Downloads'
	String get downloads => 'Downloads';

	/// en: 'Choose where to store downloaded content'
	String get downloadLocationDescription => 'Choose where to store downloaded content';

	/// en: 'Default (App Storage)'
	String get downloadLocationDefault => 'Default (App Storage)';

	/// en: 'Custom Location'
	String get downloadLocationCustom => 'Custom Location';

	/// en: 'Select Folder'
	String get selectFolder => 'Select Folder';

	/// en: 'Reset to Default'
	String get resetToDefault => 'Reset to Default';

	/// en: 'Current: ${path}'
	String currentPath({required Object path}) => 'Current: ${path}';

	/// en: 'Download location changed'
	String get downloadLocationChanged => 'Download location changed';

	/// en: 'Download location reset to default'
	String get downloadLocationReset => 'Download location reset to default';

	/// en: 'Selected folder is not writable'
	String get downloadLocationInvalid => 'Selected folder is not writable';

	/// en: 'Failed to select folder'
	String get downloadLocationSelectError => 'Failed to select folder';

	/// en: 'Download on WiFi only'
	String get downloadOnWifiOnly => 'Download on WiFi only';

	/// en: 'Prevent downloads when on cellular data'
	String get downloadOnWifiOnlyDescription => 'Prevent downloads when on cellular data';

	/// en: 'Auto-remove watched downloads'
	String get autoRemoveWatchedDownloads => 'Auto-remove watched downloads';

	/// en: 'Automatically delete downloaded episodes and movies when marked as watched'
	String get autoRemoveWatchedDownloadsDescription => 'Automatically delete downloaded episodes and movies when marked as watched';

	/// en: 'Downloads are disabled on cellular data. Connect to WiFi or change the setting.'
	String get cellularDownloadBlocked => 'Downloads are disabled on cellular data. Connect to WiFi or change the setting.';

	/// en: 'Maximum Volume'
	String get maxVolume => 'Maximum Volume';

	/// en: 'Allow volume boost above 100% for quiet media'
	String get maxVolumeDescription => 'Allow volume boost above 100% for quiet media';

	/// en: '${percent}%'
	String maxVolumePercent({required Object percent}) => '${percent}%';

	/// en: 'Discord Rich Presence'
	String get discordRichPresence => 'Discord Rich Presence';

	/// en: 'Show what you're watching on Discord'
	String get discordRichPresenceDescription => 'Show what you\'re watching on Discord';

	/// en: 'Companion Remote Server'
	String get companionRemoteServer => 'Companion Remote Server';

	/// en: 'Allow mobile devices on your network to control this app'
	String get companionRemoteServerDescription => 'Allow mobile devices on your network to control this app';

	/// en: 'Auto Picture-in-Picture'
	String get autoPip => 'Auto Picture-in-Picture';

	/// en: 'Automatically enter picture-in-picture when leaving the app during playback'
	String get autoPipDescription => 'Automatically enter picture-in-picture when leaving the app during playback';

	/// en: 'Match Content Frame Rate'
	String get matchContentFrameRate => 'Match Content Frame Rate';

	/// en: 'Adjust display refresh rate to match video content, reducing judder and saving battery'
	String get matchContentFrameRateDescription => 'Adjust display refresh rate to match video content, reducing judder and saving battery';

	/// en: 'Match Refresh Rate'
	String get matchRefreshRate => 'Match Refresh Rate';

	/// en: 'Switch display refresh rate to match video content when in fullscreen'
	String get matchRefreshRateDescription => 'Switch display refresh rate to match video content when in fullscreen';

	/// en: 'Match Dynamic Range'
	String get matchDynamicRange => 'Match Dynamic Range';

	/// en: 'Auto-enable HDR for HDR content and revert to SDR when leaving the player'
	String get matchDynamicRangeDescription => 'Auto-enable HDR for HDR content and revert to SDR when leaving the player';

	/// en: 'Display Switch Delay'
	String get displaySwitchDelay => 'Display Switch Delay';

	/// en: 'Tunneled Playback'
	String get tunneledPlayback => 'Tunneled Playback';

	/// en: 'Use hardware-accelerated video tunneling. Disable if you see a black screen with audio on HDR content'
	String get tunneledPlaybackDescription => 'Use hardware-accelerated video tunneling. Disable if you see a black screen with audio on HDR content';

	/// en: 'Ask for profile on app open'
	String get requireProfileSelectionOnOpen => 'Ask for profile on app open';

	/// en: 'Show profile selection every time the app is opened'
	String get requireProfileSelectionOnOpenDescription => 'Show profile selection every time the app is opened';

	/// en: 'Force TV mode'
	String get forceTvMode => 'Force TV mode';

	/// en: 'Use the TV layout regardless of auto-detection. Useful on Android TV devices that don't report the leanback feature. Restarts the app on change.'
	String get forceTvModeDescription => 'Use the TV layout regardless of auto-detection. Useful on Android TV devices that don\'t report the leanback feature. Restarts the app on change.';

	/// en: 'Start in fullscreen'
	String get startInFullscreen => 'Start in fullscreen';

	/// en: 'Open Lumi in fullscreen mode at launch'
	String get startInFullscreenDescription => 'Open Lumi in fullscreen mode at launch';

	/// en: 'Auto-Hide Performance Overlay'
	String get autoHidePerformanceOverlay => 'Auto-Hide Performance Overlay';

	/// en: 'Fade the performance overlay with the playback controls'
	String get autoHidePerformanceOverlayDescription => 'Fade the performance overlay with the playback controls';

	/// en: 'Show Navigation Bar Labels'
	String get showNavBarLabels => 'Show Navigation Bar Labels';

	/// en: 'Display text labels under navigation bar icons'
	String get showNavBarLabelsDescription => 'Display text labels under navigation bar icons';

	/// en: 'Default to Favorite Channels'
	String get liveTvDefaultFavorites => 'Default to Favorite Channels';

	/// en: 'Show only favorite channels when opening Live TV'
	String get liveTvDefaultFavoritesDescription => 'Show only favorite channels when opening Live TV';

	/// en: 'Display'
	String get display => 'Display';

	/// en: 'Home Screen'
	String get homeScreen => 'Home Screen';

	/// en: 'Navigation'
	String get navigation => 'Navigation';

	/// en: 'Window'
	String get window => 'Window';

	/// en: 'Content'
	String get content => 'Content';

	/// en: 'Player'
	String get player => 'Player';

	/// en: 'Subtitles & Configuration'
	String get subtitlesAndConfig => 'Subtitles & Configuration';

	/// en: 'Seek & Timing'
	String get seekAndTiming => 'Seek & Timing';

	/// en: 'Behavior'
	String get behavior => 'Behavior';
}

// Path: search
class TranslationsSearchEn {
	TranslationsSearchEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Search movies, shows, music...'
	String get hint => 'Search movies, shows, music...';

	/// en: 'Try a different search term'
	String get tryDifferentTerm => 'Try a different search term';

	/// en: 'Search your media'
	String get searchYourMedia => 'Search your media';

	/// en: 'Enter a title, actor, or keyword'
	String get enterTitleActorOrKeyword => 'Enter a title, actor, or keyword';

	/// en: 'Other Results'
	String get otherResults => 'Other Results';
}

// Path: hotkeys
class TranslationsHotkeysEn {
	TranslationsHotkeysEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Set Shortcut for ${actionName}'
	String setShortcutFor({required Object actionName}) => 'Set Shortcut for ${actionName}';

	/// en: 'Clear shortcut'
	String get clearShortcut => 'Clear shortcut';

	late final TranslationsHotkeysActionsEn actions = TranslationsHotkeysActionsEn.internal(_root);
}

// Path: fileInfo
class TranslationsFileInfoEn {
	TranslationsFileInfoEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'File Info'
	String get title => 'File Info';

	/// en: 'Video'
	String get video => 'Video';

	/// en: 'Audio'
	String get audio => 'Audio';

	/// en: 'File'
	String get file => 'File';

	/// en: 'Advanced'
	String get advanced => 'Advanced';

	/// en: 'Codec'
	String get codec => 'Codec';

	/// en: 'Resolution'
	String get resolution => 'Resolution';

	/// en: 'Bitrate'
	String get bitrate => 'Bitrate';

	/// en: 'Frame Rate'
	String get frameRate => 'Frame Rate';

	/// en: 'Aspect Ratio'
	String get aspectRatio => 'Aspect Ratio';

	/// en: 'Profile'
	String get profile => 'Profile';

	/// en: 'Bit Depth'
	String get bitDepth => 'Bit Depth';

	/// en: 'Color Space'
	String get colorSpace => 'Color Space';

	/// en: 'Color Range'
	String get colorRange => 'Color Range';

	/// en: 'Color Primaries'
	String get colorPrimaries => 'Color Primaries';

	/// en: 'Chroma Subsampling'
	String get chromaSubsampling => 'Chroma Subsampling';

	/// en: 'Channels'
	String get channels => 'Channels';

	/// en: 'Subtitles'
	String get subtitles => 'Subtitles';

	/// en: 'Overall Bitrate'
	String get overallBitrate => 'Overall Bitrate';

	/// en: 'Path'
	String get path => 'Path';

	/// en: 'Size'
	String get size => 'Size';

	/// en: 'Container'
	String get container => 'Container';

	/// en: 'Duration'
	String get duration => 'Duration';

	/// en: 'Optimized for Streaming'
	String get optimizedForStreaming => 'Optimized for Streaming';

	/// en: '64-bit Offsets'
	String get has64bitOffsets => '64-bit Offsets';
}

// Path: mediaMenu
class TranslationsMediaMenuEn {
	TranslationsMediaMenuEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Mark as Watched'
	String get markAsWatched => 'Mark as Watched';

	/// en: 'Mark as Unwatched'
	String get markAsUnwatched => 'Mark as Unwatched';

	/// en: 'Remove from Continue Watching'
	String get removeFromContinueWatching => 'Remove from Continue Watching';

	/// en: 'Go to series'
	String get goToSeries => 'Go to series';

	/// en: 'Go to season'
	String get goToSeason => 'Go to season';

	/// en: 'Shuffle Play'
	String get shufflePlay => 'Shuffle Play';

	/// en: 'File Info'
	String get fileInfo => 'File Info';

	/// en: 'Delete from server'
	String get deleteFromServer => 'Delete from server';

	/// en: 'This will permanently delete this media and its files from your server. This cannot be undone.'
	String get confirmDelete => 'This will permanently delete this media and its files from your server. This cannot be undone.';

	/// en: 'This includes all episodes and their files.'
	String get deleteMultipleWarning => 'This includes all episodes and their files.';

	/// en: 'Media item deleted successfully'
	String get mediaDeletedSuccessfully => 'Media item deleted successfully';

	/// en: 'Failed to delete media item'
	String get mediaFailedToDelete => 'Failed to delete media item';

	/// en: 'Rate'
	String get rate => 'Rate';

	/// en: 'Play from Beginning'
	String get playFromBeginning => 'Play from Beginning';

	/// en: 'Play Version...'
	String get playVersion => 'Play Version...';
}

// Path: accessibility
class TranslationsAccessibilityEn {
	TranslationsAccessibilityEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: '${title}, movie'
	String mediaCardMovie({required Object title}) => '${title}, movie';

	/// en: '${title}, TV show'
	String mediaCardShow({required Object title}) => '${title}, TV show';

	/// en: '${title}, ${episodeInfo}'
	String mediaCardEpisode({required Object title, required Object episodeInfo}) => '${title}, ${episodeInfo}';

	/// en: '${title}, ${seasonInfo}'
	String mediaCardSeason({required Object title, required Object seasonInfo}) => '${title}, ${seasonInfo}';

	/// en: 'watched'
	String get mediaCardWatched => 'watched';

	/// en: '${percent} percent watched'
	String mediaCardPartiallyWatched({required Object percent}) => '${percent} percent watched';

	/// en: 'unwatched'
	String get mediaCardUnwatched => 'unwatched';

	/// en: 'Tap to play'
	String get tapToPlay => 'Tap to play';
}

// Path: tooltips
class TranslationsTooltipsEn {
	TranslationsTooltipsEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Shuffle play'
	String get shufflePlay => 'Shuffle play';

	/// en: 'Play trailer'
	String get playTrailer => 'Play trailer';

	/// en: 'Mark as watched'
	String get markAsWatched => 'Mark as watched';

	/// en: 'Mark as unwatched'
	String get markAsUnwatched => 'Mark as unwatched';
}

// Path: videoControls
class TranslationsVideoControlsEn {
	TranslationsVideoControlsEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Audio'
	String get audioLabel => 'Audio';

	/// en: 'Subtitles'
	String get subtitlesLabel => 'Subtitles';

	/// en: 'Opaque'
	String get opaque => 'Opaque';

	/// en: 'Reset to 0ms'
	String get resetToZero => 'Reset to 0ms';

	/// en: '+${amount}${unit}'
	String addTime({required Object amount, required Object unit}) => '+${amount}${unit}';

	/// en: '-${amount}${unit}'
	String minusTime({required Object amount, required Object unit}) => '-${amount}${unit}';

	/// en: '${label} plays later'
	String playsLater({required Object label}) => '${label} plays later';

	/// en: '${label} plays earlier'
	String playsEarlier({required Object label}) => '${label} plays earlier';

	/// en: 'No offset'
	String get noOffset => 'No offset';

	/// en: 'Letterbox'
	String get letterbox => 'Letterbox';

	/// en: 'Fill screen'
	String get fillScreen => 'Fill screen';

	/// en: 'Stretch'
	String get stretch => 'Stretch';

	/// en: 'Lock rotation'
	String get lockRotation => 'Lock rotation';

	/// en: 'Unlock rotation'
	String get unlockRotation => 'Unlock rotation';

	/// en: 'Timer Active'
	String get timerActive => 'Timer Active';

	/// en: 'Playback will pause in ${duration}'
	String playbackWillPauseIn({required Object duration}) => 'Playback will pause in ${duration}';

	/// en: 'Still watching?'
	String get stillWatching => 'Still watching?';

	/// en: 'Pausing in ${seconds}s'
	String pausingIn({required Object seconds}) => 'Pausing in ${seconds}s';

	/// en: 'Continue'
	String get continueWatching => 'Continue';

	/// en: 'Auto-Play Next'
	String get autoPlayNext => 'Auto-Play Next';

	/// en: 'Play Next'
	String get playNext => 'Play Next';

	/// en: 'Play'
	String get playButton => 'Play';

	/// en: 'Pause'
	String get pauseButton => 'Pause';

	/// en: 'Seek backward ${seconds} seconds'
	String seekBackwardButton({required Object seconds}) => 'Seek backward ${seconds} seconds';

	/// en: 'Seek forward ${seconds} seconds'
	String seekForwardButton({required Object seconds}) => 'Seek forward ${seconds} seconds';

	/// en: 'Previous episode'
	String get previousButton => 'Previous episode';

	/// en: 'Next episode'
	String get nextButton => 'Next episode';

	/// en: 'Previous chapter'
	String get previousChapterButton => 'Previous chapter';

	/// en: 'Next chapter'
	String get nextChapterButton => 'Next chapter';

	/// en: 'Mute'
	String get muteButton => 'Mute';

	/// en: 'Unmute'
	String get unmuteButton => 'Unmute';

	/// en: 'Video settings'
	String get settingsButton => 'Video settings';

	/// en: 'Audio & Subtitles'
	String get tracksButton => 'Audio & Subtitles';

	/// en: 'Chapters'
	String get chaptersButton => 'Chapters';

	/// en: 'Video versions'
	String get versionsButton => 'Video versions';

	/// en: 'Version & Quality'
	String get versionQualityButton => 'Version & Quality';

	/// en: 'Version'
	String get versionColumnHeader => 'Version';

	/// en: 'Quality'
	String get qualityColumnHeader => 'Quality';

	/// en: 'Original'
	String get qualityOriginal => 'Original';

	/// en: '${resolution}p ${bitrate} Mbps'
	String qualityPresetLabel({required Object resolution, required Object bitrate}) => '${resolution}p ${bitrate} Mbps';

	/// en: '~${bitrate} Mbps'
	String qualityBandwidthEstimate({required Object bitrate}) => '~${bitrate} Mbps';

	/// en: 'Transcoding unavailable — playing original quality'
	String get transcodeUnavailableFallback => 'Transcoding unavailable — playing original quality';

	/// en: 'Picture-in-Picture mode'
	String get pipButton => 'Picture-in-Picture mode';

	/// en: 'Aspect ratio'
	String get aspectRatioButton => 'Aspect ratio';

	/// en: 'Zoom ${percent}%'
	String zoomPercent({required Object percent}) => 'Zoom ${percent}%';

	/// en: 'Ambient lighting'
	String get ambientLighting => 'Ambient lighting';

	/// en: 'Enter fullscreen'
	String get fullscreenButton => 'Enter fullscreen';

	/// en: 'Exit fullscreen'
	String get exitFullscreenButton => 'Exit fullscreen';

	/// en: 'Always on top'
	String get alwaysOnTopButton => 'Always on top';

	/// en: 'Rotation lock'
	String get rotationLockButton => 'Rotation lock';

	/// en: 'Lock screen'
	String get lockScreen => 'Lock screen';

	/// en: 'Screen lock'
	String get screenLockButton => 'Screen lock';

	/// en: 'Long press to unlock'
	String get longPressToUnlock => 'Long press to unlock';

	/// en: 'Video timeline'
	String get timelineSlider => 'Video timeline';

	/// en: 'Volume level'
	String get volumeSlider => 'Volume level';

	/// en: 'Ends at ${time}'
	String endsAt({required Object time}) => 'Ends at ${time}';

	/// en: 'Playing in Picture-in-Picture'
	String get pipActive => 'Playing in Picture-in-Picture';

	/// en: 'Picture-in-picture failed to start'
	String get pipFailed => 'Picture-in-picture failed to start';

	late final TranslationsVideoControlsPipErrorsEn pipErrors = TranslationsVideoControlsPipErrorsEn.internal(_root);

	/// en: 'Chapters'
	String get chapters => 'Chapters';

	/// en: 'No chapters available'
	String get noChaptersAvailable => 'No chapters available';

	/// en: 'Queue'
	String get queue => 'Queue';

	/// en: 'No items in queue'
	String get noQueueItems => 'No items in queue';

	/// en: 'Search Subtitles'
	String get searchSubtitles => 'Search Subtitles';

	/// en: 'Language'
	String get language => 'Language';

	/// en: 'No subtitles found'
	String get noSubtitlesFound => 'No subtitles found';

	/// en: 'Subtitle downloaded'
	String get subtitleDownloaded => 'Subtitle downloaded';

	/// en: 'Failed to download subtitle'
	String get subtitleDownloadFailed => 'Failed to download subtitle';

	/// en: 'Search languages...'
	String get searchLanguages => 'Search languages...';
}

// Path: userStatus
class TranslationsUserStatusEn {
	TranslationsUserStatusEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Admin'
	String get admin => 'Admin';

	/// en: 'Restricted'
	String get restricted => 'Restricted';

	/// en: 'Protected'
	String get protected => 'Protected';

	/// en: 'CURRENT'
	String get current => 'CURRENT';
}

// Path: messages
class TranslationsMessagesEn {
	TranslationsMessagesEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Marked as watched'
	String get markedAsWatched => 'Marked as watched';

	/// en: 'Marked as unwatched'
	String get markedAsUnwatched => 'Marked as unwatched';

	/// en: 'Marked as watched (will sync when online)'
	String get markedAsWatchedOffline => 'Marked as watched (will sync when online)';

	/// en: 'Marked as unwatched (will sync when online)'
	String get markedAsUnwatchedOffline => 'Marked as unwatched (will sync when online)';

	/// en: 'Auto-removed: ${title}'
	String autoRemovedWatchedDownload({required Object title}) => 'Auto-removed: ${title}';

	/// en: 'Removed from Continue Watching'
	String get removedFromContinueWatching => 'Removed from Continue Watching';

	/// en: 'Error: ${error}'
	String errorLoading({required Object error}) => 'Error: ${error}';

	/// en: 'File information not available'
	String get fileInfoNotAvailable => 'File information not available';

	/// en: 'Error loading file info: ${error}'
	String errorLoadingFileInfo({required Object error}) => 'Error loading file info: ${error}';

	/// en: 'Error loading series'
	String get errorLoadingSeries => 'Error loading series';

	/// en: 'Error loading season'
	String get errorLoadingSeason => 'Error loading season';

	/// en: 'Music playback is not yet supported'
	String get musicNotSupported => 'Music playback is not yet supported';

	/// en: 'No description available'
	String get noDescriptionAvailable => 'No description available';

	/// en: 'No profiles available'
	String get noProfilesAvailable => 'No profiles available';

	/// en: 'Contact your server administrator to add profiles'
	String get contactAdminForProfiles => 'Contact your server administrator to add profiles';

	/// en: 'Unable to determine library section for this item'
	String get unableToDetermineLibrarySection => 'Unable to determine library section for this item';

	/// en: 'Logs cleared'
	String get logsCleared => 'Logs cleared';

	/// en: 'Logs copied to clipboard'
	String get logsCopied => 'Logs copied to clipboard';

	/// en: 'No logs available'
	String get noLogsAvailable => 'No logs available';

	/// en: 'Scanning "${title}"...'
	String libraryScanning({required Object title}) => 'Scanning "${title}"...';

	/// en: 'Library scan started for "${title}"'
	String libraryScanStarted({required Object title}) => 'Library scan started for "${title}"';

	/// en: 'Failed to scan library: ${error}'
	String libraryScanFailed({required Object error}) => 'Failed to scan library: ${error}';

	/// en: 'Refreshing metadata for "${title}"...'
	String metadataRefreshing({required Object title}) => 'Refreshing metadata for "${title}"...';

	/// en: 'Metadata refresh started for "${title}"'
	String metadataRefreshStarted({required Object title}) => 'Metadata refresh started for "${title}"';

	/// en: 'Failed to refresh metadata: ${error}'
	String metadataRefreshFailed({required Object error}) => 'Failed to refresh metadata: ${error}';

	/// en: 'Are you sure you want to logout?'
	String get logoutConfirm => 'Are you sure you want to logout?';

	/// en: 'No seasons found'
	String get noSeasonsFound => 'No seasons found';

	/// en: 'No episodes found in first season'
	String get noEpisodesFound => 'No episodes found in first season';

	/// en: 'No episodes found'
	String get noEpisodesFoundGeneral => 'No episodes found';

	/// en: 'No results found'
	String get noResultsFound => 'No results found';

	/// en: 'Sleep timer set for ${label}'
	String sleepTimerSet({required Object label}) => 'Sleep timer set for ${label}';

	/// en: 'No items available'
	String get noItemsAvailable => 'No items available';

	/// en: 'Failed to create play queue - no items'
	String get failedToCreatePlayQueueNoItems => 'Failed to create play queue - no items';

	/// en: 'Failed to ${action}: ${error}'
	String failedPlayback({required Object action, required Object error}) => 'Failed to ${action}: ${error}';

	/// en: 'Switching to compatible player...'
	String get switchingToCompatiblePlayer => 'Switching to compatible player...';

	/// en: 'Playback failed'
	String get serverLimitTitle => 'Playback failed';

	/// en: 'The server returned an error (HTTP 500). This usually means the server owner has set a bandwidth or transcoding limit that's rejecting your session. There's nothing to do from the client — the server owner needs to adjust their settings.'
	String get serverLimitBody => 'The server returned an error (HTTP 500). This usually means the server owner has set a bandwidth or transcoding limit that\'s rejecting your session. There\'s nothing to do from the client — the server owner needs to adjust their settings.';

	/// en: 'Logs uploaded'
	String get logsUploaded => 'Logs uploaded';

	/// en: 'Failed to upload logs'
	String get logsUploadFailed => 'Failed to upload logs';

	/// en: 'Log ID'
	String get logId => 'Log ID';
}

// Path: subtitlingStyling
class TranslationsSubtitlingStylingEn {
	TranslationsSubtitlingStylingEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Text'
	String get text => 'Text';

	/// en: 'Border'
	String get border => 'Border';

	/// en: 'Background'
	String get background => 'Background';

	/// en: 'Font Size'
	String get fontSize => 'Font Size';

	/// en: 'Text Color'
	String get textColor => 'Text Color';

	/// en: 'Border Size'
	String get borderSize => 'Border Size';

	/// en: 'Border Color'
	String get borderColor => 'Border Color';

	/// en: 'Background Opacity'
	String get backgroundOpacity => 'Background Opacity';

	/// en: 'Background Color'
	String get backgroundColor => 'Background Color';

	/// en: 'Position'
	String get position => 'Position';

	/// en: 'ASS Override'
	String get assOverride => 'ASS Override';

	/// en: 'Bold'
	String get bold => 'Bold';

	/// en: 'Italic'
	String get italic => 'Italic';
}

// Path: mpvConfig
class TranslationsMpvConfigEn {
	TranslationsMpvConfigEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'mpv.conf'
	String get title => 'mpv.conf';

	/// en: 'Advanced video player settings'
	String get description => 'Advanced video player settings';

	/// en: 'Presets'
	String get presets => 'Presets';

	/// en: 'No saved presets'
	String get noPresets => 'No saved presets';

	/// en: 'Save as Preset...'
	String get saveAsPreset => 'Save as Preset...';

	/// en: 'Preset Name'
	String get presetName => 'Preset Name';

	/// en: 'Enter a name for this preset'
	String get presetNameHint => 'Enter a name for this preset';

	/// en: 'Load'
	String get loadPreset => 'Load';

	/// en: 'Delete'
	String get deletePreset => 'Delete';

	/// en: 'Preset saved'
	String get presetSaved => 'Preset saved';

	/// en: 'Preset loaded'
	String get presetLoaded => 'Preset loaded';

	/// en: 'Preset deleted'
	String get presetDeleted => 'Preset deleted';

	/// en: 'Are you sure you want to delete this preset?'
	String get confirmDeletePreset => 'Are you sure you want to delete this preset?';

	/// en: 'gpu-api=vulkan hwdec=auto # comment'
	String get configPlaceholder => 'gpu-api=vulkan\nhwdec=auto\n# comment';
}

// Path: dialog
class TranslationsDialogEn {
	TranslationsDialogEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Confirm Action'
	String get confirmAction => 'Confirm Action';
}

// Path: profiles
class TranslationsProfilesEn {
	TranslationsProfilesEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Add Lumi profile'
	String get addLumiProfile => 'Add Lumi profile';

	/// en: 'Switching profile…'
	String get switchingProfile => 'Switching profile…';

	/// en: 'Delete this profile?'
	String get deleteThisProfileTitle => 'Delete this profile?';

	/// en: '${displayName} will be removed. Connections themselves are not affected.'
	String deleteThisProfileMessage({required Object displayName}) => '${displayName} will be removed. Connections themselves are not affected.';

	/// en: 'Active'
	String get active => 'Active';

	/// en: 'Manage'
	String get manage => 'Manage';

	/// en: 'Delete'
	String get delete => 'Delete';

	/// en: 'Sign out'
	String get signOut => 'Sign out';

	/// en: 'Sign out of Plex?'
	String get signOutPlexTitle => 'Sign out of Plex?';

	/// en: '${displayName} and every Plex Home user on this account will be removed from this device. You can sign back in any time.'
	String signOutPlexMessage({required Object displayName}) => '${displayName} and every Plex Home user on this account will be removed from this device. You can sign back in any time.';

	/// en: 'Signed out of Plex.'
	String get signedOutPlex => 'Signed out of Plex.';

	/// en: 'Sign out failed.'
	String get signOutFailed => 'Sign out failed.';

	/// en: 'Switch User'
	String get sectionTitle => 'Switch User';

	/// en: 'Add profiles to mix managed users and local identities'
	String get summarySingle => 'Add profiles to mix managed users and local identities';

	/// en: '${count} profiles · active: ${activeName}'
	String summaryMultipleWithActive({required Object count, required Object activeName}) => '${count} profiles · active: ${activeName}';

	/// en: '${count} profiles'
	String summaryMultiple({required Object count}) => '${count} profiles';

	/// en: 'Remove connection?'
	String get removeConnectionTitle => 'Remove connection?';

	/// en: '${displayName} will lose access to ${connectionLabel}. The connection itself stays available to other profiles.'
	String removeConnectionMessage({required Object displayName, required Object connectionLabel}) => '${displayName} will lose access to ${connectionLabel}. The connection itself stays available to other profiles.';

	/// en: 'Delete profile?'
	String get deleteProfileTitle => 'Delete profile?';

	/// en: 'This removes ${displayName} and all its connections from this device. The underlying Plex/Jellyfin servers aren't affected.'
	String deleteProfileMessage({required Object displayName}) => 'This removes ${displayName} and all its connections from this device. The underlying Plex/Jellyfin servers aren\'t affected.';

	/// en: 'Profile name'
	String get profileNameLabel => 'Profile name';

	/// en: 'PIN protection'
	String get pinProtectionLabel => 'PIN protection';

	/// en: 'PIN managed by Plex. Edit on plex.tv.'
	String get pinManagedByPlex => 'PIN managed by Plex. Edit on plex.tv.';

	/// en: 'No PIN set. To require one, edit the home user on plex.tv.'
	String get noPinSetEditOnPlex => 'No PIN set. To require one, edit the home user on plex.tv.';

	/// en: 'Set PIN'
	String get setPin => 'Set PIN';

	/// en: 'Connections'
	String get connectionsLabel => 'Connections';

	/// en: 'Add'
	String get add => 'Add';

	/// en: 'Delete profile'
	String get deleteProfileButton => 'Delete profile';

	/// en: 'No connections — add one to use this profile.'
	String get noConnectionsHint => 'No connections — add one to use this profile.';

	/// en: 'Plex Home account'
	String get plexHomeAccount => 'Plex Home account';

	/// en: 'Default'
	String get connectionDefault => 'Default';

	/// en: 'Make default'
	String get makeDefault => 'Make default';

	/// en: 'Remove'
	String get removeConnection => 'Remove';

	/// en: 'Add to ${displayName}'
	String borrowAddTo({required Object displayName}) => 'Add to ${displayName}';

	/// en: 'Borrow a connection from another profile. PIN-protected source profiles ask for the PIN before sharing.'
	String get borrowExplain => 'Borrow a connection from another profile. PIN-protected source profiles ask for the PIN before sharing.';

	/// en: 'Nothing to borrow yet.'
	String get borrowEmpty => 'Nothing to borrow yet.';

	/// en: 'Connect a Plex account or Jellyfin server to another profile first, then come back here.'
	String get borrowEmptySubtitle => 'Connect a Plex account or Jellyfin server to another profile first, then come back here.';

	/// en: 'New profile'
	String get newProfile => 'New profile';

	/// en: 'e.g. Guests, Kids, Family Room'
	String get profileNameHint => 'e.g. Guests, Kids, Family Room';

	/// en: 'PIN protection (optional)'
	String get pinProtectionOptional => 'PIN protection (optional)';

	/// en: '4-digit PIN required to switch into this profile. Soft barrier — anyone who can clear app data can bypass it.'
	String get pinExplain => '4-digit PIN required to switch into this profile. Soft barrier — anyone who can clear app data can bypass it.';

	/// en: 'Continue'
	String get continueButton => 'Continue';

	/// en: 'PINs don't match'
	String get pinsDontMatch => 'PINs don\'t match';
}

// Path: connections
class TranslationsConnectionsEn {
	TranslationsConnectionsEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Connections'
	String get sectionTitle => 'Connections';

	/// en: 'Add connection'
	String get addConnection => 'Add connection';

	/// en: 'Sign in with Plex or connect a Jellyfin server'
	String get addConnectionSubtitleNoProfile => 'Sign in with Plex or connect a Jellyfin server';

	/// en: 'Add to ${displayName} — Plex account, Jellyfin server, or borrow from another profile'
	String addConnectionSubtitleScoped({required Object displayName}) => 'Add to ${displayName} — Plex account, Jellyfin server, or borrow from another profile';

	/// en: 'Session expired for ${name}'
	String sessionExpiredOne({required Object name}) => 'Session expired for ${name}';

	/// en: 'Session expired for ${count} servers'
	String sessionExpiredMany({required Object count}) => 'Session expired for ${count} servers';

	/// en: 'Sign in again'
	String get signInAgain => 'Sign in again';
}

// Path: discover
class TranslationsDiscoverEn {
	TranslationsDiscoverEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Discover'
	String get title => 'Discover';

	/// en: 'Switch Profile'
	String get switchProfile => 'Switch Profile';

	/// en: 'No content available'
	String get noContentAvailable => 'No content available';

	/// en: 'Add some media to your libraries'
	String get addMediaToLibraries => 'Add some media to your libraries';

	/// en: 'Continue Watching'
	String get continueWatching => 'Continue Watching';

	/// en: 'Continue Watching in ${library}'
	String continueWatchingIn({required Object library}) => 'Continue Watching in ${library}';

	/// en: 'Next Up'
	String get nextUp => 'Next Up';

	/// en: 'Next Up in ${library}'
	String nextUpIn({required Object library}) => 'Next Up in ${library}';

	/// en: 'Recently Added'
	String get recentlyAdded => 'Recently Added';

	/// en: 'Recently Added in ${library}'
	String recentlyAddedIn({required Object library}) => 'Recently Added in ${library}';

	/// en: 'S${season}E${episode}'
	String playEpisode({required Object season, required Object episode}) => 'S${season}E${episode}';

	/// en: 'Overview'
	String get overview => 'Overview';

	/// en: 'Cast'
	String get cast => 'Cast';

	/// en: 'Trailers & Extras'
	String get extras => 'Trailers & Extras';

	/// en: 'Studio'
	String get studio => 'Studio';

	/// en: 'Rating'
	String get rating => 'Rating';

	/// en: 'Movie'
	String get movie => 'Movie';

	/// en: 'TV Show'
	String get tvShow => 'TV Show';

	/// en: '${minutes} min left'
	String minutesLeft({required Object minutes}) => '${minutes} min left';
}

// Path: errors
class TranslationsErrorsEn {
	TranslationsErrorsEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Search failed: ${error}'
	String searchFailed({required Object error}) => 'Search failed: ${error}';

	/// en: 'Connection timeout while loading ${context}'
	String connectionTimeout({required Object context}) => 'Connection timeout while loading ${context}';

	/// en: 'Unable to connect to media server'
	String get connectionFailed => 'Unable to connect to media server';

	/// en: 'Failed to load ${context}: ${error}'
	String failedToLoad({required Object context, required Object error}) => 'Failed to load ${context}: ${error}';

	/// en: 'No client available'
	String get noClientAvailable => 'No client available';

	/// en: 'Authentication failed: ${error}'
	String authenticationFailed({required Object error}) => 'Authentication failed: ${error}';

	/// en: 'Could not launch auth URL'
	String get couldNotLaunchUrl => 'Could not launch auth URL';

	/// en: 'Please enter a token'
	String get pleaseEnterToken => 'Please enter a token';

	/// en: 'Invalid token'
	String get invalidToken => 'Invalid token';

	/// en: 'Failed to verify token: ${error}'
	String failedToVerifyToken({required Object error}) => 'Failed to verify token: ${error}';

	/// en: 'Failed to switch to ${displayName}'
	String failedToSwitchProfile({required Object displayName}) => 'Failed to switch to ${displayName}';

	/// en: 'Failed to delete ${displayName}'
	String failedToDeleteProfile({required Object displayName}) => 'Failed to delete ${displayName}';

	/// en: 'Couldn't update rating'
	String get failedToRate => 'Couldn\'t update rating';
}

// Path: libraries
class TranslationsLibrariesEn {
	TranslationsLibrariesEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Libraries'
	String get title => 'Libraries';

	/// en: 'Scan Library Files'
	String get scanLibraryFiles => 'Scan Library Files';

	/// en: 'Scan Library'
	String get scanLibrary => 'Scan Library';

	/// en: 'Analyze'
	String get analyze => 'Analyze';

	/// en: 'Analyze Library'
	String get analyzeLibrary => 'Analyze Library';

	/// en: 'Refresh Metadata'
	String get refreshMetadata => 'Refresh Metadata';

	/// en: 'Empty Trash'
	String get emptyTrash => 'Empty Trash';

	/// en: 'Emptying trash for "${title}"...'
	String emptyingTrash({required Object title}) => 'Emptying trash for "${title}"...';

	/// en: 'Trash emptied for "${title}"'
	String trashEmptied({required Object title}) => 'Trash emptied for "${title}"';

	/// en: 'Failed to empty trash: ${error}'
	String failedToEmptyTrash({required Object error}) => 'Failed to empty trash: ${error}';

	/// en: 'Analyzing "${title}"...'
	String analyzing({required Object title}) => 'Analyzing "${title}"...';

	/// en: 'Analysis started for "${title}"'
	String analysisStarted({required Object title}) => 'Analysis started for "${title}"';

	/// en: 'Failed to analyze library: ${error}'
	String failedToAnalyze({required Object error}) => 'Failed to analyze library: ${error}';

	/// en: 'No libraries found'
	String get noLibrariesFound => 'No libraries found';

	/// en: 'All libraries are hidden'
	String get allLibrariesHidden => 'All libraries are hidden';

	/// en: 'Hidden libraries (${count})'
	String hiddenLibrariesCount({required Object count}) => 'Hidden libraries (${count})';

	/// en: 'This library is empty'
	String get thisLibraryIsEmpty => 'This library is empty';

	/// en: 'All'
	String get all => 'All';

	/// en: 'Clear All'
	String get clearAll => 'Clear All';

	/// en: 'Are you sure you want to scan "${title}"?'
	String scanLibraryConfirm({required Object title}) => 'Are you sure you want to scan "${title}"?';

	/// en: 'Are you sure you want to analyze "${title}"?'
	String analyzeLibraryConfirm({required Object title}) => 'Are you sure you want to analyze "${title}"?';

	/// en: 'Are you sure you want to refresh metadata for "${title}"?'
	String refreshMetadataConfirm({required Object title}) => 'Are you sure you want to refresh metadata for "${title}"?';

	/// en: 'Are you sure you want to empty trash for "${title}"?'
	String emptyTrashConfirm({required Object title}) => 'Are you sure you want to empty trash for "${title}"?';

	/// en: 'Manage Libraries'
	String get manageLibraries => 'Manage Libraries';

	/// en: 'Sort'
	String get sort => 'Sort';

	/// en: 'Sort By'
	String get sortBy => 'Sort By';

	/// en: 'Filters'
	String get filters => 'Filters';

	/// en: 'Are you sure you want to perform this action?'
	String get confirmActionMessage => 'Are you sure you want to perform this action?';

	/// en: 'Show library'
	String get showLibrary => 'Show library';

	/// en: 'Hide library'
	String get hideLibrary => 'Hide library';

	/// en: 'Library options'
	String get libraryOptions => 'Library options';

	/// en: 'library content'
	String get content => 'library content';

	/// en: 'Select library'
	String get selectLibrary => 'Select library';

	/// en: 'Filters (${count})'
	String filtersWithCount({required Object count}) => 'Filters (${count})';

	/// en: 'No recommendations available'
	String get noRecommendations => 'No recommendations available';

	/// en: 'No collections in this library'
	String get noCollections => 'No collections in this library';

	/// en: 'No folders found'
	String get noFoldersFound => 'No folders found';

	/// en: 'folders'
	String get folders => 'folders';

	late final TranslationsLibrariesTabsEn tabs = TranslationsLibrariesTabsEn.internal(_root);
	late final TranslationsLibrariesGroupingsEn groupings = TranslationsLibrariesGroupingsEn.internal(_root);
	late final TranslationsLibrariesFilterCategoriesEn filterCategories = TranslationsLibrariesFilterCategoriesEn.internal(_root);
	late final TranslationsLibrariesSortLabelsEn sortLabels = TranslationsLibrariesSortLabelsEn.internal(_root);
}

// Path: about
class TranslationsAboutEn {
	TranslationsAboutEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'About'
	String get title => 'About';

	/// en: 'Open Source Licenses'
	String get openSourceLicenses => 'Open Source Licenses';

	/// en: 'Version ${version}'
	String versionLabel({required Object version}) => 'Version ${version}';

	/// en: 'A beautiful Plex and Jellyfin client for Flutter'
	String get appDescription => 'A beautiful Plex and Jellyfin client for Flutter';

	/// en: 'View licenses of third-party libraries'
	String get viewLicensesDescription => 'View licenses of third-party libraries';
}

// Path: serverSelection
class TranslationsServerSelectionEn {
	TranslationsServerSelectionEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Failed to connect to any servers. Please check your network and try again.'
	String get allServerConnectionsFailed => 'Failed to connect to any servers. Please check your network and try again.';

	/// en: 'No servers found for ${username} (${email})'
	String noServersFoundForAccount({required Object username, required Object email}) => 'No servers found for ${username} (${email})';

	/// en: 'Failed to load servers: ${error}'
	String failedToLoadServers({required Object error}) => 'Failed to load servers: ${error}';

	/// en: 'Select Server'
	String get selectServer => 'Select Server';

	/// en: 'Choose which server you'd like to use'
	String get selectServerDescription => 'Choose which server you\'d like to use';

	/// en: 'No servers available'
	String get noServersAvailable => 'No servers available';

	/// en: 'Online'
	String get online => 'Online';

	/// en: 'Offline'
	String get offline => 'Offline';
}

// Path: hubDetail
class TranslationsHubDetailEn {
	TranslationsHubDetailEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Title'
	String get title => 'Title';

	/// en: 'Release Year'
	String get releaseYear => 'Release Year';

	/// en: 'Date Added'
	String get dateAdded => 'Date Added';

	/// en: 'Rating'
	String get rating => 'Rating';

	/// en: 'No items found'
	String get noItemsFound => 'No items found';
}

// Path: logs
class TranslationsLogsEn {
	TranslationsLogsEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Clear Logs'
	String get clearLogs => 'Clear Logs';

	/// en: 'Copy Logs'
	String get copyLogs => 'Copy Logs';

	/// en: 'Upload Logs'
	String get uploadLogs => 'Upload Logs';
}

// Path: licenses
class TranslationsLicensesEn {
	TranslationsLicensesEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Related Packages'
	String get relatedPackages => 'Related Packages';

	/// en: 'License'
	String get license => 'License';

	/// en: 'License ${number}'
	String licenseNumber({required Object number}) => 'License ${number}';

	/// en: '${count} licenses'
	String licensesCount({required Object count}) => '${count} licenses';
}

// Path: navigation
class TranslationsNavigationEn {
	TranslationsNavigationEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Movies'
	String get movies => 'Movies';

	/// en: 'TV Shows'
	String get shows => 'TV Shows';

	/// en: 'Live TV'
	String get liveTv => 'Live TV';
}

// Path: liveTv
class TranslationsLiveTvEn {
	TranslationsLiveTvEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Live TV'
	String get title => 'Live TV';

	/// en: 'Guide'
	String get guide => 'Guide';

	/// en: 'No channels available'
	String get noChannels => 'No channels available';

	/// en: 'No DVR configured on any server'
	String get noDvr => 'No DVR configured on any server';

	/// en: 'No program data available'
	String get noPrograms => 'No program data available';

	/// en: 'LIVE'
	String get live => 'LIVE';

	/// en: 'Reload Guide'
	String get reloadGuide => 'Reload Guide';

	/// en: 'Now'
	String get now => 'Now';

	/// en: 'Today'
	String get today => 'Today';

	/// en: 'Tomorrow'
	String get tomorrow => 'Tomorrow';

	/// en: 'Midnight'
	String get midnight => 'Midnight';

	/// en: 'Overnight'
	String get overnight => 'Overnight';

	/// en: 'Morning'
	String get morning => 'Morning';

	/// en: 'Daytime'
	String get daytime => 'Daytime';

	/// en: 'Evening'
	String get evening => 'Evening';

	/// en: 'Late Night'
	String get lateNight => 'Late Night';

	/// en: 'What's On'
	String get whatsOn => 'What\'s On';

	/// en: 'Watch Channel'
	String get watchChannel => 'Watch Channel';

	/// en: 'Favorites'
	String get favorites => 'Favorites';

	/// en: 'Reorder Favorites'
	String get reorderFavorites => 'Reorder Favorites';

	/// en: 'Join Session in Progress'
	String get joinSession => 'Join Session in Progress';

	/// en: 'Watch from start (${minutes} min ago)'
	String watchFromStart({required Object minutes}) => 'Watch from start (${minutes} min ago)';

	/// en: 'Watch Live'
	String get watchLive => 'Watch Live';

	/// en: 'Go to Live'
	String get goToLive => 'Go to Live';

	/// en: 'Record'
	String get record => 'Record';

	/// en: 'Record Episode'
	String get recordEpisode => 'Record Episode';

	/// en: 'Record Series'
	String get recordSeries => 'Record Series';

	/// en: 'Record Options'
	String get recordOptions => 'Record Options';

	/// en: 'Recordings'
	String get recordings => 'Recordings';

	/// en: 'Scheduled'
	String get scheduledRecordings => 'Scheduled';

	/// en: 'Recording Rules'
	String get recordingRules => 'Recording Rules';

	/// en: 'Nothing scheduled to record'
	String get noScheduledRecordings => 'Nothing scheduled to record';

	/// en: 'No recording rules yet'
	String get noRecordingRules => 'No recording rules yet';

	/// en: 'Manage recording'
	String get manageRecording => 'Manage recording';

	/// en: 'Cancel recording'
	String get cancelRecording => 'Cancel recording';

	/// en: 'Cancel this recording?'
	String get cancelRecordingTitle => 'Cancel this recording?';

	/// en: '${title} will no longer be recorded.'
	String cancelRecordingMessage({required Object title}) => '${title} will no longer be recorded.';

	/// en: 'Delete rule'
	String get deleteRule => 'Delete rule';

	/// en: 'Delete recording rule?'
	String get deleteRuleTitle => 'Delete recording rule?';

	/// en: 'Future episodes of ${title} will not be recorded.'
	String deleteRuleMessage({required Object title}) => 'Future episodes of ${title} will not be recorded.';

	/// en: 'Recording scheduled'
	String get recordingScheduled => 'Recording scheduled';

	/// en: 'This program is already scheduled'
	String get alreadyScheduled => 'This program is already scheduled';

	/// en: 'DVR settings require an admin account'
	String get dvrAdminRequired => 'DVR settings require an admin account';

	/// en: 'Couldn't schedule recording'
	String get recordingFailed => 'Couldn\'t schedule recording';

	/// en: 'Couldn't determine recording library'
	String get recordingTargetMissing => 'Couldn\'t determine recording library';

	/// en: 'Recording not available for this program'
	String get recordNotAvailable => 'Recording not available for this program';

	/// en: 'Recording cancelled'
	String get recordingCancelled => 'Recording cancelled';

	/// en: 'Recording rule deleted'
	String get recordingRuleDeleted => 'Recording rule deleted';

	/// en: 'Re-evaluate rules'
	String get processRecordingRules => 'Re-evaluate rules';

	/// en: 'Loading recordings...'
	String get loadingRecordings => 'Loading recordings...';

	/// en: 'Recording now'
	String get recordingInProgress => 'Recording now';

	/// en: '${count} scheduled'
	String recordingsCount({required Object count}) => '${count} scheduled';

	/// en: 'Edit rule'
	String get editRule => 'Edit rule';

	/// en: 'Edit'
	String get editRuleAction => 'Edit';

	/// en: 'Recording rule updated'
	String get recordingRuleUpdated => 'Recording rule updated';

	/// en: 'Guide refresh requested'
	String get guideReloadRequested => 'Guide refresh requested';

	/// en: 'Rule re-evaluation requested'
	String get rulesProcessRequested => 'Rule re-evaluation requested';

	/// en: 'Record show'
	String get recordShow => 'Record show';
}

// Path: genres
class TranslationsGenresEn {
	TranslationsGenresEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Genres'
	String get title => 'Genres';

	/// en: 'No genres found'
	String get empty => 'No genres found';

	Map<String, String> get names => {
		'18+': '18+',
		'90s': '90s',
		'Action': 'Action',
		'Adventure': 'Adventure',
		'Animation': 'Animation',
		'Anime': 'Anime',
		'Comedy': 'Comedy',
		'Crime': 'Crime',
		'Documentary': 'Documentary',
		'Drama': 'Drama',
		'Dub': 'Dub',
		'Family': 'Family',
		'Fantasy': 'Fantasy',
		'History': 'History',
		'Horror': 'Horror',
		'Kids': 'Kids',
		'Martial Arts': 'Martial Arts',
		'Music': 'Music',
		'Musical': 'Musical',
		'Mystery': 'Mystery',
		'Reality TV': 'Reality TV',
		'Romance': 'Romance',
		'Science Fiction': 'Science Fiction',
		'Short': 'Short',
		'Sport': 'Sport',
		'Talk Show': 'Talk Show',
		'Thriller': 'Thriller',
		'Travel': 'Travel',
		'Vie': 'Vie',
		'War': 'War',
		'Western': 'Western',
	};
}

// Path: collections
class TranslationsCollectionsEn {
	TranslationsCollectionsEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Collections'
	String get title => 'Collections';

	/// en: 'Collection'
	String get collection => 'Collection';

	/// en: 'Collection is empty'
	String get empty => 'Collection is empty';

	/// en: 'Cannot delete: Unknown library section'
	String get unknownLibrarySection => 'Cannot delete: Unknown library section';

	/// en: 'Delete Collection'
	String get deleteCollection => 'Delete Collection';

	/// en: 'Are you sure you want to delete "${title}"? This action cannot be undone.'
	String deleteConfirm({required Object title}) => 'Are you sure you want to delete "${title}"? This action cannot be undone.';

	/// en: 'Collection deleted'
	String get deleted => 'Collection deleted';

	/// en: 'Failed to delete collection'
	String get deleteFailed => 'Failed to delete collection';

	/// en: 'Failed to delete collection: ${error}'
	String deleteFailedWithError({required Object error}) => 'Failed to delete collection: ${error}';

	/// en: 'Failed to load collection items: ${error}'
	String failedToLoadItems({required Object error}) => 'Failed to load collection items: ${error}';

	/// en: 'Select Collection'
	String get selectCollection => 'Select Collection';

	/// en: 'Collection Name'
	String get collectionName => 'Collection Name';

	/// en: 'Enter collection name'
	String get enterCollectionName => 'Enter collection name';

	/// en: 'Added to collection'
	String get addedToCollection => 'Added to collection';

	/// en: 'Failed to add to collection'
	String get errorAddingToCollection => 'Failed to add to collection';

	/// en: 'Collection created'
	String get created => 'Collection created';

	/// en: 'Remove from collection'
	String get removeFromCollection => 'Remove from collection';

	/// en: 'Remove "${title}" from this collection?'
	String removeFromCollectionConfirm({required Object title}) => 'Remove "${title}" from this collection?';

	/// en: 'Removed from collection'
	String get removedFromCollection => 'Removed from collection';

	/// en: 'Failed to remove from collection'
	String get removeFromCollectionFailed => 'Failed to remove from collection';

	/// en: 'Error removing from collection: ${error}'
	String removeFromCollectionError({required Object error}) => 'Error removing from collection: ${error}';

	/// en: 'Search collections...'
	String get searchCollections => 'Search collections...';
}

// Path: playlists
class TranslationsPlaylistsEn {
	TranslationsPlaylistsEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Playlists'
	String get title => 'Playlists';

	/// en: 'Playlist'
	String get playlist => 'Playlist';

	/// en: 'No playlists found'
	String get noPlaylists => 'No playlists found';

	/// en: 'Create Playlist'
	String get create => 'Create Playlist';

	/// en: 'Playlist Name'
	String get playlistName => 'Playlist Name';

	/// en: 'Enter playlist name'
	String get enterPlaylistName => 'Enter playlist name';

	/// en: 'Delete Playlist'
	String get delete => 'Delete Playlist';

	/// en: 'Remove from Playlist'
	String get removeItem => 'Remove from Playlist';

	/// en: 'Smart Playlist'
	String get smartPlaylist => 'Smart Playlist';

	/// en: '${count} items'
	String itemCount({required Object count}) => '${count} items';

	/// en: '1 item'
	String get oneItem => '1 item';

	/// en: 'This playlist is empty'
	String get emptyPlaylist => 'This playlist is empty';

	/// en: 'Delete Playlist?'
	String get deleteConfirm => 'Delete Playlist?';

	/// en: 'Are you sure you want to delete "${name}"?'
	String deleteMessage({required Object name}) => 'Are you sure you want to delete "${name}"?';

	/// en: 'Playlist created'
	String get created => 'Playlist created';

	/// en: 'Playlist deleted'
	String get deleted => 'Playlist deleted';

	/// en: 'Added to playlist'
	String get itemAdded => 'Added to playlist';

	/// en: 'Removed from playlist'
	String get itemRemoved => 'Removed from playlist';

	/// en: 'Select Playlist'
	String get selectPlaylist => 'Select Playlist';

	/// en: 'Failed to create playlist'
	String get errorCreating => 'Failed to create playlist';

	/// en: 'Failed to delete playlist'
	String get errorDeleting => 'Failed to delete playlist';

	/// en: 'Failed to load playlists'
	String get errorLoading => 'Failed to load playlists';

	/// en: 'Failed to add to playlist'
	String get errorAdding => 'Failed to add to playlist';

	/// en: 'Failed to reorder playlist item'
	String get errorReordering => 'Failed to reorder playlist item';

	/// en: 'Failed to remove from playlist'
	String get errorRemoving => 'Failed to remove from playlist';
}

// Path: downloads
class TranslationsDownloadsEn {
	TranslationsDownloadsEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Downloads'
	String get title => 'Downloads';

	/// en: 'Manage'
	String get manage => 'Manage';

	/// en: 'TV Shows'
	String get tvShows => 'TV Shows';

	/// en: 'Movies'
	String get movies => 'Movies';

	/// en: 'No downloads yet'
	String get noDownloads => 'No downloads yet';

	/// en: 'Downloaded content will appear here for offline viewing'
	String get noDownloadsDescription => 'Downloaded content will appear here for offline viewing';

	/// en: 'Download'
	String get downloadNow => 'Download';

	/// en: 'Delete download'
	String get deleteDownload => 'Delete download';

	/// en: 'Retry download'
	String get retryDownload => 'Retry download';

	/// en: 'Download queued'
	String get downloadQueued => 'Download queued';

	/// en: 'Server error — the file may exceed the remote streaming bitrate limit'
	String get serverErrorBitrate => 'Server error — the file may exceed the remote streaming bitrate limit';

	/// en: '${count} episodes queued for download'
	String episodesQueued({required Object count}) => '${count} episodes queued for download';

	/// en: 'Download deleted'
	String get downloadDeleted => 'Download deleted';

	/// en: 'Are you sure you want to delete "${title}"? This will remove the downloaded file from your device.'
	String deleteConfirm({required Object title}) => 'Are you sure you want to delete "${title}"? This will remove the downloaded file from your device.';

	/// en: 'Deleting...'
	String get deleting => 'Deleting...';

	/// en: 'Deleting ${title}... (${current} of ${total})'
	String deletingWithProgress({required Object title, required Object current, required Object total}) => 'Deleting ${title}... (${current} of ${total})';

	/// en: 'Queued'
	String get queuedTooltip => 'Queued';

	/// en: 'Queued ${files}'
	String queuedFilesTooltip({required Object files}) => 'Queued ${files}';

	/// en: 'Downloading...'
	String get downloadingTooltip => 'Downloading...';

	/// en: 'Downloading ${files}'
	String downloadingFilesTooltip({required Object files}) => 'Downloading ${files}';

	/// en: 'No downloads'
	String get noDownloadsTree => 'No downloads';

	/// en: 'Pause all'
	String get pauseAll => 'Pause all';

	/// en: 'Resume all'
	String get resumeAll => 'Resume all';

	/// en: 'Delete all'
	String get deleteAll => 'Delete all';

	/// en: 'Select Version'
	String get selectVersion => 'Select Version';

	/// en: 'All episodes'
	String get allEpisodes => 'All episodes';

	/// en: 'Unwatched only'
	String get unwatchedOnly => 'Unwatched only';

	/// en: 'Next ${count} unwatched'
	String nextNUnwatched({required Object count}) => 'Next ${count} unwatched';

	/// en: 'Custom amount...'
	String get customAmount => 'Custom amount...';

	/// en: 'How many episodes?'
	String get howManyEpisodes => 'How many episodes?';

	/// en: '${count} items queued for download'
	String itemsQueued({required Object count}) => '${count} items queued for download';

	/// en: 'Keep synced'
	String get keepSynced => 'Keep synced';

	/// en: 'Download once'
	String get downloadOnce => 'Download once';

	/// en: 'Keep ${count} unwatched'
	String keepNUnwatched({required Object count}) => 'Keep ${count} unwatched';

	/// en: 'Edit sync rule'
	String get editSyncRule => 'Edit sync rule';

	/// en: 'Remove sync rule'
	String get removeSyncRule => 'Remove sync rule';

	/// en: 'Stop syncing "${title}"? Downloaded episodes will be kept.'
	String removeSyncRuleConfirm({required Object title}) => 'Stop syncing "${title}"? Downloaded episodes will be kept.';

	/// en: 'Sync rule created — keeping ${count} unwatched episodes'
	String syncRuleCreated({required Object count}) => 'Sync rule created — keeping ${count} unwatched episodes';

	/// en: 'Sync rule updated'
	String get syncRuleUpdated => 'Sync rule updated';

	/// en: 'Sync rule removed'
	String get syncRuleRemoved => 'Sync rule removed';

	/// en: 'Synced ${count} new episodes for ${title}'
	String syncedNewEpisodes({required Object count, required Object title}) => 'Synced ${count} new episodes for ${title}';

	/// en: 'Sync rules'
	String get activeSyncRules => 'Sync rules';

	/// en: 'No sync rules'
	String get noSyncRules => 'No sync rules';

	/// en: 'Manage sync'
	String get manageSyncRule => 'Manage sync';

	/// en: 'Episode count'
	String get editEpisodeCount => 'Episode count';

	/// en: 'Sync filter'
	String get editSyncFilter => 'Sync filter';

	/// en: 'Syncing all items'
	String get syncAllItems => 'Syncing all items';

	/// en: 'Syncing unwatched items'
	String get syncUnwatchedItems => 'Syncing unwatched items';

	/// en: 'Server: ${server} • ${status}'
	String syncRuleServerContext({required Object server, required Object status}) => 'Server: ${server} • ${status}';

	/// en: 'Available'
	String get syncRuleAvailable => 'Available';

	/// en: 'Offline'
	String get syncRuleOffline => 'Offline';

	/// en: 'Sign in required'
	String get syncRuleSignInRequired => 'Sign in required';

	/// en: 'Not available for current profile'
	String get syncRuleNotAvailableForProfile => 'Not available for current profile';

	/// en: 'Unknown server'
	String get syncRuleUnknownServer => 'Unknown server';

	/// en: 'Sync rule created'
	String get syncRuleListCreated => 'Sync rule created';
}

// Path: shaders
class TranslationsShadersEn {
	TranslationsShadersEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Shaders'
	String get title => 'Shaders';

	/// en: 'No video enhancement'
	String get noShaderDescription => 'No video enhancement';

	/// en: 'NVIDIA image scaling for sharper video'
	String get nvscalerDescription => 'NVIDIA image scaling for sharper video';

	/// en: 'Neutral'
	String get artcnnVariantNeutral => 'Neutral';

	/// en: 'Denoise'
	String get artcnnVariantDenoise => 'Denoise';

	/// en: 'Denoise + Sharpen'
	String get artcnnVariantDenoiseSharpen => 'Denoise + Sharpen';

	/// en: 'Fast'
	String get qualityFast => 'Fast';

	/// en: 'High Quality'
	String get qualityHQ => 'High Quality';

	/// en: 'Mode'
	String get mode => 'Mode';

	/// en: 'Import Shader'
	String get importShader => 'Import Shader';

	/// en: 'Custom GLSL shader'
	String get customShaderDescription => 'Custom GLSL shader';

	/// en: 'Shader imported'
	String get shaderImported => 'Shader imported';

	/// en: 'Failed to import shader'
	String get shaderImportFailed => 'Failed to import shader';

	/// en: 'Delete Shader'
	String get deleteShader => 'Delete Shader';

	/// en: 'Delete "${name}"?'
	String deleteShaderConfirm({required Object name}) => 'Delete "${name}"?';
}

// Path: companionRemote
class TranslationsCompanionRemoteEn {
	TranslationsCompanionRemoteEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Companion Remote'
	String get title => 'Companion Remote';

	/// en: 'Connected to ${name}'
	String connectedTo({required Object name}) => 'Connected to ${name}';

	late final TranslationsCompanionRemoteSessionEn session = TranslationsCompanionRemoteSessionEn.internal(_root);
	late final TranslationsCompanionRemotePairingEn pairing = TranslationsCompanionRemotePairingEn.internal(_root);
	late final TranslationsCompanionRemoteRemoteEn remote = TranslationsCompanionRemoteRemoteEn.internal(_root);
}

// Path: videoSettings
class TranslationsVideoSettingsEn {
	TranslationsVideoSettingsEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Playback Settings'
	String get playbackSettings => 'Playback Settings';

	/// en: 'Playback Speed'
	String get playbackSpeed => 'Playback Speed';

	/// en: 'Zoom'
	String get zoom => 'Zoom';

	/// en: 'Sleep Timer'
	String get sleepTimer => 'Sleep Timer';

	/// en: 'Audio Sync'
	String get audioSync => 'Audio Sync';

	/// en: 'Subtitle Sync'
	String get subtitleSync => 'Subtitle Sync';

	/// en: 'HDR'
	String get hdr => 'HDR';

	/// en: 'Audio Output'
	String get audioOutput => 'Audio Output';

	/// en: 'Performance Overlay'
	String get performanceOverlay => 'Performance Overlay';

	/// en: 'Audio Passthrough'
	String get audioPassthrough => 'Audio Passthrough';

	/// en: 'Normalize Loudness'
	String get audioNormalization => 'Normalize Loudness';

	/// en: 'Off'
	String get off => 'Off';

	/// en: 'Active (${time})'
	String active({required Object time}) => 'Active (${time})';

	/// en: 'Normal'
	String get normalSpeed => 'Normal';
}

// Path: externalPlayer
class TranslationsExternalPlayerEn {
	TranslationsExternalPlayerEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'External Player'
	String get title => 'External Player';

	/// en: 'Use External Player'
	String get useExternalPlayer => 'Use External Player';

	/// en: 'Open videos in an external app instead of the built-in player'
	String get useExternalPlayerDescription => 'Open videos in an external app instead of the built-in player';

	/// en: 'Select Player'
	String get selectPlayer => 'Select Player';

	/// en: 'Custom Players'
	String get customPlayers => 'Custom Players';

	/// en: 'System Default'
	String get systemDefault => 'System Default';

	/// en: 'Add Custom Player'
	String get addCustomPlayer => 'Add Custom Player';

	/// en: 'Player Name'
	String get playerName => 'Player Name';

	/// en: 'Command'
	String get playerCommand => 'Command';

	/// en: 'Package Name'
	String get playerPackage => 'Package Name';

	/// en: 'URL Scheme'
	String get playerUrlScheme => 'URL Scheme';

	/// en: 'Off'
	String get off => 'Off';

	/// en: 'Failed to open external player'
	String get launchFailed => 'Failed to open external player';

	/// en: '${name} is not installed'
	String appNotInstalled({required Object name}) => '${name} is not installed';

	/// en: 'Play in External Player'
	String get playInExternalPlayer => 'Play in External Player';
}

// Path: metadataEdit
class TranslationsMetadataEditEn {
	TranslationsMetadataEditEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Edit...'
	String get editMetadata => 'Edit...';

	/// en: 'Edit Metadata'
	String get screenTitle => 'Edit Metadata';

	/// en: 'Basic Info'
	String get basicInfo => 'Basic Info';

	/// en: 'Artwork'
	String get artwork => 'Artwork';

	/// en: 'Advanced Settings'
	String get advancedSettings => 'Advanced Settings';

	/// en: 'Title'
	String get title => 'Title';

	/// en: 'Sort Title'
	String get sortTitle => 'Sort Title';

	/// en: 'Original Title'
	String get originalTitle => 'Original Title';

	/// en: 'Release Date'
	String get releaseDate => 'Release Date';

	/// en: 'Content Rating'
	String get contentRating => 'Content Rating';

	/// en: 'Studio'
	String get studio => 'Studio';

	/// en: 'Tagline'
	String get tagline => 'Tagline';

	/// en: 'Summary'
	String get summary => 'Summary';

	/// en: 'Poster'
	String get poster => 'Poster';

	/// en: 'Background'
	String get background => 'Background';

	/// en: 'Logo'
	String get logo => 'Logo';

	/// en: 'Square Art'
	String get squareArt => 'Square Art';

	/// en: 'Select Poster'
	String get selectPoster => 'Select Poster';

	/// en: 'Select Background'
	String get selectBackground => 'Select Background';

	/// en: 'Select Logo'
	String get selectLogo => 'Select Logo';

	/// en: 'Select Square Art'
	String get selectSquareArt => 'Select Square Art';

	/// en: 'From URL'
	String get fromUrl => 'From URL';

	/// en: 'Upload File'
	String get uploadFile => 'Upload File';

	/// en: 'Enter image URL'
	String get enterImageUrl => 'Enter image URL';

	/// en: 'Image URL'
	String get imageUrl => 'Image URL';

	/// en: 'Metadata updated'
	String get metadataUpdated => 'Metadata updated';

	/// en: 'Failed to update metadata'
	String get metadataUpdateFailed => 'Failed to update metadata';

	/// en: 'Artwork updated'
	String get artworkUpdated => 'Artwork updated';

	/// en: 'Failed to update artwork'
	String get artworkUpdateFailed => 'Failed to update artwork';

	/// en: 'No artwork available'
	String get noArtworkAvailable => 'No artwork available';

	/// en: 'Not set'
	String get notSet => 'Not set';

	/// en: 'Library default'
	String get libraryDefault => 'Library default';

	/// en: 'Account default'
	String get accountDefault => 'Account default';

	/// en: 'Series default'
	String get seriesDefault => 'Series default';

	/// en: 'Episode Sorting'
	String get episodeSorting => 'Episode Sorting';

	/// en: 'Oldest first'
	String get oldestFirst => 'Oldest first';

	/// en: 'Newest first'
	String get newestFirst => 'Newest first';

	/// en: 'Keep'
	String get keep => 'Keep';

	/// en: 'All episodes'
	String get allEpisodes => 'All episodes';

	/// en: '${count} latest episodes'
	String latestEpisodes({required Object count}) => '${count} latest episodes';

	/// en: 'Latest episode'
	String get latestEpisode => 'Latest episode';

	/// en: 'Episodes added in the past ${count} days'
	String episodesAddedPastDays({required Object count}) => 'Episodes added in the past ${count} days';

	/// en: 'Delete Episodes After Playing'
	String get deleteAfterPlaying => 'Delete Episodes After Playing';

	/// en: 'Never'
	String get never => 'Never';

	/// en: 'After a day'
	String get afterADay => 'After a day';

	/// en: 'After a week'
	String get afterAWeek => 'After a week';

	/// en: 'After a month'
	String get afterAMonth => 'After a month';

	/// en: 'On next refresh'
	String get onNextRefresh => 'On next refresh';

	/// en: 'Seasons'
	String get seasons => 'Seasons';

	/// en: 'Show'
	String get show => 'Show';

	/// en: 'Hide'
	String get hide => 'Hide';

	/// en: 'Episode Ordering'
	String get episodeOrdering => 'Episode Ordering';

	/// en: 'The Movie Database (Aired)'
	String get tmdbAiring => 'The Movie Database (Aired)';

	/// en: 'TheTVDB (Aired)'
	String get tvdbAiring => 'TheTVDB (Aired)';

	/// en: 'TheTVDB (Absolute)'
	String get tvdbAbsolute => 'TheTVDB (Absolute)';

	/// en: 'Metadata Language'
	String get metadataLanguage => 'Metadata Language';

	/// en: 'Use Original Title'
	String get useOriginalTitle => 'Use Original Title';

	/// en: 'Preferred Audio Language'
	String get preferredAudioLanguage => 'Preferred Audio Language';

	/// en: 'Preferred Subtitle Language'
	String get preferredSubtitleLanguage => 'Preferred Subtitle Language';

	/// en: 'Auto-Select Subtitle Mode'
	String get subtitleMode => 'Auto-Select Subtitle Mode';

	/// en: 'Manually selected'
	String get manuallySelected => 'Manually selected';

	/// en: 'Shown with foreign audio'
	String get shownWithForeignAudio => 'Shown with foreign audio';

	/// en: 'Always enabled'
	String get alwaysEnabled => 'Always enabled';

	/// en: 'Tags'
	String get tags => 'Tags';

	/// en: 'Add tag'
	String get addTag => 'Add tag';

	/// en: 'Genre'
	String get genre => 'Genre';

	/// en: 'Director'
	String get director => 'Director';

	/// en: 'Writer'
	String get writer => 'Writer';

	/// en: 'Producer'
	String get producer => 'Producer';

	/// en: 'Country'
	String get country => 'Country';

	/// en: 'Collection'
	String get collection => 'Collection';

	/// en: 'Label'
	String get label => 'Label';

	/// en: 'Style'
	String get style => 'Style';

	/// en: 'Mood'
	String get mood => 'Mood';
}

// Path: matchScreen
class TranslationsMatchScreenEn {
	TranslationsMatchScreenEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Match...'
	String get match => 'Match...';

	/// en: 'Fix Match...'
	String get fixMatch => 'Fix Match...';

	/// en: 'Unmatch'
	String get unmatch => 'Unmatch';

	/// en: 'Clear the current match for this item? Plex will treat it as unmatched until you match it again.'
	String get unmatchConfirm => 'Clear the current match for this item? Plex will treat it as unmatched until you match it again.';

	/// en: 'Item unmatched'
	String get unmatchSuccess => 'Item unmatched';

	/// en: 'Failed to unmatch item'
	String get unmatchFailed => 'Failed to unmatch item';

	/// en: 'Match applied'
	String get matchApplied => 'Match applied';

	/// en: 'Failed to apply match'
	String get matchFailed => 'Failed to apply match';

	/// en: 'Title'
	String get titleHint => 'Title';

	/// en: 'Year'
	String get yearHint => 'Year';

	/// en: 'Search'
	String get search => 'Search';

	/// en: 'No matches found'
	String get noMatchesFound => 'No matches found';
}

// Path: serverTasks
class TranslationsServerTasksEn {
	TranslationsServerTasksEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Server Tasks'
	String get title => 'Server Tasks';

	/// en: 'Failed to load tasks'
	String get failedToLoad => 'Failed to load tasks';

	/// en: 'No tasks running'
	String get noTasks => 'No tasks running';
}

// Path: addServer
class TranslationsAddServerEn {
	TranslationsAddServerEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Add Jellyfin server'
	String get addJellyfinTitle => 'Add Jellyfin server';

	/// en: 'Enter your Jellyfin server URL — e.g. `https://jellyfin.example.com`. You can sign in afterwards.'
	String get jellyfinUrlIntro => 'Enter your Jellyfin server URL — e.g. `https://jellyfin.example.com`. You can sign in afterwards.';

	/// en: 'Server URL'
	String get serverUrl => 'Server URL';

	/// en: 'Find server'
	String get findServer => 'Find server';

	/// en: 'Username'
	String get username => 'Username';

	/// en: 'Password'
	String get password => 'Password';

	/// en: 'Sign in'
	String get signIn => 'Sign in';

	/// en: 'Change'
	String get change => 'Change';

	/// en: 'Required'
	String get required => 'Required';

	/// en: 'Could not reach the server: ${error}'
	String couldNotReachServer({required Object error}) => 'Could not reach the server: ${error}';

	/// en: 'Sign-in failed: ${error}'
	String signInFailed({required Object error}) => 'Sign-in failed: ${error}';

	/// en: 'Quick Connect failed: ${error}'
	String quickConnectFailed({required Object error}) => 'Quick Connect failed: ${error}';

	/// en: 'Sign in with Plex'
	String get addPlexTitle => 'Sign in with Plex';

	/// en: 'Choose how to sign in to Plex. The browser flow opens plex.tv where you confirm the connection; the QR option is handy for TV / remote devices.'
	String get plexAuthIntro => 'Choose how to sign in to Plex. The browser flow opens plex.tv where you confirm the connection; the QR option is handy for TV / remote devices.';

	/// en: 'Scan this QR code to sign in.'
	String get plexQRPrompt => 'Scan this QR code to sign in.';

	/// en: 'Waiting for plex.tv to confirm your sign-in…'
	String get waitingForPlexConfirmation => 'Waiting for plex.tv to confirm your sign-in…';

	/// en: 'PIN expired before sign-in. Please try again.'
	String get pinExpired => 'PIN expired before sign-in. Please try again.';

	/// en: 'This device is already signed in to a Plex account. Sign out from settings to switch accounts.'
	String get duplicatePlexAccount => 'This device is already signed in to a Plex account. Sign out from settings to switch accounts.';

	/// en: 'Failed to register account: ${error}'
	String failedToRegisterAccount({required Object error}) => 'Failed to register account: ${error}';

	/// en: 'Enter your Jellyfin server URL'
	String get enterJellyfinUrlError => 'Enter your Jellyfin server URL';

	/// en: 'Add connection'
	String get addConnectionTitle => 'Add connection';

	/// en: 'Add to ${name}'
	String addConnectionTitleScoped({required Object name}) => 'Add to ${name}';

	/// en: 'Add another media server. You can mix Plex accounts and Jellyfin servers — items from every connected backend appear together on the home screen.'
	String get addConnectionIntroGlobal => 'Add another media server. You can mix Plex accounts and Jellyfin servers — items from every connected backend appear together on the home screen.';

	/// en: 'Add a new server, or borrow one from another profile.'
	String get addConnectionIntroScoped => 'Add a new server, or borrow one from another profile.';

	/// en: 'Sign in with Plex'
	String get signInWithPlexCard => 'Sign in with Plex';

	/// en: 'Authorize this device against your Plex account. Servers shared with the account come along automatically.'
	String get signInWithPlexCardSubtitle => 'Authorize this device against your Plex account. Servers shared with the account come along automatically.';

	/// en: 'Authorize a new Plex account. Its Home users appear as profiles.'
	String get signInWithPlexCardSubtitleScoped => 'Authorize a new Plex account. Its Home users appear as profiles.';

	/// en: 'Connect to Jellyfin'
	String get connectToJellyfinCard => 'Connect to Jellyfin';

	/// en: 'Enter your Jellyfin server URL and sign in with username + password (Quick Connect coming soon).'
	String get connectToJellyfinCardSubtitle => 'Enter your Jellyfin server URL and sign in with username + password (Quick Connect coming soon).';

	/// en: 'Sign in to a Jellyfin server. Binds to ${name}.'
	String connectToJellyfinCardSubtitleScoped({required Object name}) => 'Sign in to a Jellyfin server. Binds to ${name}.';

	/// en: 'Borrow from another profile'
	String get borrowFromAnotherProfile => 'Borrow from another profile';

	/// en: 'Reuse a connection that's already attached to a different profile. PIN-protected source profiles ask for the PIN.'
	String get borrowFromAnotherProfileSubtitle => 'Reuse a connection that\'s already attached to a different profile. PIN-protected source profiles ask for the PIN.';
}

// Path: languages
class TranslationsLanguagesEn {
	TranslationsLanguagesEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Afar'
	String get aa => 'Afar';

	/// en: 'Abkhaz'
	String get ab => 'Abkhaz';

	/// en: 'Avestan'
	String get ae => 'Avestan';

	/// en: 'Afrikaans'
	String get af => 'Afrikaans';

	/// en: 'Akan'
	String get ak => 'Akan';

	/// en: 'Amharic'
	String get am => 'Amharic';

	/// en: 'Aragonese'
	String get an => 'Aragonese';

	/// en: 'Arabic'
	String get ar => 'Arabic';

	/// en: 'Assamese'
	String get as => 'Assamese';

	/// en: 'Avaric'
	String get av => 'Avaric';

	/// en: 'Aymara'
	String get ay => 'Aymara';

	/// en: 'Azerbaijani'
	String get az => 'Azerbaijani';

	/// en: 'Bashkir'
	String get ba => 'Bashkir';

	/// en: 'Belarusian'
	String get be => 'Belarusian';

	/// en: 'Bulgarian'
	String get bg => 'Bulgarian';

	/// en: 'Bihari'
	String get bh => 'Bihari';

	/// en: 'Bislama'
	String get bi => 'Bislama';

	/// en: 'Bambara'
	String get bm => 'Bambara';

	/// en: 'Bengali, Bangla'
	String get bn => 'Bengali, Bangla';

	/// en: 'Tibetan Standard, Tibetan, Central'
	String get bo => 'Tibetan Standard, Tibetan, Central';

	/// en: 'Breton'
	String get br => 'Breton';

	/// en: 'Bosnian'
	String get bs => 'Bosnian';

	/// en: 'Catalan'
	String get ca => 'Catalan';

	/// en: 'Chechen'
	String get ce => 'Chechen';

	/// en: 'Chamorro'
	String get ch => 'Chamorro';

	/// en: 'Corsican'
	String get co => 'Corsican';

	/// en: 'Cree'
	String get cr => 'Cree';

	/// en: 'Czech'
	String get cs => 'Czech';

	/// en: 'Old Church Slavonic, Church Slavonic, Old Bulgarian'
	String get cu => 'Old Church Slavonic, Church Slavonic, Old Bulgarian';

	/// en: 'Chuvash'
	String get cv => 'Chuvash';

	/// en: 'Welsh'
	String get cy => 'Welsh';

	/// en: 'Danish'
	String get da => 'Danish';

	/// en: 'German'
	String get de => 'German';

	/// en: 'Divehi, Dhivehi, Maldivian'
	String get dv => 'Divehi, Dhivehi, Maldivian';

	/// en: 'Dzongkha'
	String get dz => 'Dzongkha';

	/// en: 'Ewe'
	String get ee => 'Ewe';

	/// en: 'Greek (modern)'
	String get el => 'Greek (modern)';

	/// en: 'English'
	String get en => 'English';

	/// en: 'Esperanto'
	String get eo => 'Esperanto';

	/// en: 'Spanish'
	String get es => 'Spanish';

	/// en: 'Estonian'
	String get et => 'Estonian';

	/// en: 'Basque'
	String get eu => 'Basque';

	/// en: 'Persian (Farsi)'
	String get fa => 'Persian (Farsi)';

	/// en: 'Fula, Fulah, Pulaar, Pular'
	String get ff => 'Fula, Fulah, Pulaar, Pular';

	/// en: 'Finnish'
	String get fi => 'Finnish';

	/// en: 'Fijian'
	String get fj => 'Fijian';

	/// en: 'Faroese'
	String get fo => 'Faroese';

	/// en: 'French'
	String get fr => 'French';

	/// en: 'Western Frisian'
	String get fy => 'Western Frisian';

	/// en: 'Irish'
	String get ga => 'Irish';

	/// en: 'Scottish Gaelic, Gaelic'
	String get gd => 'Scottish Gaelic, Gaelic';

	/// en: 'Galician'
	String get gl => 'Galician';

	/// en: 'Guaraní'
	String get gn => 'Guaraní';

	/// en: 'Gujarati'
	String get gu => 'Gujarati';

	/// en: 'Manx'
	String get gv => 'Manx';

	/// en: 'Hausa'
	String get ha => 'Hausa';

	/// en: 'Hebrew (modern)'
	String get he => 'Hebrew (modern)';

	/// en: 'Hindi'
	String get hi => 'Hindi';

	/// en: 'Hiri Motu'
	String get ho => 'Hiri Motu';

	/// en: 'Croatian'
	String get hr => 'Croatian';

	/// en: 'Haitian, Haitian Creole'
	String get ht => 'Haitian, Haitian Creole';

	/// en: 'Hungarian'
	String get hu => 'Hungarian';

	/// en: 'Armenian'
	String get hy => 'Armenian';

	/// en: 'Herero'
	String get hz => 'Herero';

	/// en: 'Interlingua'
	String get ia => 'Interlingua';

	/// en: 'Indonesian'
	String get id => 'Indonesian';

	/// en: 'Interlingue'
	String get ie => 'Interlingue';

	/// en: 'Igbo'
	String get ig => 'Igbo';

	/// en: 'Nuosu'
	String get ii => 'Nuosu';

	/// en: 'Inupiaq'
	String get ik => 'Inupiaq';

	/// en: 'Ido'
	String get io => 'Ido';

	/// en: 'Icelandic'
	String get kIs => 'Icelandic';

	/// en: 'Italian'
	String get it => 'Italian';

	/// en: 'Inuktitut'
	String get iu => 'Inuktitut';

	/// en: 'Japanese'
	String get ja => 'Japanese';

	/// en: 'Javanese'
	String get jv => 'Javanese';

	/// en: 'Georgian'
	String get ka => 'Georgian';

	/// en: 'Kongo'
	String get kg => 'Kongo';

	/// en: 'Kikuyu, Gikuyu'
	String get ki => 'Kikuyu, Gikuyu';

	/// en: 'Kwanyama, Kuanyama'
	String get kj => 'Kwanyama, Kuanyama';

	/// en: 'Kazakh'
	String get kk => 'Kazakh';

	/// en: 'Kalaallisut, Greenlandic'
	String get kl => 'Kalaallisut, Greenlandic';

	/// en: 'Khmer'
	String get km => 'Khmer';

	/// en: 'Kannada'
	String get kn => 'Kannada';

	/// en: 'Korean'
	String get ko => 'Korean';

	/// en: 'Kanuri'
	String get kr => 'Kanuri';

	/// en: 'Kashmiri'
	String get ks => 'Kashmiri';

	/// en: 'Kurdish'
	String get ku => 'Kurdish';

	/// en: 'Komi'
	String get kv => 'Komi';

	/// en: 'Cornish'
	String get kw => 'Cornish';

	/// en: 'Kyrgyz'
	String get ky => 'Kyrgyz';

	/// en: 'Latin'
	String get la => 'Latin';

	/// en: 'Luxembourgish, Letzeburgesch'
	String get lb => 'Luxembourgish, Letzeburgesch';

	/// en: 'Ganda'
	String get lg => 'Ganda';

	/// en: 'Limburgish, Limburgan, Limburger'
	String get li => 'Limburgish, Limburgan, Limburger';

	/// en: 'Lingala'
	String get ln => 'Lingala';

	/// en: 'Lao'
	String get lo => 'Lao';

	/// en: 'Lithuanian'
	String get lt => 'Lithuanian';

	/// en: 'Luba-Katanga'
	String get lu => 'Luba-Katanga';

	/// en: 'Latvian'
	String get lv => 'Latvian';

	/// en: 'Malagasy'
	String get mg => 'Malagasy';

	/// en: 'Marshallese'
	String get mh => 'Marshallese';

	/// en: 'Māori'
	String get mi => 'Māori';

	/// en: 'Macedonian'
	String get mk => 'Macedonian';

	/// en: 'Malayalam'
	String get ml => 'Malayalam';

	/// en: 'Mongolian'
	String get mn => 'Mongolian';

	/// en: 'Marathi (Marāṭhī)'
	String get mr => 'Marathi (Marāṭhī)';

	/// en: 'Malay'
	String get ms => 'Malay';

	/// en: 'Maltese'
	String get mt => 'Maltese';

	/// en: 'Burmese'
	String get my => 'Burmese';

	/// en: 'Nauruan'
	String get na => 'Nauruan';

	/// en: 'Norwegian Bokmål'
	String get nb => 'Norwegian Bokmål';

	/// en: 'Northern Ndebele'
	String get nd => 'Northern Ndebele';

	/// en: 'Nepali'
	String get ne => 'Nepali';

	/// en: 'Ndonga'
	String get ng => 'Ndonga';

	/// en: 'Dutch'
	String get nl => 'Dutch';

	/// en: 'Norwegian Nynorsk'
	String get nn => 'Norwegian Nynorsk';

	/// en: 'Norwegian'
	String get no => 'Norwegian';

	/// en: 'Southern Ndebele'
	String get nr => 'Southern Ndebele';

	/// en: 'Navajo, Navaho'
	String get nv => 'Navajo, Navaho';

	/// en: 'Chichewa, Chewa, Nyanja'
	String get ny => 'Chichewa, Chewa, Nyanja';

	/// en: 'Occitan'
	String get oc => 'Occitan';

	/// en: 'Ojibwe, Ojibwa'
	String get oj => 'Ojibwe, Ojibwa';

	/// en: 'Oromo'
	String get om => 'Oromo';

	/// en: 'Oriya'
	String get or => 'Oriya';

	/// en: 'Ossetian, Ossetic'
	String get os => 'Ossetian, Ossetic';

	/// en: '(Eastern) Punjabi'
	String get pa => '(Eastern) Punjabi';

	/// en: 'Pāli'
	String get pi => 'Pāli';

	/// en: 'Polish'
	String get pl => 'Polish';

	/// en: 'Pashto, Pushto'
	String get ps => 'Pashto, Pushto';

	/// en: 'Portuguese'
	String get pt => 'Portuguese';

	/// en: 'Quechua'
	String get qu => 'Quechua';

	/// en: 'Romansh'
	String get rm => 'Romansh';

	/// en: 'Kirundi'
	String get rn => 'Kirundi';

	/// en: 'Romanian'
	String get ro => 'Romanian';

	/// en: 'Russian'
	String get ru => 'Russian';

	/// en: 'Kinyarwanda'
	String get rw => 'Kinyarwanda';

	/// en: 'Sanskrit (Saṁskṛta)'
	String get sa => 'Sanskrit (Saṁskṛta)';

	/// en: 'Sardinian'
	String get sc => 'Sardinian';

	/// en: 'Sindhi'
	String get sd => 'Sindhi';

	/// en: 'Northern Sami'
	String get se => 'Northern Sami';

	/// en: 'Sango'
	String get sg => 'Sango';

	/// en: 'Sinhalese, Sinhala'
	String get si => 'Sinhalese, Sinhala';

	/// en: 'Slovak'
	String get sk => 'Slovak';

	/// en: 'Slovene'
	String get sl => 'Slovene';

	/// en: 'Samoan'
	String get sm => 'Samoan';

	/// en: 'Shona'
	String get sn => 'Shona';

	/// en: 'Somali'
	String get so => 'Somali';

	/// en: 'Albanian'
	String get sq => 'Albanian';

	/// en: 'Serbian'
	String get sr => 'Serbian';

	/// en: 'Swati'
	String get ss => 'Swati';

	/// en: 'Southern Sotho'
	String get st => 'Southern Sotho';

	/// en: 'Sundanese'
	String get su => 'Sundanese';

	/// en: 'Swedish'
	String get sv => 'Swedish';

	/// en: 'Swahili'
	String get sw => 'Swahili';

	/// en: 'Tamil'
	String get ta => 'Tamil';

	/// en: 'Telugu'
	String get te => 'Telugu';

	/// en: 'Tajik'
	String get tg => 'Tajik';

	/// en: 'Thai'
	String get th => 'Thai';

	/// en: 'Tigrinya'
	String get ti => 'Tigrinya';

	/// en: 'Turkmen'
	String get tk => 'Turkmen';

	/// en: 'Tagalog'
	String get tl => 'Tagalog';

	/// en: 'Tswana'
	String get tn => 'Tswana';

	/// en: 'Tonga (Tonga Islands)'
	String get to => 'Tonga (Tonga Islands)';

	/// en: 'Turkish'
	String get tr => 'Turkish';

	/// en: 'Tsonga'
	String get ts => 'Tsonga';

	/// en: 'Tatar'
	String get tt => 'Tatar';

	/// en: 'Twi'
	String get tw => 'Twi';

	/// en: 'Tahitian'
	String get ty => 'Tahitian';

	/// en: 'Uyghur'
	String get ug => 'Uyghur';

	/// en: 'Ukrainian'
	String get uk => 'Ukrainian';

	/// en: 'Urdu'
	String get ur => 'Urdu';

	/// en: 'Uzbek'
	String get uz => 'Uzbek';

	/// en: 'Venda'
	String get ve => 'Venda';

	/// en: 'Vietnamese'
	String get vi => 'Vietnamese';

	/// en: 'Volapük'
	String get vo => 'Volapük';

	/// en: 'Walloon'
	String get wa => 'Walloon';

	/// en: 'Wolof'
	String get wo => 'Wolof';

	/// en: 'Xhosa'
	String get xh => 'Xhosa';

	/// en: 'Yiddish'
	String get yi => 'Yiddish';

	/// en: 'Yoruba'
	String get yo => 'Yoruba';

	/// en: 'Zhuang, Chuang'
	String get za => 'Zhuang, Chuang';

	/// en: 'Chinese'
	String get zh => 'Chinese';

	/// en: 'Zulu'
	String get zu => 'Zulu';

	/// en: 'Unknown'
	String get unknown => 'Unknown';
}

// Path: hotkeys.actions
class TranslationsHotkeysActionsEn {
	TranslationsHotkeysActionsEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Play/Pause'
	String get playPause => 'Play/Pause';

	/// en: 'Volume Up'
	String get volumeUp => 'Volume Up';

	/// en: 'Volume Down'
	String get volumeDown => 'Volume Down';

	/// en: 'Seek Forward (${seconds}s)'
	String seekForward({required Object seconds}) => 'Seek Forward (${seconds}s)';

	/// en: 'Seek Backward (${seconds}s)'
	String seekBackward({required Object seconds}) => 'Seek Backward (${seconds}s)';

	/// en: 'Toggle Fullscreen'
	String get fullscreenToggle => 'Toggle Fullscreen';

	/// en: 'Toggle Mute'
	String get muteToggle => 'Toggle Mute';

	/// en: 'Toggle Subtitles'
	String get subtitleToggle => 'Toggle Subtitles';

	/// en: 'Next Audio Track'
	String get audioTrackNext => 'Next Audio Track';

	/// en: 'Next Subtitle Track'
	String get subtitleTrackNext => 'Next Subtitle Track';

	/// en: 'Next Chapter'
	String get chapterNext => 'Next Chapter';

	/// en: 'Previous Chapter'
	String get chapterPrevious => 'Previous Chapter';

	/// en: 'Next Episode'
	String get episodeNext => 'Next Episode';

	/// en: 'Previous Episode'
	String get episodePrevious => 'Previous Episode';

	/// en: 'Increase Speed'
	String get speedIncrease => 'Increase Speed';

	/// en: 'Decrease Speed'
	String get speedDecrease => 'Decrease Speed';

	/// en: 'Reset Speed'
	String get speedReset => 'Reset Speed';

	/// en: 'Seek to Next Subtitle'
	String get subSeekNext => 'Seek to Next Subtitle';

	/// en: 'Seek to Previous Subtitle'
	String get subSeekPrev => 'Seek to Previous Subtitle';

	/// en: 'Toggle Shaders'
	String get shaderToggle => 'Toggle Shaders';

	/// en: 'Skip Intro/Credits'
	String get skipMarker => 'Skip Intro/Credits';
}

// Path: videoControls.pipErrors
class TranslationsVideoControlsPipErrorsEn {
	TranslationsVideoControlsPipErrorsEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Requires Android 8.0 or newer'
	String get androidVersion => 'Requires Android 8.0 or newer';

	/// en: 'Requires iOS 15.0 or newer'
	String get iosVersion => 'Requires iOS 15.0 or newer';

	/// en: 'Picture-in-picture permission is disabled. Enable it in Settings > Apps > Lumi > Picture-in-picture'
	String get permissionDisabled => 'Picture-in-picture permission is disabled. Enable it in Settings > Apps > Lumi > Picture-in-picture';

	/// en: 'Device doesn't support picture-in-picture mode'
	String get notSupported => 'Device doesn\'t support picture-in-picture mode';

	/// en: 'Failed to switch video output for picture-in-picture'
	String get voSwitchFailed => 'Failed to switch video output for picture-in-picture';

	/// en: 'Picture-in-picture failed to start'
	String get failed => 'Picture-in-picture failed to start';

	/// en: 'An error occurred: ${error}'
	String unknown({required Object error}) => 'An error occurred: ${error}';
}

// Path: libraries.tabs
class TranslationsLibrariesTabsEn {
	TranslationsLibrariesTabsEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Recommended'
	String get recommended => 'Recommended';

	/// en: 'Browse'
	String get browse => 'Browse';

	/// en: 'Collections'
	String get collections => 'Collections';

	/// en: 'Genres'
	String get genres => 'Genres';

	/// en: 'Playlists'
	String get playlists => 'Playlists';
}

// Path: libraries.groupings
class TranslationsLibrariesGroupingsEn {
	TranslationsLibrariesGroupingsEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Grouping'
	String get title => 'Grouping';

	/// en: 'All'
	String get all => 'All';

	/// en: 'Movies'
	String get movies => 'Movies';

	/// en: 'TV Shows'
	String get shows => 'TV Shows';

	/// en: 'Seasons'
	String get seasons => 'Seasons';

	/// en: 'Episodes'
	String get episodes => 'Episodes';

	/// en: 'Folders'
	String get folders => 'Folders';
}

// Path: libraries.filterCategories
class TranslationsLibrariesFilterCategoriesEn {
	TranslationsLibrariesFilterCategoriesEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Genre'
	String get genre => 'Genre';

	/// en: 'Year'
	String get year => 'Year';

	/// en: 'Content Rating'
	String get contentRating => 'Content Rating';

	/// en: 'Tag'
	String get tag => 'Tag';

	/// en: 'Unwatched'
	String get unwatched => 'Unwatched';

	/// en: 'Unwatched only'
	String get unwatchedOnly => 'Unwatched only';

	/// en: 'Unwatched Shows'
	String get unwatchedShows => 'Unwatched Shows';

	/// en: 'Unwatched Episodes'
	String get unwatchedEpisodes => 'Unwatched Episodes';

	/// en: 'Unplayed'
	String get unplayed => 'Unplayed';

	/// en: 'Unwatched Shows'
	String get show_unwatched => 'Unwatched Shows';

	/// en: 'Unwatched Episodes'
	String get episode_unwatched => 'Unwatched Episodes';

	/// en: 'Unwatched Shows'
	String get show_unplayed => 'Unwatched Shows';

	/// en: 'Unwatched Episodes'
	String get episode_unplayed => 'Unwatched Episodes';

	/// en: 'Unwatched Shows'
	String get shows_unwatched => 'Unwatched Shows';

	/// en: 'Unwatched Episodes'
	String get episodes_unwatched => 'Unwatched Episodes';

	/// en: 'In Progress'
	String get inProgress => 'In Progress';

	/// en: 'Audio Language'
	String get audioLanguage => 'Audio Language';

	/// en: 'Subtitle Language'
	String get subtitleLanguage => 'Subtitle Language';

	/// en: 'Decade'
	String get decade => 'Decade';

	/// en: 'Actor'
	String get actor => 'Actor';

	/// en: 'Director'
	String get director => 'Director';

	/// en: 'Writer'
	String get writer => 'Writer';

	/// en: 'Producer'
	String get producer => 'Producer';

	/// en: 'Country'
	String get country => 'Country';

	/// en: 'Network'
	String get network => 'Network';
}

// Path: libraries.sortLabels
class TranslationsLibrariesSortLabelsEn {
	TranslationsLibrariesSortLabelsEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Title'
	String get title => 'Title';

	/// en: 'Date Added'
	String get dateAdded => 'Date Added';

	/// en: 'Release Date'
	String get releaseDate => 'Release Date';

	/// en: 'Rating'
	String get rating => 'Rating';

	/// en: 'Last Played'
	String get lastPlayed => 'Last Played';

	/// en: 'Play Count'
	String get playCount => 'Play Count';

	/// en: 'Random'
	String get random => 'Random';

	/// en: 'Date Shared'
	String get dateShared => 'Date Shared';

	/// en: 'Latest Episode Air Date'
	String get latestEpisodeAirDate => 'Latest Episode Air Date';

	/// en: 'Last Episode Date Added'
	String get latestEpisodeAddedDate => 'Last Episode Date Added';
}

// Path: companionRemote.session
class TranslationsCompanionRemoteSessionEn {
	TranslationsCompanionRemoteSessionEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Starting remote server...'
	String get startingServer => 'Starting remote server...';

	/// en: 'Failed to start remote server:'
	String get failedToCreate => 'Failed to start remote server:';

	/// en: 'Host Address'
	String get hostAddress => 'Host Address';

	/// en: 'Connected'
	String get connected => 'Connected';

	/// en: 'Remote server active'
	String get serverRunning => 'Remote server active';

	/// en: 'Remote server stopped'
	String get serverStopped => 'Remote server stopped';

	/// en: 'Mobile devices on your network can discover and connect to this app'
	String get serverRunningDescription => 'Mobile devices on your network can discover and connect to this app';

	/// en: 'Start the server to allow mobile devices to connect'
	String get serverStoppedDescription => 'Start the server to allow mobile devices to connect';

	/// en: 'Use your mobile device to control this app'
	String get usePhoneToControl => 'Use your mobile device to control this app';

	/// en: 'Start Server'
	String get startServer => 'Start Server';

	/// en: 'Stop Server'
	String get stopServer => 'Stop Server';

	/// en: 'Minimize'
	String get minimize => 'Minimize';
}

// Path: companionRemote.pairing
class TranslationsCompanionRemotePairingEn {
	TranslationsCompanionRemotePairingEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Devices on your network running Lumi with the same Plex account will appear automatically'
	String get discoveryDescription => 'Devices on your network running Lumi with the same Plex account will appear automatically';

	/// en: '192.168.1.100:48632'
	String get hostAddressHint => '192.168.1.100:48632';

	/// en: 'Connecting...'
	String get connecting => 'Connecting...';

	/// en: 'Looking for devices...'
	String get searchingForDevices => 'Looking for devices...';

	/// en: 'No devices found on your network'
	String get noDevicesFound => 'No devices found on your network';

	/// en: 'Make sure Lumi is open on your desktop and both devices are on the same WiFi network'
	String get noDevicesHint => 'Make sure Lumi is open on your desktop and both devices are on the same WiFi network';

	/// en: 'Available Devices'
	String get availableDevices => 'Available Devices';

	/// en: 'Manual Connection'
	String get manualConnection => 'Manual Connection';

	/// en: 'Could not initialize secure connection. Make sure you are signed in to a Plex account.'
	String get cryptoInitFailed => 'Could not initialize secure connection. Make sure you are signed in to a Plex account.';

	/// en: 'Please enter host address'
	String get validationHostRequired => 'Please enter host address';

	/// en: 'Format must be IP:port (e.g., 192.168.1.100:48632)'
	String get validationHostFormat => 'Format must be IP:port (e.g., 192.168.1.100:48632)';

	/// en: 'Connection timed out. Make sure both devices are on the same network.'
	String get connectionTimedOut => 'Connection timed out. Make sure both devices are on the same network.';

	/// en: 'Could not find the device. Make sure Lumi is running on the host.'
	String get sessionNotFound => 'Could not find the device. Make sure Lumi is running on the host.';

	/// en: 'Authentication failed. Make sure both devices are on the same Plex account.'
	String get authFailed => 'Authentication failed. Make sure both devices are on the same Plex account.';

	/// en: 'Failed to connect: ${error}'
	String failedToConnect({required Object error}) => 'Failed to connect: ${error}';
}

// Path: companionRemote.remote
class TranslationsCompanionRemoteRemoteEn {
	TranslationsCompanionRemoteRemoteEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Do you want to disconnect from the remote session?'
	String get disconnectConfirm => 'Do you want to disconnect from the remote session?';

	/// en: 'Reconnecting...'
	String get reconnecting => 'Reconnecting...';

	/// en: 'Attempt ${current} of 5'
	String attemptOf({required Object current}) => 'Attempt ${current} of 5';

	/// en: 'Retry Now'
	String get retryNow => 'Retry Now';

	/// en: 'Remote'
	String get tabRemote => 'Remote';

	/// en: 'Play'
	String get tabPlay => 'Play';

	/// en: 'More'
	String get tabMore => 'More';

	/// en: 'Menu'
	String get menu => 'Menu';

	/// en: 'Tab Navigation'
	String get tabNavigation => 'Tab Navigation';

	/// en: 'Discover'
	String get tabDiscover => 'Discover';

	/// en: 'Libraries'
	String get tabLibraries => 'Libraries';

	/// en: 'Search'
	String get tabSearch => 'Search';

	/// en: 'Downloads'
	String get tabDownloads => 'Downloads';

	/// en: 'Settings'
	String get tabSettings => 'Settings';

	/// en: 'Previous'
	String get previous => 'Previous';

	/// en: 'Play/Pause'
	String get playPause => 'Play/Pause';

	/// en: 'Next'
	String get next => 'Next';

	/// en: 'Seek Back'
	String get seekBack => 'Seek Back';

	/// en: 'Stop'
	String get stop => 'Stop';

	/// en: 'Seek Fwd'
	String get seekForward => 'Seek Fwd';

	/// en: 'Volume'
	String get volume => 'Volume';

	/// en: 'Down'
	String get volumeDown => 'Down';

	/// en: 'Up'
	String get volumeUp => 'Up';

	/// en: 'Fullscreen'
	String get fullscreen => 'Fullscreen';

	/// en: 'Subtitles'
	String get subtitles => 'Subtitles';

	/// en: 'Audio'
	String get audio => 'Audio';

	/// en: 'Search on desktop...'
	String get searchHint => 'Search on desktop...';
}

/// The flat map containing all translations for locale <en>.
/// Only for edge cases! For simple maps, use the map function of this library.
///
/// The Dart AOT compiler has issues with very large switch statements,
/// so the map is split into smaller functions (512 entries each).
extension on Translations {
	dynamic _flatMapFunction(String path) {
		return switch (path) {
			'app.title' => 'Lumi',
			'app.tagline' => 'App coi phim dỏm nhất Việt Nam',
			'auth.signIn' => 'Sign in',
			'auth.signInWithPlex' => 'Sign in with Plex',
			'auth.showQRCode' => 'Show QR Code',
			'auth.authenticate' => 'Authenticate',
			'auth.authenticationTimeout' => 'Authentication timed out. Please try again.',
			'auth.scanQRToSignIn' => 'Scan this QR code to sign in',
			'auth.waitingForAuth' => 'Waiting for authentication...\nPlease complete sign-in in your browser.',
			'auth.useBrowser' => 'Use browser',
			'auth.or' => 'or',
			'auth.connectToJellyfin' => 'Connect to Jellyfin',
			'auth.useQuickConnect' => 'Use Quick Connect',
			'auth.quickConnectCode' => 'Quick Connect code',
			'auth.quickConnectInstructions' => 'Open your Jellyfin server in a web browser, sign in, and choose Quick Connect from the user menu. Enter this code to approve sign-in.',
			'auth.quickConnectWaiting' => 'Waiting for approval…',
			'auth.quickConnectCancel' => 'Cancel',
			'auth.quickConnectExpired' => 'Quick Connect code expired before approval. Please try again.',
			'common.cancel' => 'Cancel',
			'common.save' => 'Save',
			'common.close' => 'Close',
			'common.clear' => 'Clear',
			'common.reset' => 'Reset',
			'common.later' => 'Later',
			'common.submit' => 'Submit',
			'common.confirm' => 'Confirm',
			'common.retry' => 'Retry',
			'common.logout' => 'Logout',
			'common.unknown' => 'Unknown',
			'common.refresh' => 'Refresh',
			'common.yes' => 'Yes',
			'common.no' => 'No',
			'common.delete' => 'Delete',
			'common.shuffle' => 'Shuffle',
			'common.addTo' => 'Add to...',
			'common.createNew' => 'Create new',
			'common.connect' => 'Connect',
			'common.disconnect' => 'Disconnect',
			'common.play' => 'Play',
			'common.pause' => 'Pause',
			'common.resume' => 'Resume',
			'common.error' => 'Error',
			'common.search' => 'Search',
			'common.home' => 'Home',
			'common.back' => 'Back',
			'common.settings' => 'Settings',
			'common.mute' => 'Mute',
			'common.ok' => 'OK',
			'common.reconnect' => 'Reconnect',
			'common.exit' => 'Exit',
			'common.viewAll' => 'View All',
			'common.checkingNetwork' => 'Checking network...',
			'common.refreshingServers' => 'Refreshing servers...',
			'common.loadingServers' => 'Loading servers...',
			'common.connectingToServers' => 'Connecting to servers...',
			'common.startingOfflineMode' => 'Starting offline mode...',
			'common.loading' => 'Loading...',
			'common.fullscreen' => 'Fullscreen',
			'common.exitFullscreen' => 'Exit fullscreen',
			'common.pressBackAgainToExit' => 'Press back again to exit',
			'common.done' => 'Done',
			'screens.licenses' => 'Licenses',
			'screens.switchProfile' => 'Switch Profile',
			'screens.subtitleStyling' => 'Subtitle Styling',
			'screens.mpvConfig' => 'mpv.conf',
			'screens.logs' => 'Logs',
			'update.available' => 'Update Available',
			'update.versionAvailable' => ({required Object version}) => 'Version ${version} is available',
			'update.currentVersion' => ({required Object version}) => 'Current: ${version}',
			'update.skipVersion' => 'Skip This Version',
			'update.viewRelease' => 'View Release',
			'update.latestVersion' => 'You are on the latest version',
			'update.checkFailed' => 'Failed to check for updates',
			'mediaDetail.watchNow' => 'Watch Now',
			'mediaDetail.addToPlaylist' => 'Add to Playlist',
			'mediaDetail.plot' => 'Plot',
			'mediaDetail.season' => 'Season',
			'mediaDetail.episodes' => 'Episodes',
			'mediaDetail.episode' => 'Episode',
			'mediaDetail.episodesListHeader' => 'Episodes',
			'mediaDetail.seasonsColumn' => 'Seasons',
			'settings.title' => 'Settings',
			'settings.supportDeveloper' => 'Support Lumi',
			'settings.supportDeveloperDescription' => 'Donate via Liberapay to fund development',
			'settings.language' => 'Language',
			'settings.theme' => 'Theme',
			'settings.appearance' => 'Appearance',
			'settings.videoPlayback' => 'Video Playback',
			'settings.videoPlaybackDescription' => 'Configure playback behavior',
			'settings.advanced' => 'Advanced',
			'settings.episodePosterMode' => 'Episode Poster Style',
			'settings.seriesPoster' => 'Series Poster',
			'settings.seasonPoster' => 'Season Poster',
			'settings.episodeThumbnail' => 'Thumbnail',
			'settings.showHeroSectionDescription' => 'Display featured content carousel on home screen',
			'settings.secondsLabel' => 'Seconds',
			'settings.minutesLabel' => 'Minutes',
			'settings.secondsShort' => 's',
			'settings.minutesShort' => 'm',
			'settings.durationHint' => ({required Object min, required Object max}) => 'Enter duration (${min}-${max})',
			'settings.systemTheme' => 'System',
			'settings.lightTheme' => 'Light',
			'settings.darkTheme' => 'Dark',
			'settings.oledTheme' => 'OLED',
			'settings.libraryDensity' => 'Library Density',
			'settings.compact' => 'Compact',
			'settings.comfortable' => 'Comfortable',
			'settings.viewMode' => 'View Mode',
			'settings.gridView' => 'Grid',
			'settings.listView' => 'List',
			'settings.showHeroSection' => 'Show Hero Section',
			'settings.useGlobalHubs' => 'Use Home Layout',
			'settings.useGlobalHubsDescription' => 'Show home page hubs like the official client. When off, shows per-library recommendations instead.',
			'settings.showServerNameOnHubs' => 'Show Server Name on Hubs',
			'settings.showServerNameOnHubsDescription' => 'Always display the server name in hub titles. When off, only shows for duplicate hub names.',
			'settings.groupLibrariesByServer' => 'Group Libraries by Server',
			'settings.groupLibrariesByServerDescription' => 'Show a header for each media server in the sidebar when you\'re connected to multiple servers.',
			'settings.alwaysKeepSidebarOpen' => 'Always Keep Sidebar Open',
			'settings.alwaysKeepSidebarOpenDescription' => 'Sidebar stays expanded and content area adjusts to fit',
			'settings.showUnwatchedCount' => 'Show Unwatched Count',
			'settings.showUnwatchedCountDescription' => 'Display unwatched episode count on shows and seasons',
			'settings.showEpisodeNumberOnCards' => 'Show Episode Number on Cards',
			'settings.showEpisodeNumberOnCardsDescription' => 'Show episode number alongside the season (e.g. S2 E3) on episode cards',
			'settings.showSeasonPostersOnTabs' => 'Show Season Posters on Tabs',
			'settings.showSeasonPostersOnTabsDescription' => 'Display the season\'s poster above each season tab on a show\'s detail page',
			'settings.hideSpoilers' => 'Hide Spoilers for Unwatched Episodes',
			'settings.hideSpoilersDescription' => 'Blur thumbnails and hide descriptions for episodes you haven\'t watched yet',
			'settings.playerBackend' => 'Player Backend',
			'settings.audioLanguage' => 'Audio Language',
			'settings.none' => 'None',
			'settings.exoPlayer' => 'Advanced (Recommended)',
			'settings.mpv' => 'Standard',
			'settings.hardwareDecoding' => 'Hardware Decoding',
			'settings.hardwareDecodingDescription' => 'Use hardware acceleration when available',
			'settings.bufferSize' => 'Buffer Size',
			'settings.bufferSizeMB' => ({required Object size}) => '${size}MB',
			'settings.bufferSizeAuto' => 'Auto (Recommended)',
			'settings.bufferSizeWarning' => ({required Object heap, required Object size}) => 'Your device has ${heap}MB of memory. A ${size}MB buffer may cause playback issues.',
			'settings.defaultQualityTitle' => 'Default Quality',
			'settings.defaultQualityDescription' => 'Used when starting playback. Lower values reduce bandwidth.',
			'settings.switchServer' => 'Switch Server',
			'settings.subtitleStyling' => 'Subtitle Styling',
			'settings.subtitleStylingDescription' => 'Customize subtitle appearance',
			'settings.smallSkipDuration' => 'Small Skip Duration',
			'settings.largeSkipDuration' => 'Large Skip Duration',
			'settings.rewindOnResume' => 'Rewind on Resume',
			'settings.secondsUnit' => ({required Object seconds}) => '${seconds} seconds',
			'settings.defaultSleepTimer' => 'Default Sleep Timer',
			'settings.minutesUnit' => ({required Object minutes}) => '${minutes} minutes',
			'settings.rememberTrackSelections' => 'Remember track selections per show/movie',
			'settings.rememberTrackSelectionsDescription' => 'Automatically save audio and subtitle language preferences when you change tracks during playback',
			'settings.showChapterMarkersOnTimeline' => 'Show chapter markers on seek bar',
			'settings.showChapterMarkersOnTimelineDescription' => 'Segment the seek bar at chapter boundaries',
			'settings.clickVideoTogglesPlayback' => 'Click on video to toggle play/pause',
			'settings.clickVideoTogglesPlaybackDescription' => 'If enabled, clicking on the video player will play/pause the video. Otherwise, clicking will show/hide the playback controls.',
			'settings.videoPlayerControls' => 'Video Player Controls',
			'settings.keyboardShortcuts' => 'Keyboard Shortcuts',
			'settings.keyboardShortcutsDescription' => 'Customize keyboard shortcuts',
			'settings.videoPlayerNavigation' => 'Video Player Navigation',
			'settings.videoPlayerNavigationDescription' => 'Use arrow keys to navigate video player controls',
			'settings.debugLogging' => 'Debug Logging',
			'settings.debugLoggingDescription' => 'Enable detailed logging for troubleshooting',
			'settings.viewLogs' => 'View Logs',
			'settings.viewLogsDescription' => 'View application logs',
			'settings.clearCache' => 'Clear Cache',
			'settings.clearCacheDescription' => 'This will clear all cached images and data. The app may take longer to load content after clearing the cache.',
			'settings.clearCacheSuccess' => 'Cache cleared successfully',
			'settings.resetSettings' => 'Reset Settings',
			'settings.resetSettingsDescription' => 'This will reset all settings to their default values. This action cannot be undone.',
			'settings.resetSettingsSuccess' => 'Settings reset successfully',
			'settings.backup' => 'Backup',
			'settings.exportSettings' => 'Export Settings',
			'settings.exportSettingsDescription' => 'Save your preferences to a file',
			'settings.exportSettingsSuccess' => 'Settings exported',
			'settings.exportSettingsFailed' => 'Could not export settings',
			'settings.importSettings' => 'Import Settings',
			'settings.importSettingsDescription' => 'Restore preferences from a file',
			'settings.importSettingsConfirm' => 'This will replace your current settings. Continue?',
			'settings.importSettingsSuccess' => 'Settings imported',
			'settings.importSettingsFailed' => 'Could not import settings',
			'settings.importSettingsInvalidFile' => 'This file isn\'t a valid Lumi settings export',
			'settings.importSettingsNoUser' => 'Sign in before importing settings',
			'settings.shortcutsReset' => 'Shortcuts reset to defaults',
			'settings.about' => 'About',
			'settings.aboutDescription' => 'App information and licenses',
			'settings.updates' => 'Updates',
			'settings.updateAvailable' => 'Update Available',
			'settings.checkForUpdates' => 'Check for Updates',
			'settings.autoCheckUpdatesOnStartup' => 'Automatically check for updates on startup',
			'settings.autoCheckUpdatesOnStartupDescription' => 'Show a notification when a new version is available at launch',
			'settings.validationErrorEnterNumber' => 'Please enter a valid number',
			'settings.validationErrorDuration' => ({required Object min, required Object max, required Object unit}) => 'Duration must be between ${min} and ${max} ${unit}',
			'settings.shortcutAlreadyAssigned' => ({required Object action}) => 'Shortcut already assigned to ${action}',
			'settings.shortcutUpdated' => ({required Object action}) => 'Shortcut updated for ${action}',
			'settings.autoSkip' => 'Auto Skip',
			'settings.autoSkipIntro' => 'Auto Skip Intro',
			'settings.autoSkipIntroDescription' => 'Automatically skip intro markers after a few seconds',
			'settings.autoSkipCredits' => 'Auto Skip Credits',
			'settings.autoSkipCreditsDescription' => 'Automatically skip credits and play next episode',
			'settings.forceSkipMarkerFallback' => 'Force Fallback Markers',
			'settings.forceSkipMarkerFallbackDescription' => 'Use chapter title patterns for skip markers even when Plex provides native markers',
			'settings.autoSkipDelay' => 'Auto Skip Delay',
			'settings.autoSkipDelayDescription' => ({required Object seconds}) => 'Wait ${seconds} seconds before auto-skipping',
			'settings.introPattern' => 'Intro Marker Pattern',
			'settings.introPatternDescription' => 'Regex pattern to match intro markers in chapter titles',
			'settings.creditsPattern' => 'Credits Marker Pattern',
			'settings.creditsPatternDescription' => 'Regex pattern to match credits markers in chapter titles',
			'settings.invalidRegex' => 'Invalid regular expression',
			'settings.downloads' => 'Downloads',
			'settings.downloadLocationDescription' => 'Choose where to store downloaded content',
			'settings.downloadLocationDefault' => 'Default (App Storage)',
			'settings.downloadLocationCustom' => 'Custom Location',
			'settings.selectFolder' => 'Select Folder',
			'settings.resetToDefault' => 'Reset to Default',
			'settings.currentPath' => ({required Object path}) => 'Current: ${path}',
			'settings.downloadLocationChanged' => 'Download location changed',
			'settings.downloadLocationReset' => 'Download location reset to default',
			'settings.downloadLocationInvalid' => 'Selected folder is not writable',
			'settings.downloadLocationSelectError' => 'Failed to select folder',
			'settings.downloadOnWifiOnly' => 'Download on WiFi only',
			'settings.downloadOnWifiOnlyDescription' => 'Prevent downloads when on cellular data',
			'settings.autoRemoveWatchedDownloads' => 'Auto-remove watched downloads',
			'settings.autoRemoveWatchedDownloadsDescription' => 'Automatically delete downloaded episodes and movies when marked as watched',
			'settings.cellularDownloadBlocked' => 'Downloads are disabled on cellular data. Connect to WiFi or change the setting.',
			'settings.maxVolume' => 'Maximum Volume',
			'settings.maxVolumeDescription' => 'Allow volume boost above 100% for quiet media',
			'settings.maxVolumePercent' => ({required Object percent}) => '${percent}%',
			'settings.discordRichPresence' => 'Discord Rich Presence',
			'settings.discordRichPresenceDescription' => 'Show what you\'re watching on Discord',
			'settings.companionRemoteServer' => 'Companion Remote Server',
			'settings.companionRemoteServerDescription' => 'Allow mobile devices on your network to control this app',
			'settings.autoPip' => 'Auto Picture-in-Picture',
			'settings.autoPipDescription' => 'Automatically enter picture-in-picture when leaving the app during playback',
			'settings.matchContentFrameRate' => 'Match Content Frame Rate',
			'settings.matchContentFrameRateDescription' => 'Adjust display refresh rate to match video content, reducing judder and saving battery',
			'settings.matchRefreshRate' => 'Match Refresh Rate',
			'settings.matchRefreshRateDescription' => 'Switch display refresh rate to match video content when in fullscreen',
			'settings.matchDynamicRange' => 'Match Dynamic Range',
			'settings.matchDynamicRangeDescription' => 'Auto-enable HDR for HDR content and revert to SDR when leaving the player',
			'settings.displaySwitchDelay' => 'Display Switch Delay',
			'settings.tunneledPlayback' => 'Tunneled Playback',
			'settings.tunneledPlaybackDescription' => 'Use hardware-accelerated video tunneling. Disable if you see a black screen with audio on HDR content',
			'settings.requireProfileSelectionOnOpen' => 'Ask for profile on app open',
			'settings.requireProfileSelectionOnOpenDescription' => 'Show profile selection every time the app is opened',
			'settings.forceTvMode' => 'Force TV mode',
			'settings.forceTvModeDescription' => 'Use the TV layout regardless of auto-detection. Useful on Android TV devices that don\'t report the leanback feature. Restarts the app on change.',
			'settings.startInFullscreen' => 'Start in fullscreen',
			'settings.startInFullscreenDescription' => 'Open Lumi in fullscreen mode at launch',
			'settings.autoHidePerformanceOverlay' => 'Auto-Hide Performance Overlay',
			'settings.autoHidePerformanceOverlayDescription' => 'Fade the performance overlay with the playback controls',
			'settings.showNavBarLabels' => 'Show Navigation Bar Labels',
			'settings.showNavBarLabelsDescription' => 'Display text labels under navigation bar icons',
			'settings.liveTvDefaultFavorites' => 'Default to Favorite Channels',
			'settings.liveTvDefaultFavoritesDescription' => 'Show only favorite channels when opening Live TV',
			'settings.display' => 'Display',
			'settings.homeScreen' => 'Home Screen',
			'settings.navigation' => 'Navigation',
			'settings.window' => 'Window',
			'settings.content' => 'Content',
			'settings.player' => 'Player',
			'settings.subtitlesAndConfig' => 'Subtitles & Configuration',
			'settings.seekAndTiming' => 'Seek & Timing',
			'settings.behavior' => 'Behavior',
			'search.hint' => 'Search movies, shows, music...',
			'search.tryDifferentTerm' => 'Try a different search term',
			'search.searchYourMedia' => 'Search your media',
			'search.enterTitleActorOrKeyword' => 'Enter a title, actor, or keyword',
			'search.otherResults' => 'Other Results',
			'hotkeys.setShortcutFor' => ({required Object actionName}) => 'Set Shortcut for ${actionName}',
			'hotkeys.clearShortcut' => 'Clear shortcut',
			'hotkeys.actions.playPause' => 'Play/Pause',
			'hotkeys.actions.volumeUp' => 'Volume Up',
			'hotkeys.actions.volumeDown' => 'Volume Down',
			'hotkeys.actions.seekForward' => ({required Object seconds}) => 'Seek Forward (${seconds}s)',
			'hotkeys.actions.seekBackward' => ({required Object seconds}) => 'Seek Backward (${seconds}s)',
			'hotkeys.actions.fullscreenToggle' => 'Toggle Fullscreen',
			'hotkeys.actions.muteToggle' => 'Toggle Mute',
			'hotkeys.actions.subtitleToggle' => 'Toggle Subtitles',
			'hotkeys.actions.audioTrackNext' => 'Next Audio Track',
			'hotkeys.actions.subtitleTrackNext' => 'Next Subtitle Track',
			'hotkeys.actions.chapterNext' => 'Next Chapter',
			'hotkeys.actions.chapterPrevious' => 'Previous Chapter',
			'hotkeys.actions.episodeNext' => 'Next Episode',
			'hotkeys.actions.episodePrevious' => 'Previous Episode',
			'hotkeys.actions.speedIncrease' => 'Increase Speed',
			'hotkeys.actions.speedDecrease' => 'Decrease Speed',
			'hotkeys.actions.speedReset' => 'Reset Speed',
			'hotkeys.actions.subSeekNext' => 'Seek to Next Subtitle',
			'hotkeys.actions.subSeekPrev' => 'Seek to Previous Subtitle',
			'hotkeys.actions.shaderToggle' => 'Toggle Shaders',
			'hotkeys.actions.skipMarker' => 'Skip Intro/Credits',
			'fileInfo.title' => 'File Info',
			'fileInfo.video' => 'Video',
			'fileInfo.audio' => 'Audio',
			'fileInfo.file' => 'File',
			'fileInfo.advanced' => 'Advanced',
			'fileInfo.codec' => 'Codec',
			'fileInfo.resolution' => 'Resolution',
			'fileInfo.bitrate' => 'Bitrate',
			'fileInfo.frameRate' => 'Frame Rate',
			'fileInfo.aspectRatio' => 'Aspect Ratio',
			'fileInfo.profile' => 'Profile',
			'fileInfo.bitDepth' => 'Bit Depth',
			'fileInfo.colorSpace' => 'Color Space',
			'fileInfo.colorRange' => 'Color Range',
			'fileInfo.colorPrimaries' => 'Color Primaries',
			'fileInfo.chromaSubsampling' => 'Chroma Subsampling',
			'fileInfo.channels' => 'Channels',
			'fileInfo.subtitles' => 'Subtitles',
			'fileInfo.overallBitrate' => 'Overall Bitrate',
			'fileInfo.path' => 'Path',
			'fileInfo.size' => 'Size',
			'fileInfo.container' => 'Container',
			'fileInfo.duration' => 'Duration',
			'fileInfo.optimizedForStreaming' => 'Optimized for Streaming',
			'fileInfo.has64bitOffsets' => '64-bit Offsets',
			'mediaMenu.markAsWatched' => 'Mark as Watched',
			'mediaMenu.markAsUnwatched' => 'Mark as Unwatched',
			'mediaMenu.removeFromContinueWatching' => 'Remove from Continue Watching',
			'mediaMenu.goToSeries' => 'Go to series',
			'mediaMenu.goToSeason' => 'Go to season',
			'mediaMenu.shufflePlay' => 'Shuffle Play',
			'mediaMenu.fileInfo' => 'File Info',
			'mediaMenu.deleteFromServer' => 'Delete from server',
			'mediaMenu.confirmDelete' => 'This will permanently delete this media and its files from your server. This cannot be undone.',
			'mediaMenu.deleteMultipleWarning' => 'This includes all episodes and their files.',
			'mediaMenu.mediaDeletedSuccessfully' => 'Media item deleted successfully',
			'mediaMenu.mediaFailedToDelete' => 'Failed to delete media item',
			'mediaMenu.rate' => 'Rate',
			'mediaMenu.playFromBeginning' => 'Play from Beginning',
			'mediaMenu.playVersion' => 'Play Version...',
			'accessibility.mediaCardMovie' => ({required Object title}) => '${title}, movie',
			'accessibility.mediaCardShow' => ({required Object title}) => '${title}, TV show',
			'accessibility.mediaCardEpisode' => ({required Object title, required Object episodeInfo}) => '${title}, ${episodeInfo}',
			'accessibility.mediaCardSeason' => ({required Object title, required Object seasonInfo}) => '${title}, ${seasonInfo}',
			'accessibility.mediaCardWatched' => 'watched',
			'accessibility.mediaCardPartiallyWatched' => ({required Object percent}) => '${percent} percent watched',
			'accessibility.mediaCardUnwatched' => 'unwatched',
			'accessibility.tapToPlay' => 'Tap to play',
			'tooltips.shufflePlay' => 'Shuffle play',
			'tooltips.playTrailer' => 'Play trailer',
			'tooltips.markAsWatched' => 'Mark as watched',
			'tooltips.markAsUnwatched' => 'Mark as unwatched',
			'videoControls.audioLabel' => 'Audio',
			'videoControls.subtitlesLabel' => 'Subtitles',
			'videoControls.opaque' => 'Opaque',
			'videoControls.resetToZero' => 'Reset to 0ms',
			'videoControls.addTime' => ({required Object amount, required Object unit}) => '+${amount}${unit}',
			'videoControls.minusTime' => ({required Object amount, required Object unit}) => '-${amount}${unit}',
			'videoControls.playsLater' => ({required Object label}) => '${label} plays later',
			'videoControls.playsEarlier' => ({required Object label}) => '${label} plays earlier',
			'videoControls.noOffset' => 'No offset',
			'videoControls.letterbox' => 'Letterbox',
			'videoControls.fillScreen' => 'Fill screen',
			'videoControls.stretch' => 'Stretch',
			'videoControls.lockRotation' => 'Lock rotation',
			'videoControls.unlockRotation' => 'Unlock rotation',
			'videoControls.timerActive' => 'Timer Active',
			'videoControls.playbackWillPauseIn' => ({required Object duration}) => 'Playback will pause in ${duration}',
			'videoControls.stillWatching' => 'Still watching?',
			'videoControls.pausingIn' => ({required Object seconds}) => 'Pausing in ${seconds}s',
			'videoControls.continueWatching' => 'Continue',
			'videoControls.autoPlayNext' => 'Auto-Play Next',
			'videoControls.playNext' => 'Play Next',
			'videoControls.playButton' => 'Play',
			'videoControls.pauseButton' => 'Pause',
			'videoControls.seekBackwardButton' => ({required Object seconds}) => 'Seek backward ${seconds} seconds',
			'videoControls.seekForwardButton' => ({required Object seconds}) => 'Seek forward ${seconds} seconds',
			'videoControls.previousButton' => 'Previous episode',
			'videoControls.nextButton' => 'Next episode',
			'videoControls.previousChapterButton' => 'Previous chapter',
			'videoControls.nextChapterButton' => 'Next chapter',
			'videoControls.muteButton' => 'Mute',
			'videoControls.unmuteButton' => 'Unmute',
			'videoControls.settingsButton' => 'Video settings',
			'videoControls.tracksButton' => 'Audio & Subtitles',
			'videoControls.chaptersButton' => 'Chapters',
			'videoControls.versionsButton' => 'Video versions',
			'videoControls.versionQualityButton' => 'Version & Quality',
			'videoControls.versionColumnHeader' => 'Version',
			'videoControls.qualityColumnHeader' => 'Quality',
			'videoControls.qualityOriginal' => 'Original',
			'videoControls.qualityPresetLabel' => ({required Object resolution, required Object bitrate}) => '${resolution}p ${bitrate} Mbps',
			'videoControls.qualityBandwidthEstimate' => ({required Object bitrate}) => '~${bitrate} Mbps',
			'videoControls.transcodeUnavailableFallback' => 'Transcoding unavailable — playing original quality',
			'videoControls.pipButton' => 'Picture-in-Picture mode',
			'videoControls.aspectRatioButton' => 'Aspect ratio',
			'videoControls.zoomPercent' => ({required Object percent}) => 'Zoom ${percent}%',
			'videoControls.ambientLighting' => 'Ambient lighting',
			'videoControls.fullscreenButton' => 'Enter fullscreen',
			'videoControls.exitFullscreenButton' => 'Exit fullscreen',
			'videoControls.alwaysOnTopButton' => 'Always on top',
			'videoControls.rotationLockButton' => 'Rotation lock',
			'videoControls.lockScreen' => 'Lock screen',
			'videoControls.screenLockButton' => 'Screen lock',
			'videoControls.longPressToUnlock' => 'Long press to unlock',
			'videoControls.timelineSlider' => 'Video timeline',
			'videoControls.volumeSlider' => 'Volume level',
			'videoControls.endsAt' => ({required Object time}) => 'Ends at ${time}',
			'videoControls.pipActive' => 'Playing in Picture-in-Picture',
			'videoControls.pipFailed' => 'Picture-in-picture failed to start',
			'videoControls.pipErrors.androidVersion' => 'Requires Android 8.0 or newer',
			'videoControls.pipErrors.iosVersion' => 'Requires iOS 15.0 or newer',
			'videoControls.pipErrors.permissionDisabled' => 'Picture-in-picture permission is disabled. Enable it in Settings > Apps > Lumi > Picture-in-picture',
			'videoControls.pipErrors.notSupported' => 'Device doesn\'t support picture-in-picture mode',
			'videoControls.pipErrors.voSwitchFailed' => 'Failed to switch video output for picture-in-picture',
			'videoControls.pipErrors.failed' => 'Picture-in-picture failed to start',
			'videoControls.pipErrors.unknown' => ({required Object error}) => 'An error occurred: ${error}',
			'videoControls.chapters' => 'Chapters',
			'videoControls.noChaptersAvailable' => 'No chapters available',
			'videoControls.queue' => 'Queue',
			'videoControls.noQueueItems' => 'No items in queue',
			'videoControls.searchSubtitles' => 'Search Subtitles',
			'videoControls.language' => 'Language',
			'videoControls.noSubtitlesFound' => 'No subtitles found',
			'videoControls.subtitleDownloaded' => 'Subtitle downloaded',
			'videoControls.subtitleDownloadFailed' => 'Failed to download subtitle',
			'videoControls.searchLanguages' => 'Search languages...',
			'userStatus.admin' => 'Admin',
			'userStatus.restricted' => 'Restricted',
			'userStatus.protected' => 'Protected',
			'userStatus.current' => 'CURRENT',
			'messages.markedAsWatched' => 'Marked as watched',
			'messages.markedAsUnwatched' => 'Marked as unwatched',
			'messages.markedAsWatchedOffline' => 'Marked as watched (will sync when online)',
			'messages.markedAsUnwatchedOffline' => 'Marked as unwatched (will sync when online)',
			'messages.autoRemovedWatchedDownload' => ({required Object title}) => 'Auto-removed: ${title}',
			'messages.removedFromContinueWatching' => 'Removed from Continue Watching',
			'messages.errorLoading' => ({required Object error}) => 'Error: ${error}',
			'messages.fileInfoNotAvailable' => 'File information not available',
			'messages.errorLoadingFileInfo' => ({required Object error}) => 'Error loading file info: ${error}',
			'messages.errorLoadingSeries' => 'Error loading series',
			'messages.errorLoadingSeason' => 'Error loading season',
			'messages.musicNotSupported' => 'Music playback is not yet supported',
			'messages.noDescriptionAvailable' => 'No description available',
			'messages.noProfilesAvailable' => 'No profiles available',
			'messages.contactAdminForProfiles' => 'Contact your server administrator to add profiles',
			'messages.unableToDetermineLibrarySection' => 'Unable to determine library section for this item',
			'messages.logsCleared' => 'Logs cleared',
			'messages.logsCopied' => 'Logs copied to clipboard',
			'messages.noLogsAvailable' => 'No logs available',
			'messages.libraryScanning' => ({required Object title}) => 'Scanning "${title}"...',
			'messages.libraryScanStarted' => ({required Object title}) => 'Library scan started for "${title}"',
			'messages.libraryScanFailed' => ({required Object error}) => 'Failed to scan library: ${error}',
			'messages.metadataRefreshing' => ({required Object title}) => 'Refreshing metadata for "${title}"...',
			'messages.metadataRefreshStarted' => ({required Object title}) => 'Metadata refresh started for "${title}"',
			'messages.metadataRefreshFailed' => ({required Object error}) => 'Failed to refresh metadata: ${error}',
			'messages.logoutConfirm' => 'Are you sure you want to logout?',
			'messages.noSeasonsFound' => 'No seasons found',
			'messages.noEpisodesFound' => 'No episodes found in first season',
			'messages.noEpisodesFoundGeneral' => 'No episodes found',
			'messages.noResultsFound' => 'No results found',
			'messages.sleepTimerSet' => ({required Object label}) => 'Sleep timer set for ${label}',
			'messages.noItemsAvailable' => 'No items available',
			'messages.failedToCreatePlayQueueNoItems' => 'Failed to create play queue - no items',
			'messages.failedPlayback' => ({required Object action, required Object error}) => 'Failed to ${action}: ${error}',
			'messages.switchingToCompatiblePlayer' => 'Switching to compatible player...',
			'messages.serverLimitTitle' => 'Playback failed',
			'messages.serverLimitBody' => 'The server returned an error (HTTP 500). This usually means the server owner has set a bandwidth or transcoding limit that\'s rejecting your session. There\'s nothing to do from the client — the server owner needs to adjust their settings.',
			'messages.logsUploaded' => 'Logs uploaded',
			'messages.logsUploadFailed' => 'Failed to upload logs',
			'messages.logId' => 'Log ID',
			'subtitlingStyling.text' => 'Text',
			'subtitlingStyling.border' => 'Border',
			'subtitlingStyling.background' => 'Background',
			'subtitlingStyling.fontSize' => 'Font Size',
			'subtitlingStyling.textColor' => 'Text Color',
			'subtitlingStyling.borderSize' => 'Border Size',
			'subtitlingStyling.borderColor' => 'Border Color',
			'subtitlingStyling.backgroundOpacity' => 'Background Opacity',
			'subtitlingStyling.backgroundColor' => 'Background Color',
			'subtitlingStyling.position' => 'Position',
			'subtitlingStyling.assOverride' => 'ASS Override',
			'subtitlingStyling.bold' => 'Bold',
			'subtitlingStyling.italic' => 'Italic',
			'mpvConfig.title' => 'mpv.conf',
			'mpvConfig.description' => 'Advanced video player settings',
			'mpvConfig.presets' => 'Presets',
			'mpvConfig.noPresets' => 'No saved presets',
			'mpvConfig.saveAsPreset' => 'Save as Preset...',
			'mpvConfig.presetName' => 'Preset Name',
			'mpvConfig.presetNameHint' => 'Enter a name for this preset',
			'mpvConfig.loadPreset' => 'Load',
			'mpvConfig.deletePreset' => 'Delete',
			'mpvConfig.presetSaved' => 'Preset saved',
			'mpvConfig.presetLoaded' => 'Preset loaded',
			'mpvConfig.presetDeleted' => 'Preset deleted',
			'mpvConfig.confirmDeletePreset' => 'Are you sure you want to delete this preset?',
			'mpvConfig.configPlaceholder' => 'gpu-api=vulkan\nhwdec=auto\n# comment',
			'dialog.confirmAction' => 'Confirm Action',
			'profiles.addLumiProfile' => 'Add Lumi profile',
			'profiles.switchingProfile' => 'Switching profile…',
			'profiles.deleteThisProfileTitle' => 'Delete this profile?',
			'profiles.deleteThisProfileMessage' => ({required Object displayName}) => '${displayName} will be removed. Connections themselves are not affected.',
			'profiles.active' => 'Active',
			'profiles.manage' => 'Manage',
			'profiles.delete' => 'Delete',
			'profiles.signOut' => 'Sign out',
			'profiles.signOutPlexTitle' => 'Sign out of Plex?',
			'profiles.signOutPlexMessage' => ({required Object displayName}) => '${displayName} and every Plex Home user on this account will be removed from this device. You can sign back in any time.',
			'profiles.signedOutPlex' => 'Signed out of Plex.',
			'profiles.signOutFailed' => 'Sign out failed.',
			'profiles.sectionTitle' => 'Switch User',
			'profiles.summarySingle' => 'Add profiles to mix managed users and local identities',
			'profiles.summaryMultipleWithActive' => ({required Object count, required Object activeName}) => '${count} profiles · active: ${activeName}',
			'profiles.summaryMultiple' => ({required Object count}) => '${count} profiles',
			'profiles.removeConnectionTitle' => 'Remove connection?',
			'profiles.removeConnectionMessage' => ({required Object displayName, required Object connectionLabel}) => '${displayName} will lose access to ${connectionLabel}. The connection itself stays available to other profiles.',
			'profiles.deleteProfileTitle' => 'Delete profile?',
			'profiles.deleteProfileMessage' => ({required Object displayName}) => 'This removes ${displayName} and all its connections from this device. The underlying Plex/Jellyfin servers aren\'t affected.',
			'profiles.profileNameLabel' => 'Profile name',
			'profiles.pinProtectionLabel' => 'PIN protection',
			_ => null,
		} ?? switch (path) {
			'profiles.pinManagedByPlex' => 'PIN managed by Plex. Edit on plex.tv.',
			'profiles.noPinSetEditOnPlex' => 'No PIN set. To require one, edit the home user on plex.tv.',
			'profiles.setPin' => 'Set PIN',
			'profiles.connectionsLabel' => 'Connections',
			'profiles.add' => 'Add',
			'profiles.deleteProfileButton' => 'Delete profile',
			'profiles.noConnectionsHint' => 'No connections — add one to use this profile.',
			'profiles.plexHomeAccount' => 'Plex Home account',
			'profiles.connectionDefault' => 'Default',
			'profiles.makeDefault' => 'Make default',
			'profiles.removeConnection' => 'Remove',
			'profiles.borrowAddTo' => ({required Object displayName}) => 'Add to ${displayName}',
			'profiles.borrowExplain' => 'Borrow a connection from another profile. PIN-protected source profiles ask for the PIN before sharing.',
			'profiles.borrowEmpty' => 'Nothing to borrow yet.',
			'profiles.borrowEmptySubtitle' => 'Connect a Plex account or Jellyfin server to another profile first, then come back here.',
			'profiles.newProfile' => 'New profile',
			'profiles.profileNameHint' => 'e.g. Guests, Kids, Family Room',
			'profiles.pinProtectionOptional' => 'PIN protection (optional)',
			'profiles.pinExplain' => '4-digit PIN required to switch into this profile. Soft barrier — anyone who can clear app data can bypass it.',
			'profiles.continueButton' => 'Continue',
			'profiles.pinsDontMatch' => 'PINs don\'t match',
			'connections.sectionTitle' => 'Connections',
			'connections.addConnection' => 'Add connection',
			'connections.addConnectionSubtitleNoProfile' => 'Sign in with Plex or connect a Jellyfin server',
			'connections.addConnectionSubtitleScoped' => ({required Object displayName}) => 'Add to ${displayName} — Plex account, Jellyfin server, or borrow from another profile',
			'connections.sessionExpiredOne' => ({required Object name}) => 'Session expired for ${name}',
			'connections.sessionExpiredMany' => ({required Object count}) => 'Session expired for ${count} servers',
			'connections.signInAgain' => 'Sign in again',
			'discover.title' => 'Discover',
			'discover.switchProfile' => 'Switch Profile',
			'discover.noContentAvailable' => 'No content available',
			'discover.addMediaToLibraries' => 'Add some media to your libraries',
			'discover.continueWatching' => 'Continue Watching',
			'discover.continueWatchingIn' => ({required Object library}) => 'Continue Watching in ${library}',
			'discover.nextUp' => 'Next Up',
			'discover.nextUpIn' => ({required Object library}) => 'Next Up in ${library}',
			'discover.recentlyAdded' => 'Recently Added',
			'discover.recentlyAddedIn' => ({required Object library}) => 'Recently Added in ${library}',
			'discover.playEpisode' => ({required Object season, required Object episode}) => 'S${season}E${episode}',
			'discover.overview' => 'Overview',
			'discover.cast' => 'Cast',
			'discover.extras' => 'Trailers & Extras',
			'discover.studio' => 'Studio',
			'discover.rating' => 'Rating',
			'discover.movie' => 'Movie',
			'discover.tvShow' => 'TV Show',
			'discover.minutesLeft' => ({required Object minutes}) => '${minutes} min left',
			'errors.searchFailed' => ({required Object error}) => 'Search failed: ${error}',
			'errors.connectionTimeout' => ({required Object context}) => 'Connection timeout while loading ${context}',
			'errors.connectionFailed' => 'Unable to connect to media server',
			'errors.failedToLoad' => ({required Object context, required Object error}) => 'Failed to load ${context}: ${error}',
			'errors.noClientAvailable' => 'No client available',
			'errors.authenticationFailed' => ({required Object error}) => 'Authentication failed: ${error}',
			'errors.couldNotLaunchUrl' => 'Could not launch auth URL',
			'errors.pleaseEnterToken' => 'Please enter a token',
			'errors.invalidToken' => 'Invalid token',
			'errors.failedToVerifyToken' => ({required Object error}) => 'Failed to verify token: ${error}',
			'errors.failedToSwitchProfile' => ({required Object displayName}) => 'Failed to switch to ${displayName}',
			'errors.failedToDeleteProfile' => ({required Object displayName}) => 'Failed to delete ${displayName}',
			'errors.failedToRate' => 'Couldn\'t update rating',
			'libraries.title' => 'Libraries',
			'libraries.scanLibraryFiles' => 'Scan Library Files',
			'libraries.scanLibrary' => 'Scan Library',
			'libraries.analyze' => 'Analyze',
			'libraries.analyzeLibrary' => 'Analyze Library',
			'libraries.refreshMetadata' => 'Refresh Metadata',
			'libraries.emptyTrash' => 'Empty Trash',
			'libraries.emptyingTrash' => ({required Object title}) => 'Emptying trash for "${title}"...',
			'libraries.trashEmptied' => ({required Object title}) => 'Trash emptied for "${title}"',
			'libraries.failedToEmptyTrash' => ({required Object error}) => 'Failed to empty trash: ${error}',
			'libraries.analyzing' => ({required Object title}) => 'Analyzing "${title}"...',
			'libraries.analysisStarted' => ({required Object title}) => 'Analysis started for "${title}"',
			'libraries.failedToAnalyze' => ({required Object error}) => 'Failed to analyze library: ${error}',
			'libraries.noLibrariesFound' => 'No libraries found',
			'libraries.allLibrariesHidden' => 'All libraries are hidden',
			'libraries.hiddenLibrariesCount' => ({required Object count}) => 'Hidden libraries (${count})',
			'libraries.thisLibraryIsEmpty' => 'This library is empty',
			'libraries.all' => 'All',
			'libraries.clearAll' => 'Clear All',
			'libraries.scanLibraryConfirm' => ({required Object title}) => 'Are you sure you want to scan "${title}"?',
			'libraries.analyzeLibraryConfirm' => ({required Object title}) => 'Are you sure you want to analyze "${title}"?',
			'libraries.refreshMetadataConfirm' => ({required Object title}) => 'Are you sure you want to refresh metadata for "${title}"?',
			'libraries.emptyTrashConfirm' => ({required Object title}) => 'Are you sure you want to empty trash for "${title}"?',
			'libraries.manageLibraries' => 'Manage Libraries',
			'libraries.sort' => 'Sort',
			'libraries.sortBy' => 'Sort By',
			'libraries.filters' => 'Filters',
			'libraries.confirmActionMessage' => 'Are you sure you want to perform this action?',
			'libraries.showLibrary' => 'Show library',
			'libraries.hideLibrary' => 'Hide library',
			'libraries.libraryOptions' => 'Library options',
			'libraries.content' => 'library content',
			'libraries.selectLibrary' => 'Select library',
			'libraries.filtersWithCount' => ({required Object count}) => 'Filters (${count})',
			'libraries.noRecommendations' => 'No recommendations available',
			'libraries.noCollections' => 'No collections in this library',
			'libraries.noFoldersFound' => 'No folders found',
			'libraries.folders' => 'folders',
			'libraries.tabs.recommended' => 'Recommended',
			'libraries.tabs.browse' => 'Browse',
			'libraries.tabs.collections' => 'Collections',
			'libraries.tabs.genres' => 'Genres',
			'libraries.tabs.playlists' => 'Playlists',
			'libraries.groupings.title' => 'Grouping',
			'libraries.groupings.all' => 'All',
			'libraries.groupings.movies' => 'Movies',
			'libraries.groupings.shows' => 'TV Shows',
			'libraries.groupings.seasons' => 'Seasons',
			'libraries.groupings.episodes' => 'Episodes',
			'libraries.groupings.folders' => 'Folders',
			'libraries.filterCategories.genre' => 'Genre',
			'libraries.filterCategories.year' => 'Year',
			'libraries.filterCategories.contentRating' => 'Content Rating',
			'libraries.filterCategories.tag' => 'Tag',
			'libraries.filterCategories.unwatched' => 'Unwatched',
			'libraries.filterCategories.unwatchedOnly' => 'Unwatched only',
			'libraries.filterCategories.unwatchedShows' => 'Unwatched Shows',
			'libraries.filterCategories.unwatchedEpisodes' => 'Unwatched Episodes',
			'libraries.filterCategories.unplayed' => 'Unplayed',
			'libraries.filterCategories.show_unwatched' => 'Unwatched Shows',
			'libraries.filterCategories.episode_unwatched' => 'Unwatched Episodes',
			'libraries.filterCategories.show_unplayed' => 'Unwatched Shows',
			'libraries.filterCategories.episode_unplayed' => 'Unwatched Episodes',
			'libraries.filterCategories.shows_unwatched' => 'Unwatched Shows',
			'libraries.filterCategories.episodes_unwatched' => 'Unwatched Episodes',
			'libraries.filterCategories.inProgress' => 'In Progress',
			'libraries.filterCategories.audioLanguage' => 'Audio Language',
			'libraries.filterCategories.subtitleLanguage' => 'Subtitle Language',
			'libraries.filterCategories.decade' => 'Decade',
			'libraries.filterCategories.actor' => 'Actor',
			'libraries.filterCategories.director' => 'Director',
			'libraries.filterCategories.writer' => 'Writer',
			'libraries.filterCategories.producer' => 'Producer',
			'libraries.filterCategories.country' => 'Country',
			'libraries.filterCategories.network' => 'Network',
			'libraries.sortLabels.title' => 'Title',
			'libraries.sortLabels.dateAdded' => 'Date Added',
			'libraries.sortLabels.releaseDate' => 'Release Date',
			'libraries.sortLabels.rating' => 'Rating',
			'libraries.sortLabels.lastPlayed' => 'Last Played',
			'libraries.sortLabels.playCount' => 'Play Count',
			'libraries.sortLabels.random' => 'Random',
			'libraries.sortLabels.dateShared' => 'Date Shared',
			'libraries.sortLabels.latestEpisodeAirDate' => 'Latest Episode Air Date',
			'libraries.sortLabels.latestEpisodeAddedDate' => 'Last Episode Date Added',
			'about.title' => 'About',
			'about.openSourceLicenses' => 'Open Source Licenses',
			'about.versionLabel' => ({required Object version}) => 'Version ${version}',
			'about.appDescription' => 'A beautiful Plex and Jellyfin client for Flutter',
			'about.viewLicensesDescription' => 'View licenses of third-party libraries',
			'serverSelection.allServerConnectionsFailed' => 'Failed to connect to any servers. Please check your network and try again.',
			'serverSelection.noServersFoundForAccount' => ({required Object username, required Object email}) => 'No servers found for ${username} (${email})',
			'serverSelection.failedToLoadServers' => ({required Object error}) => 'Failed to load servers: ${error}',
			'serverSelection.selectServer' => 'Select Server',
			'serverSelection.selectServerDescription' => 'Choose which server you\'d like to use',
			'serverSelection.noServersAvailable' => 'No servers available',
			'serverSelection.online' => 'Online',
			'serverSelection.offline' => 'Offline',
			'hubDetail.title' => 'Title',
			'hubDetail.releaseYear' => 'Release Year',
			'hubDetail.dateAdded' => 'Date Added',
			'hubDetail.rating' => 'Rating',
			'hubDetail.noItemsFound' => 'No items found',
			'logs.clearLogs' => 'Clear Logs',
			'logs.copyLogs' => 'Copy Logs',
			'logs.uploadLogs' => 'Upload Logs',
			'licenses.relatedPackages' => 'Related Packages',
			'licenses.license' => 'License',
			'licenses.licenseNumber' => ({required Object number}) => 'License ${number}',
			'licenses.licensesCount' => ({required Object count}) => '${count} licenses',
			'navigation.movies' => 'Movies',
			'navigation.shows' => 'TV Shows',
			'navigation.liveTv' => 'Live TV',
			'liveTv.title' => 'Live TV',
			'liveTv.guide' => 'Guide',
			'liveTv.noChannels' => 'No channels available',
			'liveTv.noDvr' => 'No DVR configured on any server',
			'liveTv.noPrograms' => 'No program data available',
			'liveTv.live' => 'LIVE',
			'liveTv.reloadGuide' => 'Reload Guide',
			'liveTv.now' => 'Now',
			'liveTv.today' => 'Today',
			'liveTv.tomorrow' => 'Tomorrow',
			'liveTv.midnight' => 'Midnight',
			'liveTv.overnight' => 'Overnight',
			'liveTv.morning' => 'Morning',
			'liveTv.daytime' => 'Daytime',
			'liveTv.evening' => 'Evening',
			'liveTv.lateNight' => 'Late Night',
			'liveTv.whatsOn' => 'What\'s On',
			'liveTv.watchChannel' => 'Watch Channel',
			'liveTv.favorites' => 'Favorites',
			'liveTv.reorderFavorites' => 'Reorder Favorites',
			'liveTv.joinSession' => 'Join Session in Progress',
			'liveTv.watchFromStart' => ({required Object minutes}) => 'Watch from start (${minutes} min ago)',
			'liveTv.watchLive' => 'Watch Live',
			'liveTv.goToLive' => 'Go to Live',
			'liveTv.record' => 'Record',
			'liveTv.recordEpisode' => 'Record Episode',
			'liveTv.recordSeries' => 'Record Series',
			'liveTv.recordOptions' => 'Record Options',
			'liveTv.recordings' => 'Recordings',
			'liveTv.scheduledRecordings' => 'Scheduled',
			'liveTv.recordingRules' => 'Recording Rules',
			'liveTv.noScheduledRecordings' => 'Nothing scheduled to record',
			'liveTv.noRecordingRules' => 'No recording rules yet',
			'liveTv.manageRecording' => 'Manage recording',
			'liveTv.cancelRecording' => 'Cancel recording',
			'liveTv.cancelRecordingTitle' => 'Cancel this recording?',
			'liveTv.cancelRecordingMessage' => ({required Object title}) => '${title} will no longer be recorded.',
			'liveTv.deleteRule' => 'Delete rule',
			'liveTv.deleteRuleTitle' => 'Delete recording rule?',
			'liveTv.deleteRuleMessage' => ({required Object title}) => 'Future episodes of ${title} will not be recorded.',
			'liveTv.recordingScheduled' => 'Recording scheduled',
			'liveTv.alreadyScheduled' => 'This program is already scheduled',
			'liveTv.dvrAdminRequired' => 'DVR settings require an admin account',
			'liveTv.recordingFailed' => 'Couldn\'t schedule recording',
			'liveTv.recordingTargetMissing' => 'Couldn\'t determine recording library',
			'liveTv.recordNotAvailable' => 'Recording not available for this program',
			'liveTv.recordingCancelled' => 'Recording cancelled',
			'liveTv.recordingRuleDeleted' => 'Recording rule deleted',
			'liveTv.processRecordingRules' => 'Re-evaluate rules',
			'liveTv.loadingRecordings' => 'Loading recordings...',
			'liveTv.recordingInProgress' => 'Recording now',
			'liveTv.recordingsCount' => ({required Object count}) => '${count} scheduled',
			'liveTv.editRule' => 'Edit rule',
			'liveTv.editRuleAction' => 'Edit',
			'liveTv.recordingRuleUpdated' => 'Recording rule updated',
			'liveTv.guideReloadRequested' => 'Guide refresh requested',
			'liveTv.rulesProcessRequested' => 'Rule re-evaluation requested',
			'liveTv.recordShow' => 'Record show',
			'genres.title' => 'Genres',
			'genres.empty' => 'No genres found',
			'genres.names.18+' => '18+',
			'genres.names.90s' => '90s',
			'genres.names.Action' => 'Action',
			'genres.names.Adventure' => 'Adventure',
			'genres.names.Animation' => 'Animation',
			'genres.names.Anime' => 'Anime',
			'genres.names.Comedy' => 'Comedy',
			'genres.names.Crime' => 'Crime',
			'genres.names.Documentary' => 'Documentary',
			'genres.names.Drama' => 'Drama',
			'genres.names.Dub' => 'Dub',
			'genres.names.Family' => 'Family',
			'genres.names.Fantasy' => 'Fantasy',
			'genres.names.History' => 'History',
			'genres.names.Horror' => 'Horror',
			'genres.names.Kids' => 'Kids',
			'genres.names.Martial Arts' => 'Martial Arts',
			'genres.names.Music' => 'Music',
			'genres.names.Musical' => 'Musical',
			'genres.names.Mystery' => 'Mystery',
			'genres.names.Reality TV' => 'Reality TV',
			'genres.names.Romance' => 'Romance',
			'genres.names.Science Fiction' => 'Science Fiction',
			'genres.names.Short' => 'Short',
			'genres.names.Sport' => 'Sport',
			'genres.names.Talk Show' => 'Talk Show',
			'genres.names.Thriller' => 'Thriller',
			'genres.names.Travel' => 'Travel',
			'genres.names.Vie' => 'Vie',
			'genres.names.War' => 'War',
			'genres.names.Western' => 'Western',
			'collections.title' => 'Collections',
			'collections.collection' => 'Collection',
			'collections.empty' => 'Collection is empty',
			'collections.unknownLibrarySection' => 'Cannot delete: Unknown library section',
			'collections.deleteCollection' => 'Delete Collection',
			'collections.deleteConfirm' => ({required Object title}) => 'Are you sure you want to delete "${title}"? This action cannot be undone.',
			'collections.deleted' => 'Collection deleted',
			'collections.deleteFailed' => 'Failed to delete collection',
			'collections.deleteFailedWithError' => ({required Object error}) => 'Failed to delete collection: ${error}',
			'collections.failedToLoadItems' => ({required Object error}) => 'Failed to load collection items: ${error}',
			'collections.selectCollection' => 'Select Collection',
			'collections.collectionName' => 'Collection Name',
			'collections.enterCollectionName' => 'Enter collection name',
			'collections.addedToCollection' => 'Added to collection',
			'collections.errorAddingToCollection' => 'Failed to add to collection',
			'collections.created' => 'Collection created',
			'collections.removeFromCollection' => 'Remove from collection',
			'collections.removeFromCollectionConfirm' => ({required Object title}) => 'Remove "${title}" from this collection?',
			'collections.removedFromCollection' => 'Removed from collection',
			'collections.removeFromCollectionFailed' => 'Failed to remove from collection',
			'collections.removeFromCollectionError' => ({required Object error}) => 'Error removing from collection: ${error}',
			'collections.searchCollections' => 'Search collections...',
			'playlists.title' => 'Playlists',
			'playlists.playlist' => 'Playlist',
			'playlists.noPlaylists' => 'No playlists found',
			'playlists.create' => 'Create Playlist',
			'playlists.playlistName' => 'Playlist Name',
			'playlists.enterPlaylistName' => 'Enter playlist name',
			'playlists.delete' => 'Delete Playlist',
			'playlists.removeItem' => 'Remove from Playlist',
			'playlists.smartPlaylist' => 'Smart Playlist',
			'playlists.itemCount' => ({required Object count}) => '${count} items',
			'playlists.oneItem' => '1 item',
			'playlists.emptyPlaylist' => 'This playlist is empty',
			'playlists.deleteConfirm' => 'Delete Playlist?',
			'playlists.deleteMessage' => ({required Object name}) => 'Are you sure you want to delete "${name}"?',
			'playlists.created' => 'Playlist created',
			'playlists.deleted' => 'Playlist deleted',
			'playlists.itemAdded' => 'Added to playlist',
			'playlists.itemRemoved' => 'Removed from playlist',
			'playlists.selectPlaylist' => 'Select Playlist',
			'playlists.errorCreating' => 'Failed to create playlist',
			'playlists.errorDeleting' => 'Failed to delete playlist',
			'playlists.errorLoading' => 'Failed to load playlists',
			'playlists.errorAdding' => 'Failed to add to playlist',
			'playlists.errorReordering' => 'Failed to reorder playlist item',
			'playlists.errorRemoving' => 'Failed to remove from playlist',
			'downloads.title' => 'Downloads',
			'downloads.manage' => 'Manage',
			'downloads.tvShows' => 'TV Shows',
			'downloads.movies' => 'Movies',
			'downloads.noDownloads' => 'No downloads yet',
			'downloads.noDownloadsDescription' => 'Downloaded content will appear here for offline viewing',
			'downloads.downloadNow' => 'Download',
			'downloads.deleteDownload' => 'Delete download',
			'downloads.retryDownload' => 'Retry download',
			'downloads.downloadQueued' => 'Download queued',
			'downloads.serverErrorBitrate' => 'Server error — the file may exceed the remote streaming bitrate limit',
			'downloads.episodesQueued' => ({required Object count}) => '${count} episodes queued for download',
			'downloads.downloadDeleted' => 'Download deleted',
			'downloads.deleteConfirm' => ({required Object title}) => 'Are you sure you want to delete "${title}"? This will remove the downloaded file from your device.',
			'downloads.deleting' => 'Deleting...',
			'downloads.deletingWithProgress' => ({required Object title, required Object current, required Object total}) => 'Deleting ${title}... (${current} of ${total})',
			'downloads.queuedTooltip' => 'Queued',
			'downloads.queuedFilesTooltip' => ({required Object files}) => 'Queued ${files}',
			'downloads.downloadingTooltip' => 'Downloading...',
			'downloads.downloadingFilesTooltip' => ({required Object files}) => 'Downloading ${files}',
			'downloads.noDownloadsTree' => 'No downloads',
			'downloads.pauseAll' => 'Pause all',
			'downloads.resumeAll' => 'Resume all',
			'downloads.deleteAll' => 'Delete all',
			'downloads.selectVersion' => 'Select Version',
			'downloads.allEpisodes' => 'All episodes',
			'downloads.unwatchedOnly' => 'Unwatched only',
			'downloads.nextNUnwatched' => ({required Object count}) => 'Next ${count} unwatched',
			'downloads.customAmount' => 'Custom amount...',
			'downloads.howManyEpisodes' => 'How many episodes?',
			'downloads.itemsQueued' => ({required Object count}) => '${count} items queued for download',
			'downloads.keepSynced' => 'Keep synced',
			'downloads.downloadOnce' => 'Download once',
			'downloads.keepNUnwatched' => ({required Object count}) => 'Keep ${count} unwatched',
			'downloads.editSyncRule' => 'Edit sync rule',
			'downloads.removeSyncRule' => 'Remove sync rule',
			'downloads.removeSyncRuleConfirm' => ({required Object title}) => 'Stop syncing "${title}"? Downloaded episodes will be kept.',
			'downloads.syncRuleCreated' => ({required Object count}) => 'Sync rule created — keeping ${count} unwatched episodes',
			'downloads.syncRuleUpdated' => 'Sync rule updated',
			'downloads.syncRuleRemoved' => 'Sync rule removed',
			'downloads.syncedNewEpisodes' => ({required Object count, required Object title}) => 'Synced ${count} new episodes for ${title}',
			'downloads.activeSyncRules' => 'Sync rules',
			'downloads.noSyncRules' => 'No sync rules',
			'downloads.manageSyncRule' => 'Manage sync',
			'downloads.editEpisodeCount' => 'Episode count',
			'downloads.editSyncFilter' => 'Sync filter',
			'downloads.syncAllItems' => 'Syncing all items',
			'downloads.syncUnwatchedItems' => 'Syncing unwatched items',
			'downloads.syncRuleServerContext' => ({required Object server, required Object status}) => 'Server: ${server} • ${status}',
			'downloads.syncRuleAvailable' => 'Available',
			'downloads.syncRuleOffline' => 'Offline',
			'downloads.syncRuleSignInRequired' => 'Sign in required',
			'downloads.syncRuleNotAvailableForProfile' => 'Not available for current profile',
			'downloads.syncRuleUnknownServer' => 'Unknown server',
			'downloads.syncRuleListCreated' => 'Sync rule created',
			'shaders.title' => 'Shaders',
			'shaders.noShaderDescription' => 'No video enhancement',
			'shaders.nvscalerDescription' => 'NVIDIA image scaling for sharper video',
			'shaders.artcnnVariantNeutral' => 'Neutral',
			'shaders.artcnnVariantDenoise' => 'Denoise',
			'shaders.artcnnVariantDenoiseSharpen' => 'Denoise + Sharpen',
			'shaders.qualityFast' => 'Fast',
			'shaders.qualityHQ' => 'High Quality',
			'shaders.mode' => 'Mode',
			'shaders.importShader' => 'Import Shader',
			'shaders.customShaderDescription' => 'Custom GLSL shader',
			'shaders.shaderImported' => 'Shader imported',
			'shaders.shaderImportFailed' => 'Failed to import shader',
			'shaders.deleteShader' => 'Delete Shader',
			'shaders.deleteShaderConfirm' => ({required Object name}) => 'Delete "${name}"?',
			'companionRemote.title' => 'Companion Remote',
			'companionRemote.connectedTo' => ({required Object name}) => 'Connected to ${name}',
			'companionRemote.session.startingServer' => 'Starting remote server...',
			'companionRemote.session.failedToCreate' => 'Failed to start remote server:',
			'companionRemote.session.hostAddress' => 'Host Address',
			'companionRemote.session.connected' => 'Connected',
			'companionRemote.session.serverRunning' => 'Remote server active',
			'companionRemote.session.serverStopped' => 'Remote server stopped',
			'companionRemote.session.serverRunningDescription' => 'Mobile devices on your network can discover and connect to this app',
			'companionRemote.session.serverStoppedDescription' => 'Start the server to allow mobile devices to connect',
			'companionRemote.session.usePhoneToControl' => 'Use your mobile device to control this app',
			'companionRemote.session.startServer' => 'Start Server',
			'companionRemote.session.stopServer' => 'Stop Server',
			'companionRemote.session.minimize' => 'Minimize',
			'companionRemote.pairing.discoveryDescription' => 'Devices on your network running Lumi with the same Plex account will appear automatically',
			'companionRemote.pairing.hostAddressHint' => '192.168.1.100:48632',
			'companionRemote.pairing.connecting' => 'Connecting...',
			'companionRemote.pairing.searchingForDevices' => 'Looking for devices...',
			'companionRemote.pairing.noDevicesFound' => 'No devices found on your network',
			'companionRemote.pairing.noDevicesHint' => 'Make sure Lumi is open on your desktop and both devices are on the same WiFi network',
			'companionRemote.pairing.availableDevices' => 'Available Devices',
			'companionRemote.pairing.manualConnection' => 'Manual Connection',
			'companionRemote.pairing.cryptoInitFailed' => 'Could not initialize secure connection. Make sure you are signed in to a Plex account.',
			'companionRemote.pairing.validationHostRequired' => 'Please enter host address',
			'companionRemote.pairing.validationHostFormat' => 'Format must be IP:port (e.g., 192.168.1.100:48632)',
			'companionRemote.pairing.connectionTimedOut' => 'Connection timed out. Make sure both devices are on the same network.',
			'companionRemote.pairing.sessionNotFound' => 'Could not find the device. Make sure Lumi is running on the host.',
			'companionRemote.pairing.authFailed' => 'Authentication failed. Make sure both devices are on the same Plex account.',
			'companionRemote.pairing.failedToConnect' => ({required Object error}) => 'Failed to connect: ${error}',
			'companionRemote.remote.disconnectConfirm' => 'Do you want to disconnect from the remote session?',
			'companionRemote.remote.reconnecting' => 'Reconnecting...',
			'companionRemote.remote.attemptOf' => ({required Object current}) => 'Attempt ${current} of 5',
			'companionRemote.remote.retryNow' => 'Retry Now',
			'companionRemote.remote.tabRemote' => 'Remote',
			'companionRemote.remote.tabPlay' => 'Play',
			'companionRemote.remote.tabMore' => 'More',
			'companionRemote.remote.menu' => 'Menu',
			'companionRemote.remote.tabNavigation' => 'Tab Navigation',
			'companionRemote.remote.tabDiscover' => 'Discover',
			'companionRemote.remote.tabLibraries' => 'Libraries',
			'companionRemote.remote.tabSearch' => 'Search',
			'companionRemote.remote.tabDownloads' => 'Downloads',
			'companionRemote.remote.tabSettings' => 'Settings',
			'companionRemote.remote.previous' => 'Previous',
			'companionRemote.remote.playPause' => 'Play/Pause',
			'companionRemote.remote.next' => 'Next',
			'companionRemote.remote.seekBack' => 'Seek Back',
			'companionRemote.remote.stop' => 'Stop',
			'companionRemote.remote.seekForward' => 'Seek Fwd',
			'companionRemote.remote.volume' => 'Volume',
			'companionRemote.remote.volumeDown' => 'Down',
			'companionRemote.remote.volumeUp' => 'Up',
			'companionRemote.remote.fullscreen' => 'Fullscreen',
			'companionRemote.remote.subtitles' => 'Subtitles',
			'companionRemote.remote.audio' => 'Audio',
			'companionRemote.remote.searchHint' => 'Search on desktop...',
			'videoSettings.playbackSettings' => 'Playback Settings',
			'videoSettings.playbackSpeed' => 'Playback Speed',
			'videoSettings.zoom' => 'Zoom',
			'videoSettings.sleepTimer' => 'Sleep Timer',
			'videoSettings.audioSync' => 'Audio Sync',
			'videoSettings.subtitleSync' => 'Subtitle Sync',
			'videoSettings.hdr' => 'HDR',
			'videoSettings.audioOutput' => 'Audio Output',
			'videoSettings.performanceOverlay' => 'Performance Overlay',
			'videoSettings.audioPassthrough' => 'Audio Passthrough',
			'videoSettings.audioNormalization' => 'Normalize Loudness',
			'videoSettings.off' => 'Off',
			'videoSettings.active' => ({required Object time}) => 'Active (${time})',
			'videoSettings.normalSpeed' => 'Normal',
			'externalPlayer.title' => 'External Player',
			'externalPlayer.useExternalPlayer' => 'Use External Player',
			'externalPlayer.useExternalPlayerDescription' => 'Open videos in an external app instead of the built-in player',
			'externalPlayer.selectPlayer' => 'Select Player',
			'externalPlayer.customPlayers' => 'Custom Players',
			'externalPlayer.systemDefault' => 'System Default',
			'externalPlayer.addCustomPlayer' => 'Add Custom Player',
			'externalPlayer.playerName' => 'Player Name',
			'externalPlayer.playerCommand' => 'Command',
			'externalPlayer.playerPackage' => 'Package Name',
			'externalPlayer.playerUrlScheme' => 'URL Scheme',
			'externalPlayer.off' => 'Off',
			'externalPlayer.launchFailed' => 'Failed to open external player',
			'externalPlayer.appNotInstalled' => ({required Object name}) => '${name} is not installed',
			'externalPlayer.playInExternalPlayer' => 'Play in External Player',
			'metadataEdit.editMetadata' => 'Edit...',
			'metadataEdit.screenTitle' => 'Edit Metadata',
			'metadataEdit.basicInfo' => 'Basic Info',
			'metadataEdit.artwork' => 'Artwork',
			'metadataEdit.advancedSettings' => 'Advanced Settings',
			'metadataEdit.title' => 'Title',
			'metadataEdit.sortTitle' => 'Sort Title',
			'metadataEdit.originalTitle' => 'Original Title',
			'metadataEdit.releaseDate' => 'Release Date',
			'metadataEdit.contentRating' => 'Content Rating',
			'metadataEdit.studio' => 'Studio',
			'metadataEdit.tagline' => 'Tagline',
			'metadataEdit.summary' => 'Summary',
			'metadataEdit.poster' => 'Poster',
			'metadataEdit.background' => 'Background',
			'metadataEdit.logo' => 'Logo',
			'metadataEdit.squareArt' => 'Square Art',
			'metadataEdit.selectPoster' => 'Select Poster',
			'metadataEdit.selectBackground' => 'Select Background',
			'metadataEdit.selectLogo' => 'Select Logo',
			'metadataEdit.selectSquareArt' => 'Select Square Art',
			'metadataEdit.fromUrl' => 'From URL',
			'metadataEdit.uploadFile' => 'Upload File',
			'metadataEdit.enterImageUrl' => 'Enter image URL',
			'metadataEdit.imageUrl' => 'Image URL',
			'metadataEdit.metadataUpdated' => 'Metadata updated',
			'metadataEdit.metadataUpdateFailed' => 'Failed to update metadata',
			'metadataEdit.artworkUpdated' => 'Artwork updated',
			'metadataEdit.artworkUpdateFailed' => 'Failed to update artwork',
			'metadataEdit.noArtworkAvailable' => 'No artwork available',
			'metadataEdit.notSet' => 'Not set',
			'metadataEdit.libraryDefault' => 'Library default',
			'metadataEdit.accountDefault' => 'Account default',
			'metadataEdit.seriesDefault' => 'Series default',
			'metadataEdit.episodeSorting' => 'Episode Sorting',
			'metadataEdit.oldestFirst' => 'Oldest first',
			'metadataEdit.newestFirst' => 'Newest first',
			'metadataEdit.keep' => 'Keep',
			'metadataEdit.allEpisodes' => 'All episodes',
			'metadataEdit.latestEpisodes' => ({required Object count}) => '${count} latest episodes',
			'metadataEdit.latestEpisode' => 'Latest episode',
			'metadataEdit.episodesAddedPastDays' => ({required Object count}) => 'Episodes added in the past ${count} days',
			'metadataEdit.deleteAfterPlaying' => 'Delete Episodes After Playing',
			'metadataEdit.never' => 'Never',
			'metadataEdit.afterADay' => 'After a day',
			'metadataEdit.afterAWeek' => 'After a week',
			_ => null,
		} ?? switch (path) {
			'metadataEdit.afterAMonth' => 'After a month',
			'metadataEdit.onNextRefresh' => 'On next refresh',
			'metadataEdit.seasons' => 'Seasons',
			'metadataEdit.show' => 'Show',
			'metadataEdit.hide' => 'Hide',
			'metadataEdit.episodeOrdering' => 'Episode Ordering',
			'metadataEdit.tmdbAiring' => 'The Movie Database (Aired)',
			'metadataEdit.tvdbAiring' => 'TheTVDB (Aired)',
			'metadataEdit.tvdbAbsolute' => 'TheTVDB (Absolute)',
			'metadataEdit.metadataLanguage' => 'Metadata Language',
			'metadataEdit.useOriginalTitle' => 'Use Original Title',
			'metadataEdit.preferredAudioLanguage' => 'Preferred Audio Language',
			'metadataEdit.preferredSubtitleLanguage' => 'Preferred Subtitle Language',
			'metadataEdit.subtitleMode' => 'Auto-Select Subtitle Mode',
			'metadataEdit.manuallySelected' => 'Manually selected',
			'metadataEdit.shownWithForeignAudio' => 'Shown with foreign audio',
			'metadataEdit.alwaysEnabled' => 'Always enabled',
			'metadataEdit.tags' => 'Tags',
			'metadataEdit.addTag' => 'Add tag',
			'metadataEdit.genre' => 'Genre',
			'metadataEdit.director' => 'Director',
			'metadataEdit.writer' => 'Writer',
			'metadataEdit.producer' => 'Producer',
			'metadataEdit.country' => 'Country',
			'metadataEdit.collection' => 'Collection',
			'metadataEdit.label' => 'Label',
			'metadataEdit.style' => 'Style',
			'metadataEdit.mood' => 'Mood',
			'matchScreen.match' => 'Match...',
			'matchScreen.fixMatch' => 'Fix Match...',
			'matchScreen.unmatch' => 'Unmatch',
			'matchScreen.unmatchConfirm' => 'Clear the current match for this item? Plex will treat it as unmatched until you match it again.',
			'matchScreen.unmatchSuccess' => 'Item unmatched',
			'matchScreen.unmatchFailed' => 'Failed to unmatch item',
			'matchScreen.matchApplied' => 'Match applied',
			'matchScreen.matchFailed' => 'Failed to apply match',
			'matchScreen.titleHint' => 'Title',
			'matchScreen.yearHint' => 'Year',
			'matchScreen.search' => 'Search',
			'matchScreen.noMatchesFound' => 'No matches found',
			'serverTasks.title' => 'Server Tasks',
			'serverTasks.failedToLoad' => 'Failed to load tasks',
			'serverTasks.noTasks' => 'No tasks running',
			'addServer.addJellyfinTitle' => 'Add Jellyfin server',
			'addServer.jellyfinUrlIntro' => 'Enter your Jellyfin server URL — e.g. `https://jellyfin.example.com`. You can sign in afterwards.',
			'addServer.serverUrl' => 'Server URL',
			'addServer.findServer' => 'Find server',
			'addServer.username' => 'Username',
			'addServer.password' => 'Password',
			'addServer.signIn' => 'Sign in',
			'addServer.change' => 'Change',
			'addServer.required' => 'Required',
			'addServer.couldNotReachServer' => ({required Object error}) => 'Could not reach the server: ${error}',
			'addServer.signInFailed' => ({required Object error}) => 'Sign-in failed: ${error}',
			'addServer.quickConnectFailed' => ({required Object error}) => 'Quick Connect failed: ${error}',
			'addServer.addPlexTitle' => 'Sign in with Plex',
			'addServer.plexAuthIntro' => 'Choose how to sign in to Plex. The browser flow opens plex.tv where you confirm the connection; the QR option is handy for TV / remote devices.',
			'addServer.plexQRPrompt' => 'Scan this QR code to sign in.',
			'addServer.waitingForPlexConfirmation' => 'Waiting for plex.tv to confirm your sign-in…',
			'addServer.pinExpired' => 'PIN expired before sign-in. Please try again.',
			'addServer.duplicatePlexAccount' => 'This device is already signed in to a Plex account. Sign out from settings to switch accounts.',
			'addServer.failedToRegisterAccount' => ({required Object error}) => 'Failed to register account: ${error}',
			'addServer.enterJellyfinUrlError' => 'Enter your Jellyfin server URL',
			'addServer.addConnectionTitle' => 'Add connection',
			'addServer.addConnectionTitleScoped' => ({required Object name}) => 'Add to ${name}',
			'addServer.addConnectionIntroGlobal' => 'Add another media server. You can mix Plex accounts and Jellyfin servers — items from every connected backend appear together on the home screen.',
			'addServer.addConnectionIntroScoped' => 'Add a new server, or borrow one from another profile.',
			'addServer.signInWithPlexCard' => 'Sign in with Plex',
			'addServer.signInWithPlexCardSubtitle' => 'Authorize this device against your Plex account. Servers shared with the account come along automatically.',
			'addServer.signInWithPlexCardSubtitleScoped' => 'Authorize a new Plex account. Its Home users appear as profiles.',
			'addServer.connectToJellyfinCard' => 'Connect to Jellyfin',
			'addServer.connectToJellyfinCardSubtitle' => 'Enter your Jellyfin server URL and sign in with username + password (Quick Connect coming soon).',
			'addServer.connectToJellyfinCardSubtitleScoped' => ({required Object name}) => 'Sign in to a Jellyfin server. Binds to ${name}.',
			'addServer.borrowFromAnotherProfile' => 'Borrow from another profile',
			'addServer.borrowFromAnotherProfileSubtitle' => 'Reuse a connection that\'s already attached to a different profile. PIN-protected source profiles ask for the PIN.',
			'languages.aa' => 'Afar',
			'languages.ab' => 'Abkhaz',
			'languages.ae' => 'Avestan',
			'languages.af' => 'Afrikaans',
			'languages.ak' => 'Akan',
			'languages.am' => 'Amharic',
			'languages.an' => 'Aragonese',
			'languages.ar' => 'Arabic',
			'languages.as' => 'Assamese',
			'languages.av' => 'Avaric',
			'languages.ay' => 'Aymara',
			'languages.az' => 'Azerbaijani',
			'languages.ba' => 'Bashkir',
			'languages.be' => 'Belarusian',
			'languages.bg' => 'Bulgarian',
			'languages.bh' => 'Bihari',
			'languages.bi' => 'Bislama',
			'languages.bm' => 'Bambara',
			'languages.bn' => 'Bengali, Bangla',
			'languages.bo' => 'Tibetan Standard, Tibetan, Central',
			'languages.br' => 'Breton',
			'languages.bs' => 'Bosnian',
			'languages.ca' => 'Catalan',
			'languages.ce' => 'Chechen',
			'languages.ch' => 'Chamorro',
			'languages.co' => 'Corsican',
			'languages.cr' => 'Cree',
			'languages.cs' => 'Czech',
			'languages.cu' => 'Old Church Slavonic, Church Slavonic, Old Bulgarian',
			'languages.cv' => 'Chuvash',
			'languages.cy' => 'Welsh',
			'languages.da' => 'Danish',
			'languages.de' => 'German',
			'languages.dv' => 'Divehi, Dhivehi, Maldivian',
			'languages.dz' => 'Dzongkha',
			'languages.ee' => 'Ewe',
			'languages.el' => 'Greek (modern)',
			'languages.en' => 'English',
			'languages.eo' => 'Esperanto',
			'languages.es' => 'Spanish',
			'languages.et' => 'Estonian',
			'languages.eu' => 'Basque',
			'languages.fa' => 'Persian (Farsi)',
			'languages.ff' => 'Fula, Fulah, Pulaar, Pular',
			'languages.fi' => 'Finnish',
			'languages.fj' => 'Fijian',
			'languages.fo' => 'Faroese',
			'languages.fr' => 'French',
			'languages.fy' => 'Western Frisian',
			'languages.ga' => 'Irish',
			'languages.gd' => 'Scottish Gaelic, Gaelic',
			'languages.gl' => 'Galician',
			'languages.gn' => 'Guaraní',
			'languages.gu' => 'Gujarati',
			'languages.gv' => 'Manx',
			'languages.ha' => 'Hausa',
			'languages.he' => 'Hebrew (modern)',
			'languages.hi' => 'Hindi',
			'languages.ho' => 'Hiri Motu',
			'languages.hr' => 'Croatian',
			'languages.ht' => 'Haitian, Haitian Creole',
			'languages.hu' => 'Hungarian',
			'languages.hy' => 'Armenian',
			'languages.hz' => 'Herero',
			'languages.ia' => 'Interlingua',
			'languages.id' => 'Indonesian',
			'languages.ie' => 'Interlingue',
			'languages.ig' => 'Igbo',
			'languages.ii' => 'Nuosu',
			'languages.ik' => 'Inupiaq',
			'languages.io' => 'Ido',
			'languages.kIs' => 'Icelandic',
			'languages.it' => 'Italian',
			'languages.iu' => 'Inuktitut',
			'languages.ja' => 'Japanese',
			'languages.jv' => 'Javanese',
			'languages.ka' => 'Georgian',
			'languages.kg' => 'Kongo',
			'languages.ki' => 'Kikuyu, Gikuyu',
			'languages.kj' => 'Kwanyama, Kuanyama',
			'languages.kk' => 'Kazakh',
			'languages.kl' => 'Kalaallisut, Greenlandic',
			'languages.km' => 'Khmer',
			'languages.kn' => 'Kannada',
			'languages.ko' => 'Korean',
			'languages.kr' => 'Kanuri',
			'languages.ks' => 'Kashmiri',
			'languages.ku' => 'Kurdish',
			'languages.kv' => 'Komi',
			'languages.kw' => 'Cornish',
			'languages.ky' => 'Kyrgyz',
			'languages.la' => 'Latin',
			'languages.lb' => 'Luxembourgish, Letzeburgesch',
			'languages.lg' => 'Ganda',
			'languages.li' => 'Limburgish, Limburgan, Limburger',
			'languages.ln' => 'Lingala',
			'languages.lo' => 'Lao',
			'languages.lt' => 'Lithuanian',
			'languages.lu' => 'Luba-Katanga',
			'languages.lv' => 'Latvian',
			'languages.mg' => 'Malagasy',
			'languages.mh' => 'Marshallese',
			'languages.mi' => 'Māori',
			'languages.mk' => 'Macedonian',
			'languages.ml' => 'Malayalam',
			'languages.mn' => 'Mongolian',
			'languages.mr' => 'Marathi (Marāṭhī)',
			'languages.ms' => 'Malay',
			'languages.mt' => 'Maltese',
			'languages.my' => 'Burmese',
			'languages.na' => 'Nauruan',
			'languages.nb' => 'Norwegian Bokmål',
			'languages.nd' => 'Northern Ndebele',
			'languages.ne' => 'Nepali',
			'languages.ng' => 'Ndonga',
			'languages.nl' => 'Dutch',
			'languages.nn' => 'Norwegian Nynorsk',
			'languages.no' => 'Norwegian',
			'languages.nr' => 'Southern Ndebele',
			'languages.nv' => 'Navajo, Navaho',
			'languages.ny' => 'Chichewa, Chewa, Nyanja',
			'languages.oc' => 'Occitan',
			'languages.oj' => 'Ojibwe, Ojibwa',
			'languages.om' => 'Oromo',
			'languages.or' => 'Oriya',
			'languages.os' => 'Ossetian, Ossetic',
			'languages.pa' => '(Eastern) Punjabi',
			'languages.pi' => 'Pāli',
			'languages.pl' => 'Polish',
			'languages.ps' => 'Pashto, Pushto',
			'languages.pt' => 'Portuguese',
			'languages.qu' => 'Quechua',
			'languages.rm' => 'Romansh',
			'languages.rn' => 'Kirundi',
			'languages.ro' => 'Romanian',
			'languages.ru' => 'Russian',
			'languages.rw' => 'Kinyarwanda',
			'languages.sa' => 'Sanskrit (Saṁskṛta)',
			'languages.sc' => 'Sardinian',
			'languages.sd' => 'Sindhi',
			'languages.se' => 'Northern Sami',
			'languages.sg' => 'Sango',
			'languages.si' => 'Sinhalese, Sinhala',
			'languages.sk' => 'Slovak',
			'languages.sl' => 'Slovene',
			'languages.sm' => 'Samoan',
			'languages.sn' => 'Shona',
			'languages.so' => 'Somali',
			'languages.sq' => 'Albanian',
			'languages.sr' => 'Serbian',
			'languages.ss' => 'Swati',
			'languages.st' => 'Southern Sotho',
			'languages.su' => 'Sundanese',
			'languages.sv' => 'Swedish',
			'languages.sw' => 'Swahili',
			'languages.ta' => 'Tamil',
			'languages.te' => 'Telugu',
			'languages.tg' => 'Tajik',
			'languages.th' => 'Thai',
			'languages.ti' => 'Tigrinya',
			'languages.tk' => 'Turkmen',
			'languages.tl' => 'Tagalog',
			'languages.tn' => 'Tswana',
			'languages.to' => 'Tonga (Tonga Islands)',
			'languages.tr' => 'Turkish',
			'languages.ts' => 'Tsonga',
			'languages.tt' => 'Tatar',
			'languages.tw' => 'Twi',
			'languages.ty' => 'Tahitian',
			'languages.ug' => 'Uyghur',
			'languages.uk' => 'Ukrainian',
			'languages.ur' => 'Urdu',
			'languages.uz' => 'Uzbek',
			'languages.ve' => 'Venda',
			'languages.vi' => 'Vietnamese',
			'languages.vo' => 'Volapük',
			'languages.wa' => 'Walloon',
			'languages.wo' => 'Wolof',
			'languages.xh' => 'Xhosa',
			'languages.yi' => 'Yiddish',
			'languages.yo' => 'Yoruba',
			'languages.za' => 'Zhuang, Chuang',
			'languages.zh' => 'Chinese',
			'languages.zu' => 'Zulu',
			'languages.unknown' => 'Unknown',
			_ => null,
		};
	}
}
