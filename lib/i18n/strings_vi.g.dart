///
/// Generated file. Do not edit.
///
// coverage:ignore-file
// ignore_for_file: type=lint, unused_import
// dart format off

import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'package:slang/generated.dart';
import 'strings.g.dart';

// Path: <root>
class TranslationsVi extends Translations with BaseTranslations<AppLocale, Translations> {
	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	TranslationsVi({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver, TranslationMetadata<AppLocale, Translations>? meta})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = meta ?? TranslationMetadata(
		    locale: AppLocale.vi,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ),
		  super(cardinalResolver: cardinalResolver, ordinalResolver: ordinalResolver) {
		super.$meta.setFlatMapFunction($meta.getTranslation); // copy base translations to super.$meta
		$meta.setFlatMapFunction(_flatMapFunction);
	}

	/// Metadata for the translations of <vi>.
	@override final TranslationMetadata<AppLocale, Translations> $meta;

	/// Access flat map
	@override dynamic operator[](String key) => $meta.getTranslation(key) ?? super.$meta.getTranslation(key);

	late final TranslationsVi _root = this; // ignore: unused_field

	@override 
	TranslationsVi $copyWith({TranslationMetadata<AppLocale, Translations>? meta}) => TranslationsVi(meta: meta ?? this.$meta);

	// Translations
	@override late final _TranslationsAppVi app = _TranslationsAppVi._(_root);
	@override late final _TranslationsAuthVi auth = _TranslationsAuthVi._(_root);
	@override late final _TranslationsCommonVi common = _TranslationsCommonVi._(_root);
	@override late final _TranslationsScreensVi screens = _TranslationsScreensVi._(_root);
	@override late final _TranslationsUpdateVi update = _TranslationsUpdateVi._(_root);
	@override late final _TranslationsMediaDetailVi mediaDetail = _TranslationsMediaDetailVi._(_root);
	@override late final _TranslationsSettingsVi settings = _TranslationsSettingsVi._(_root);
	@override late final _TranslationsSearchVi search = _TranslationsSearchVi._(_root);
	@override late final _TranslationsHotkeysVi hotkeys = _TranslationsHotkeysVi._(_root);
	@override late final _TranslationsFileInfoVi fileInfo = _TranslationsFileInfoVi._(_root);
	@override late final _TranslationsMediaMenuVi mediaMenu = _TranslationsMediaMenuVi._(_root);
	@override late final _TranslationsAccessibilityVi accessibility = _TranslationsAccessibilityVi._(_root);
	@override late final _TranslationsTooltipsVi tooltips = _TranslationsTooltipsVi._(_root);
	@override late final _TranslationsVideoControlsVi videoControls = _TranslationsVideoControlsVi._(_root);
	@override late final _TranslationsUserStatusVi userStatus = _TranslationsUserStatusVi._(_root);
	@override late final _TranslationsMessagesVi messages = _TranslationsMessagesVi._(_root);
	@override late final _TranslationsSubtitlingStylingVi subtitlingStyling = _TranslationsSubtitlingStylingVi._(_root);
	@override late final _TranslationsMpvConfigVi mpvConfig = _TranslationsMpvConfigVi._(_root);
	@override late final _TranslationsDialogVi dialog = _TranslationsDialogVi._(_root);
	@override late final _TranslationsProfilesVi profiles = _TranslationsProfilesVi._(_root);
	@override late final _TranslationsConnectionsVi connections = _TranslationsConnectionsVi._(_root);
	@override late final _TranslationsDiscoverVi discover = _TranslationsDiscoverVi._(_root);
	@override late final _TranslationsErrorsVi errors = _TranslationsErrorsVi._(_root);
	@override late final _TranslationsLibrariesVi libraries = _TranslationsLibrariesVi._(_root);
	@override late final _TranslationsAboutVi about = _TranslationsAboutVi._(_root);
	@override late final _TranslationsServerSelectionVi serverSelection = _TranslationsServerSelectionVi._(_root);
	@override late final _TranslationsHubDetailVi hubDetail = _TranslationsHubDetailVi._(_root);
	@override late final _TranslationsLogsVi logs = _TranslationsLogsVi._(_root);
	@override late final _TranslationsLicensesVi licenses = _TranslationsLicensesVi._(_root);
	@override late final _TranslationsNavigationVi navigation = _TranslationsNavigationVi._(_root);
	@override late final _TranslationsLiveTvVi liveTv = _TranslationsLiveTvVi._(_root);
	@override late final _TranslationsCollectionsVi collections = _TranslationsCollectionsVi._(_root);
	@override late final _TranslationsPlaylistsVi playlists = _TranslationsPlaylistsVi._(_root);
	@override late final _TranslationsWatchTogetherVi watchTogether = _TranslationsWatchTogetherVi._(_root);
	@override late final _TranslationsDownloadsVi downloads = _TranslationsDownloadsVi._(_root);
	@override late final _TranslationsShadersVi shaders = _TranslationsShadersVi._(_root);
	@override late final _TranslationsCompanionRemoteVi companionRemote = _TranslationsCompanionRemoteVi._(_root);
	@override late final _TranslationsVideoSettingsVi videoSettings = _TranslationsVideoSettingsVi._(_root);
	@override late final _TranslationsExternalPlayerVi externalPlayer = _TranslationsExternalPlayerVi._(_root);
	@override late final _TranslationsMetadataEditVi metadataEdit = _TranslationsMetadataEditVi._(_root);
	@override late final _TranslationsMatchScreenVi matchScreen = _TranslationsMatchScreenVi._(_root);
	@override late final _TranslationsServerTasksVi serverTasks = _TranslationsServerTasksVi._(_root);
	@override late final _TranslationsTraktVi trakt = _TranslationsTraktVi._(_root);
	@override late final _TranslationsTrackersVi trackers = _TranslationsTrackersVi._(_root);
	@override late final _TranslationsAddServerVi addServer = _TranslationsAddServerVi._(_root);
	@override late final _TranslationsLanguagesVi languages = _TranslationsLanguagesVi._(_root);
}

// Path: app
class _TranslationsAppVi extends TranslationsAppEn {
	_TranslationsAppVi._(TranslationsVi root) : this._root = root, super.internal(root);

	final TranslationsVi _root; // ignore: unused_field

	// Translations
	@override String get title => 'Lumi';
	@override String get tagline => 'App coi phim dỏm nhất Việt Nam';
}

// Path: auth
class _TranslationsAuthVi extends TranslationsAuthEn {
	_TranslationsAuthVi._(TranslationsVi root) : this._root = root, super.internal(root);

	final TranslationsVi _root; // ignore: unused_field

	// Translations
	@override String get signIn => 'Sign in';
	@override String get signInWithPlex => 'Đăng nhập tài khoản Plex';
	@override String get showQRCode => 'Quét mã QR';
	@override String get authenticate => 'Authenticate';
	@override String get authenticationTimeout => 'Phiên xác thực đã quá hạn. Hãy thử lại.';
	@override String get scanQRToSignIn => 'Quét mã QR này để đăng nhập';
	@override String get waitingForAuth => 'Đang xác thực...\nHãy thực hiện đăng nhập qua trang web.';
	@override String get useBrowser => 'Use browser';
	@override String get or => 'or';
	@override String get connectToJellyfin => 'Connect to Jellyfin';
	@override String get useQuickConnect => 'Use Quick Connect';
	@override String get quickConnectCode => 'Quick Connect code';
	@override String get quickConnectInstructions => 'Open your Jellyfin server in a web browser, sign in, and choose Quick Connect from the user menu. Enter this code to approve sign-in.';
	@override String get quickConnectWaiting => 'Waiting for approval…';
	@override String get quickConnectCancel => 'Hủy';
	@override String get quickConnectExpired => 'Quick Connect code expired before approval. Please try again.';
}

// Path: common
class _TranslationsCommonVi extends TranslationsCommonEn {
	_TranslationsCommonVi._(TranslationsVi root) : this._root = root, super.internal(root);

	final TranslationsVi _root; // ignore: unused_field

	// Translations
	@override String get cancel => 'Hủy';
	@override String get save => 'Save';
	@override String get ok => 'OK';
	@override String get close => 'Close';
	@override String get clear => 'Thiết lập lại';
	@override String get reset => 'Reset';
	@override String get later => 'Later';
	@override String get submit => 'Xác nhận';
	@override String get confirm => 'Confirm';
	@override String get retry => 'Thử lại';
	@override String get logout => 'Đăng xuất';
	@override String get unknown => 'Unknown';
	@override String get refresh => 'Refresh';
	@override String get yes => 'Yes';
	@override String get no => 'No';
	@override String get delete => 'Delete';
	@override String get shuffle => 'Shuffle';
	@override String get addTo => 'Add to...';
	@override String get createNew => 'Create new';
	@override String get connect => 'Connect';
	@override String get disconnect => 'Disconnect';
	@override String get play => 'Play';
	@override String get pause => 'Pause';
	@override String get resume => 'Resume';
	@override String get error => 'Error';
	@override String get search => 'Tìm kiếm';
	@override String get home => 'Trang chủ';
	@override String get back => 'Back';
	@override String get settings => 'Cài đặt';
	@override String get mute => 'Mute';
	@override String get reconnect => 'Reconnect';
	@override String get exit => 'Exit';
	@override String get viewAll => 'View All';
	@override String get checkingNetwork => 'Kiểm tra tín hiệu mạng...';
	@override String get refreshingServers => 'Refreshing servers...';
	@override String get loadingServers => 'Loading servers...';
	@override String get connectingToServers => 'Kiểm tra tín hiệu máy chủ...';
	@override String get startingOfflineMode => 'Starting offline mode...';
	@override String get loading => 'Loading...';
	@override String get fullscreen => 'Fullscreen';
	@override String get exitFullscreen => 'Exit fullscreen';
	@override String get pressBackAgainToExit => 'Press back again to exit';
	@override String get done => 'Hoàn tất';
}

// Path: screens
class _TranslationsScreensVi extends TranslationsScreensEn {
	_TranslationsScreensVi._(TranslationsVi root) : this._root = root, super.internal(root);

	final TranslationsVi _root; // ignore: unused_field

	// Translations
	@override String get licenses => 'Licenses';
	@override String get switchProfile => 'Chọn hồ sơ';
	@override String get subtitleStyling => 'Subtitle Styling';
	@override String get mpvConfig => 'mpv.conf';
	@override String get logs => 'Logs';
}

// Path: update
class _TranslationsUpdateVi extends TranslationsUpdateEn {
	_TranslationsUpdateVi._(TranslationsVi root) : this._root = root, super.internal(root);

	final TranslationsVi _root; // ignore: unused_field

	// Translations
	@override String get available => 'Update Available';
	@override String versionAvailable({required Object version}) => 'Version ${version} is available';
	@override String currentVersion({required Object version}) => 'Current: ${version}';
	@override String get skipVersion => 'Skip This Version';
	@override String get viewRelease => 'View Release';
	@override String get latestVersion => 'You are on the latest version';
	@override String get checkFailed => 'Failed to check for updates';
}

// Path: mediaDetail
class _TranslationsMediaDetailVi extends TranslationsMediaDetailEn {
	_TranslationsMediaDetailVi._(TranslationsVi root) : this._root = root, super.internal(root);

	final TranslationsVi _root; // ignore: unused_field

	// Translations
	@override String get watchNow => 'Xem phim';
	@override String get addToPlaylist => 'Thêm danh sách';
	@override String get plot => 'Nội dung';
	@override String get season => 'Phần';
	@override String get episodes => 'Các tập phim';
	@override String get episode => 'Tập';
	@override String get episodesListHeader => 'Danh sách tập phim';
	@override String get seasonsColumn => 'Các phần phim';
}

// Path: settings
class _TranslationsSettingsVi extends TranslationsSettingsEn {
	_TranslationsSettingsVi._(TranslationsVi root) : this._root = root, super.internal(root);

	final TranslationsVi _root; // ignore: unused_field

	// Translations
	@override String get title => 'Cài đặt';
	@override String get supportDeveloper => 'Support Lumi';
	@override String get supportDeveloperDescription => 'Donate via Liberapay to fund development';
	@override String get language => 'Ngôn ngữ';
	@override String get theme => 'Giao diện';
	@override String get appearance => 'Appearance';
	@override String get videoPlayback => 'Video Playback';
	@override String get videoPlaybackDescription => 'Configure playback behavior';
	@override String get advanced => 'Advanced';
	@override String get episodePosterMode => 'Episode Poster Style';
	@override String get seriesPoster => 'Series Poster';
	@override String get seasonPoster => 'Season Poster';
	@override String get episodeThumbnail => 'Thumbnail';
	@override String get showHeroSectionDescription => 'Display featured content carousel on home screen';
	@override String get secondsLabel => 'Seconds';
	@override String get minutesLabel => 'Minutes';
	@override String get secondsShort => 's';
	@override String get minutesShort => 'm';
	@override String durationHint({required Object min, required Object max}) => 'Enter duration (${min}-${max})';
	@override String get systemTheme => 'Mặc định hệ thống';
	@override String get lightTheme => 'Sáng';
	@override String get darkTheme => 'Tối';
	@override String get oledTheme => 'Siêu tối';
	@override String get libraryDensity => 'Library Density';
	@override String get compact => 'Compact';
	@override String get comfortable => 'Comfortable';
	@override String get viewMode => 'View Mode';
	@override String get gridView => 'Grid';
	@override String get listView => 'List';
	@override String get showHeroSection => 'Show Hero Section';
	@override String get useGlobalHubs => 'Use Home Layout';
	@override String get useGlobalHubsDescription => 'Show home page hubs like the official client. When off, shows per-library recommendations instead.';
	@override String get showServerNameOnHubs => 'Show Server Name on Hubs';
	@override String get showServerNameOnHubsDescription => 'Always display the server name in hub titles. When off, only shows for duplicate hub names.';
	@override String get groupLibrariesByServer => 'Group Libraries by Server';
	@override String get groupLibrariesByServerDescription => 'Show a header for each media server in the sidebar when you\'re connected to multiple servers.';
	@override String get alwaysKeepSidebarOpen => 'Always Keep Sidebar Open';
	@override String get alwaysKeepSidebarOpenDescription => 'Sidebar stays expanded and content area adjusts to fit';
	@override String get showUnwatchedCount => 'Show Unwatched Count';
	@override String get showUnwatchedCountDescription => 'Display unwatched episode count on shows and seasons';
	@override String get showEpisodeNumberOnCards => 'Show Episode Number on Cards';
	@override String get showEpisodeNumberOnCardsDescription => 'Show episode number alongside the season (e.g. S2 E3) on episode cards';
	@override String get showSeasonPostersOnTabs => 'Show Season Posters on Tabs';
	@override String get showSeasonPostersOnTabsDescription => 'Display the season\'s poster above each season tab on a show\'s detail page';
	@override String get hideSpoilers => 'Hide Spoilers for Unwatched Episodes';
	@override String get hideSpoilersDescription => 'Blur thumbnails and hide descriptions for episodes you haven\'t watched yet';
	@override String get playerBackend => 'Chương trình xem phim';
	@override String get audioLanguage => 'Ngôn ngữ âm thanh';
	@override String get none => 'Không có';
	@override String get exoPlayer => 'Nâng cao (Khuyên dùng)';
	@override String get mpv => 'Tiêu chuẩn';
	@override String get hardwareDecoding => 'Hardware Decoding';
	@override String get hardwareDecodingDescription => 'Use hardware acceleration when available';
	@override String get bufferSize => 'Buffer Size';
	@override String bufferSizeMB({required Object size}) => '${size}MB';
	@override String get bufferSizeAuto => 'Auto (Recommended)';
	@override String bufferSizeWarning({required Object heap, required Object size}) => 'Your device has ${heap}MB of memory. A ${size}MB buffer may cause playback issues.';
	@override String get defaultQualityTitle => 'Chất lượng hình ảnh';
	@override String get defaultQualityDescription => 'Used when starting playback. Lower values reduce bandwidth.';
	@override String get switchServer => 'Chọn máy chủ';
	@override String get subtitleStyling => 'Subtitle Styling';
	@override String get subtitleStylingDescription => 'Customize subtitle appearance';
	@override String get smallSkipDuration => 'Small Skip Duration';
	@override String get largeSkipDuration => 'Large Skip Duration';
	@override String get rewindOnResume => 'Rewind on Resume';
	@override String secondsUnit({required Object seconds}) => '${seconds} seconds';
	@override String get defaultSleepTimer => 'Default Sleep Timer';
	@override String minutesUnit({required Object minutes}) => '${minutes} minutes';
	@override String get rememberTrackSelections => 'Remember track selections per show/movie';
	@override String get rememberTrackSelectionsDescription => 'Automatically save audio and subtitle language preferences when you change tracks during playback';
	@override String get showChapterMarkersOnTimeline => 'Show chapter markers on seek bar';
	@override String get showChapterMarkersOnTimelineDescription => 'Segment the seek bar at chapter boundaries';
	@override String get clickVideoTogglesPlayback => 'Click on video to toggle play/pause';
	@override String get clickVideoTogglesPlaybackDescription => 'If enabled, clicking on the video player will play/pause the video. Otherwise, clicking will show/hide the playback controls.';
	@override String get videoPlayerControls => 'Video Player Controls';
	@override String get keyboardShortcuts => 'Keyboard Shortcuts';
	@override String get keyboardShortcutsDescription => 'Customize keyboard shortcuts';
	@override String get videoPlayerNavigation => 'Video Player Navigation';
	@override String get videoPlayerNavigationDescription => 'Use arrow keys to navigate video player controls';
	@override String get watchTogetherRelay => 'Watch Together Relay';
	@override String get watchTogetherRelayDescription => 'Set a custom relay server for Watch Together. All participants must use the same server.';
	@override String get watchTogetherRelayHint => 'https://my-relay.example.com';
	@override String get crashReporting => 'Crash Reporting';
	@override String get crashReportingDescription => 'Send crash reports to help improve the app';
	@override String get debugLogging => 'Debug Logging';
	@override String get debugLoggingDescription => 'Enable detailed logging for troubleshooting';
	@override String get viewLogs => 'View Logs';
	@override String get viewLogsDescription => 'View application logs';
	@override String get clearCache => 'Clear Cache';
	@override String get clearCacheDescription => 'This will clear all cached images and data. The app may take longer to load content after clearing the cache.';
	@override String get clearCacheSuccess => 'Cache cleared successfully';
	@override String get resetSettings => 'Reset Settings';
	@override String get resetSettingsDescription => 'This will reset all settings to their default values. This action cannot be undone.';
	@override String get resetSettingsSuccess => 'Settings reset successfully';
	@override String get backup => 'Backup';
	@override String get exportSettings => 'Export Settings';
	@override String get exportSettingsDescription => 'Save your preferences to a file';
	@override String get exportSettingsSuccess => 'Settings exported';
	@override String get exportSettingsFailed => 'Could not export settings';
	@override String get importSettings => 'Import Settings';
	@override String get importSettingsDescription => 'Restore preferences from a file';
	@override String get importSettingsConfirm => 'This will replace your current settings. Continue?';
	@override String get importSettingsSuccess => 'Settings imported';
	@override String get importSettingsFailed => 'Could not import settings';
	@override String get importSettingsInvalidFile => 'This file isn\'t a valid Lumi settings export';
	@override String get importSettingsNoUser => 'Sign in before importing settings';
	@override String get shortcutsReset => 'Shortcuts reset to defaults';
	@override String get about => 'About';
	@override String get aboutDescription => 'App information and licenses';
	@override String get updates => 'Updates';
	@override String get updateAvailable => 'Update Available';
	@override String get checkForUpdates => 'Check for Updates';
	@override String get autoCheckUpdatesOnStartup => 'Automatically check for updates on startup';
	@override String get autoCheckUpdatesOnStartupDescription => 'Show a notification when a new version is available at launch';
	@override String get validationErrorEnterNumber => 'Please enter a valid number';
	@override String validationErrorDuration({required Object min, required Object max, required Object unit}) => 'Duration must be between ${min} and ${max} ${unit}';
	@override String shortcutAlreadyAssigned({required Object action}) => 'Shortcut already assigned to ${action}';
	@override String shortcutUpdated({required Object action}) => 'Shortcut updated for ${action}';
	@override String get autoSkip => 'Auto Skip';
	@override String get autoSkipIntro => 'Auto Skip Intro';
	@override String get autoSkipIntroDescription => 'Automatically skip intro markers after a few seconds';
	@override String get autoSkipCredits => 'Auto Skip Credits';
	@override String get autoSkipCreditsDescription => 'Automatically skip credits and play next episode';
	@override String get forceSkipMarkerFallback => 'Force Fallback Markers';
	@override String get forceSkipMarkerFallbackDescription => 'Use chapter title patterns for skip markers even when Plex provides native markers';
	@override String get autoSkipDelay => 'Auto Skip Delay';
	@override String autoSkipDelayDescription({required Object seconds}) => 'Wait ${seconds} seconds before auto-skipping';
	@override String get introPattern => 'Intro Marker Pattern';
	@override String get introPatternDescription => 'Regex pattern to match intro markers in chapter titles';
	@override String get creditsPattern => 'Credits Marker Pattern';
	@override String get creditsPatternDescription => 'Regex pattern to match credits markers in chapter titles';
	@override String get invalidRegex => 'Invalid regular expression';
	@override String get downloads => 'Downloads';
	@override String get downloadLocationDescription => 'Choose where to store downloaded content';
	@override String get downloadLocationDefault => 'Default (App Storage)';
	@override String get downloadLocationCustom => 'Custom Location';
	@override String get selectFolder => 'Select Folder';
	@override String get resetToDefault => 'Reset to Default';
	@override String currentPath({required Object path}) => 'Current: ${path}';
	@override String get downloadLocationChanged => 'Download location changed';
	@override String get downloadLocationReset => 'Download location reset to default';
	@override String get downloadLocationInvalid => 'Selected folder is not writable';
	@override String get downloadLocationSelectError => 'Failed to select folder';
	@override String get downloadOnWifiOnly => 'Download on WiFi only';
	@override String get downloadOnWifiOnlyDescription => 'Prevent downloads when on cellular data';
	@override String get autoRemoveWatchedDownloads => 'Auto-remove watched downloads';
	@override String get autoRemoveWatchedDownloadsDescription => 'Automatically delete downloaded episodes and movies when marked as watched';
	@override String get cellularDownloadBlocked => 'Downloads are disabled on cellular data. Connect to WiFi or change the setting.';
	@override String get maxVolume => 'Maximum Volume';
	@override String get maxVolumeDescription => 'Allow volume boost above 100% for quiet media';
	@override String maxVolumePercent({required Object percent}) => '${percent}%';
	@override String get discordRichPresence => 'Discord Rich Presence';
	@override String get discordRichPresenceDescription => 'Show what you\'re watching on Discord';
	@override String get trakt => 'Trakt';
	@override String get traktDescription => 'Sync watch history with Trakt';
	@override String get trackers => 'Trackers';
	@override String get trackersDescription => 'Sync progress to Trakt, MyAnimeList, AniList, and Simkl';
	@override String get companionRemoteServer => 'Companion Remote Server';
	@override String get companionRemoteServerDescription => 'Allow mobile devices on your network to control this app';
	@override String get autoPip => 'Auto Picture-in-Picture';
	@override String get autoPipDescription => 'Automatically enter picture-in-picture when leaving the app during playback';
	@override String get matchContentFrameRate => 'Match Content Frame Rate';
	@override String get matchContentFrameRateDescription => 'Adjust display refresh rate to match video content, reducing judder and saving battery';
	@override String get matchRefreshRate => 'Match Refresh Rate';
	@override String get matchRefreshRateDescription => 'Switch display refresh rate to match video content when in fullscreen';
	@override String get matchDynamicRange => 'Match Dynamic Range';
	@override String get matchDynamicRangeDescription => 'Auto-enable HDR for HDR content and revert to SDR when leaving the player';
	@override String get displaySwitchDelay => 'Display Switch Delay';
	@override String get tunneledPlayback => 'Tunneled Playback';
	@override String get tunneledPlaybackDescription => 'Use hardware-accelerated video tunneling. Disable if you see a black screen with audio on HDR content';
	@override String get requireProfileSelectionOnOpen => 'Ask for profile on app open';
	@override String get requireProfileSelectionOnOpenDescription => 'Show profile selection every time the app is opened';
	@override String get forceTvMode => 'Force TV mode';
	@override String get forceTvModeDescription => 'Use the TV layout regardless of auto-detection. Useful on Android TV devices that don\'t report the leanback feature. Restarts the app on change.';
	@override String get startInFullscreen => 'Start in fullscreen';
	@override String get startInFullscreenDescription => 'Open Lumi in fullscreen mode at launch';
	@override String get autoHidePerformanceOverlay => 'Auto-Hide Performance Overlay';
	@override String get autoHidePerformanceOverlayDescription => 'Fade the performance overlay with the playback controls';
	@override String get showNavBarLabels => 'Show Navigation Bar Labels';
	@override String get showNavBarLabelsDescription => 'Display text labels under navigation bar icons';
	@override String get liveTvDefaultFavorites => 'Default to Favorite Channels';
	@override String get liveTvDefaultFavoritesDescription => 'Show only favorite channels when opening Live TV';
	@override String get display => 'Display';
	@override String get homeScreen => 'Home Screen';
	@override String get navigation => 'Navigation';
	@override String get window => 'Window';
	@override String get content => 'Content';
	@override String get player => 'Player';
	@override String get subtitlesAndConfig => 'Subtitles & Configuration';
	@override String get seekAndTiming => 'Seek & Timing';
	@override String get behavior => 'Behavior';
}

// Path: search
class _TranslationsSearchVi extends TranslationsSearchEn {
	_TranslationsSearchVi._(TranslationsVi root) : this._root = root, super.internal(root);

	final TranslationsVi _root; // ignore: unused_field

	// Translations
	@override String get hint => 'Tên của phim cần tìm kiếm...';
	@override String get tryDifferentTerm => 'Thử lại với từ khóa khác';
	@override String get searchYourMedia => 'Tìm kiếm phim';
	@override String get enterTitleActorOrKeyword => 'Gõ từ khóa vào khung tìm kiếm';
	@override String get otherResults => 'Kết quả khác';
}

// Path: hotkeys
class _TranslationsHotkeysVi extends TranslationsHotkeysEn {
	_TranslationsHotkeysVi._(TranslationsVi root) : this._root = root, super.internal(root);

	final TranslationsVi _root; // ignore: unused_field

	// Translations
	@override String setShortcutFor({required Object actionName}) => 'Set Shortcut for ${actionName}';
	@override String get clearShortcut => 'Clear shortcut';
	@override late final _TranslationsHotkeysActionsVi actions = _TranslationsHotkeysActionsVi._(_root);
}

// Path: fileInfo
class _TranslationsFileInfoVi extends TranslationsFileInfoEn {
	_TranslationsFileInfoVi._(TranslationsVi root) : this._root = root, super.internal(root);

	final TranslationsVi _root; // ignore: unused_field

	// Translations
	@override String get title => 'File Info';
	@override String get video => 'Video';
	@override String get audio => 'Audio';
	@override String get file => 'File';
	@override String get advanced => 'Advanced';
	@override String get codec => 'Codec';
	@override String get resolution => 'Resolution';
	@override String get bitrate => 'Bitrate';
	@override String get frameRate => 'Frame Rate';
	@override String get aspectRatio => 'Aspect Ratio';
	@override String get profile => 'Profile';
	@override String get bitDepth => 'Bit Depth';
	@override String get colorSpace => 'Color Space';
	@override String get colorRange => 'Color Range';
	@override String get colorPrimaries => 'Color Primaries';
	@override String get chromaSubsampling => 'Chroma Subsampling';
	@override String get channels => 'Channels';
	@override String get subtitles => 'Phụ đề';
	@override String get overallBitrate => 'Overall Bitrate';
	@override String get path => 'Path';
	@override String get size => 'Size';
	@override String get container => 'Container';
	@override String get duration => 'Duration';
	@override String get optimizedForStreaming => 'Optimized for Streaming';
	@override String get has64bitOffsets => '64-bit Offsets';
}

// Path: mediaMenu
class _TranslationsMediaMenuVi extends TranslationsMediaMenuEn {
	_TranslationsMediaMenuVi._(TranslationsVi root) : this._root = root, super.internal(root);

	final TranslationsVi _root; // ignore: unused_field

	// Translations
	@override String get markAsWatched => 'Mark as Watched';
	@override String get markAsUnwatched => 'Mark as Unwatched';
	@override String get removeFromContinueWatching => 'Remove from Continue Watching';
	@override String get goToSeries => 'Go to series';
	@override String get goToSeason => 'Go to season';
	@override String get shufflePlay => 'Shuffle Play';
	@override String get fileInfo => 'File Info';
	@override String get deleteFromServer => 'Delete from server';
	@override String get confirmDelete => 'This will permanently delete this media and its files from your server. This cannot be undone.';
	@override String get deleteMultipleWarning => 'This includes all episodes and their files.';
	@override String get mediaDeletedSuccessfully => 'Media item deleted successfully';
	@override String get mediaFailedToDelete => 'Failed to delete media item';
	@override String get rate => 'Rate';
	@override String get playFromBeginning => 'Play from Beginning';
	@override String get playVersion => 'Play Version...';
}

// Path: accessibility
class _TranslationsAccessibilityVi extends TranslationsAccessibilityEn {
	_TranslationsAccessibilityVi._(TranslationsVi root) : this._root = root, super.internal(root);

	final TranslationsVi _root; // ignore: unused_field

	// Translations
	@override String mediaCardMovie({required Object title}) => '${title}, movie';
	@override String mediaCardShow({required Object title}) => '${title}, TV show';
	@override String mediaCardEpisode({required Object title, required Object episodeInfo}) => '${title}, ${episodeInfo}';
	@override String mediaCardSeason({required Object title, required Object seasonInfo}) => '${title}, ${seasonInfo}';
	@override String get mediaCardWatched => 'watched';
	@override String mediaCardPartiallyWatched({required Object percent}) => '${percent} percent watched';
	@override String get mediaCardUnwatched => 'unwatched';
	@override String get tapToPlay => 'Tap to play';
}

// Path: tooltips
class _TranslationsTooltipsVi extends TranslationsTooltipsEn {
	_TranslationsTooltipsVi._(TranslationsVi root) : this._root = root, super.internal(root);

	final TranslationsVi _root; // ignore: unused_field

	// Translations
	@override String get shufflePlay => 'Shuffle play';
	@override String get playTrailer => 'Play trailer';
	@override String get markAsWatched => 'Mark as watched';
	@override String get markAsUnwatched => 'Mark as unwatched';
}

// Path: videoControls
class _TranslationsVideoControlsVi extends TranslationsVideoControlsEn {
	_TranslationsVideoControlsVi._(TranslationsVi root) : this._root = root, super.internal(root);

	final TranslationsVi _root; // ignore: unused_field

	// Translations
	@override String get audioLabel => 'Âm thanh';
	@override String get subtitlesLabel => 'Phụ đề';
	@override String get resetToZero => 'Reset to 0ms';
	@override String addTime({required Object amount, required Object unit}) => '+${amount}${unit}';
	@override String minusTime({required Object amount, required Object unit}) => '-${amount}${unit}';
	@override String playsLater({required Object label}) => '${label} plays later';
	@override String playsEarlier({required Object label}) => '${label} plays earlier';
	@override String get noOffset => 'No offset';
	@override String get letterbox => 'Letterbox';
	@override String get fillScreen => 'Fill screen';
	@override String get stretch => 'Stretch';
	@override String get lockRotation => 'Lock rotation';
	@override String get unlockRotation => 'Unlock rotation';
	@override String get timerActive => 'Timer Active';
	@override String playbackWillPauseIn({required Object duration}) => 'Playback will pause in ${duration}';
	@override String get stillWatching => 'Still watching?';
	@override String pausingIn({required Object seconds}) => 'Pausing in ${seconds}s';
	@override String get continueWatching => 'Continue';
	@override String get autoPlayNext => 'Tự động chuyển phim tiếp theo';
	@override String get playNext => 'Play Next';
	@override String get playButton => 'Play';
	@override String get pauseButton => 'Pause';
	@override String seekBackwardButton({required Object seconds}) => 'Seek backward ${seconds} seconds';
	@override String seekForwardButton({required Object seconds}) => 'Seek forward ${seconds} seconds';
	@override String get previousButton => 'Previous episode';
	@override String get nextButton => 'Next episode';
	@override String get previousChapterButton => 'Previous chapter';
	@override String get nextChapterButton => 'Next chapter';
	@override String get muteButton => 'Mute';
	@override String get unmuteButton => 'Unmute';
	@override String get settingsButton => 'Video settings';
	@override String get tracksButton => 'Audio & Subtitles';
	@override String get chaptersButton => 'Chapters';
	@override String get versionsButton => 'Video versions';
	@override String get versionQualityButton => 'Version & Quality';
	@override String get versionColumnHeader => 'Version';
	@override String get qualityColumnHeader => 'Chất lượng hình ảnh';
	@override String get qualityOriginal => 'Cao nhất';
	@override String qualityPresetLabel({required Object resolution, required Object bitrate}) => '${resolution}p ${bitrate} Mbps';
	@override String qualityBandwidthEstimate({required Object bitrate}) => '~${bitrate} Mbps';
	@override String get transcodeUnavailableFallback => 'Transcoding unavailable — playing original quality';
	@override String get pipButton => 'Picture-in-Picture mode';
	@override String get aspectRatioButton => 'Aspect ratio';
	@override String get ambientLighting => 'Ambient lighting';
	@override String get fullscreenButton => 'Enter fullscreen';
	@override String get exitFullscreenButton => 'Exit fullscreen';
	@override String get alwaysOnTopButton => 'Always on top';
	@override String get rotationLockButton => 'Rotation lock';
	@override String get lockScreen => 'Lock screen';
	@override String get screenLockButton => 'Screen lock';
	@override String get longPressToUnlock => 'Long press to unlock';
	@override String get timelineSlider => 'Video timeline';
	@override String get volumeSlider => 'Volume level';
	@override String endsAt({required Object time}) => 'Ends at ${time}';
	@override String get pipActive => 'Playing in Picture-in-Picture';
	@override String get pipFailed => 'Picture-in-picture failed to start';
	@override late final _TranslationsVideoControlsPipErrorsVi pipErrors = _TranslationsVideoControlsPipErrorsVi._(_root);
	@override String get chapters => 'Chapters';
	@override String get noChaptersAvailable => 'No chapters available';
	@override String get queue => 'Queue';
	@override String get noQueueItems => 'No items in queue';
	@override String get searchSubtitles => 'Search Subtitles';
	@override String get language => 'Language';
	@override String get noSubtitlesFound => 'No subtitles found';
	@override String get subtitleDownloaded => 'Subtitle downloaded';
	@override String get subtitleDownloadFailed => 'Failed to download subtitle';
	@override String get searchLanguages => 'Search languages...';
}

// Path: userStatus
class _TranslationsUserStatusVi extends TranslationsUserStatusEn {
	_TranslationsUserStatusVi._(TranslationsVi root) : this._root = root, super.internal(root);

	final TranslationsVi _root; // ignore: unused_field

	// Translations
	@override String get admin => 'Admin';
	@override String get restricted => 'Restricted';
	@override String get protected => 'Protected';
	@override String get current => 'CURRENT';
}

// Path: messages
class _TranslationsMessagesVi extends TranslationsMessagesEn {
	_TranslationsMessagesVi._(TranslationsVi root) : this._root = root, super.internal(root);

	final TranslationsVi _root; // ignore: unused_field

	// Translations
	@override String get markedAsWatched => 'Marked as watched';
	@override String get markedAsUnwatched => 'Marked as unwatched';
	@override String get markedAsWatchedOffline => 'Marked as watched (will sync when online)';
	@override String get markedAsUnwatchedOffline => 'Marked as unwatched (will sync when online)';
	@override String autoRemovedWatchedDownload({required Object title}) => 'Auto-removed: ${title}';
	@override String get removedFromContinueWatching => 'Removed from Continue Watching';
	@override String errorLoading({required Object error}) => 'Error: ${error}';
	@override String get fileInfoNotAvailable => 'File information not available';
	@override String errorLoadingFileInfo({required Object error}) => 'Error loading file info: ${error}';
	@override String get errorLoadingSeries => 'Error loading series';
	@override String get errorLoadingSeason => 'Error loading season';
	@override String get musicNotSupported => 'Music playback is not yet supported';
	@override String get noDescriptionAvailable => 'No description available';
	@override String get noProfilesAvailable => 'No profiles available';
	@override String get contactAdminForProfiles => 'Contact your server administrator to add profiles';
	@override String get unableToDetermineLibrarySection => 'Unable to determine library section for this item';
	@override String get logsCleared => 'Logs cleared';
	@override String get logsCopied => 'Logs copied to clipboard';
	@override String get noLogsAvailable => 'No logs available';
	@override String libraryScanning({required Object title}) => 'Scanning "${title}"...';
	@override String libraryScanStarted({required Object title}) => 'Library scan started for "${title}"';
	@override String libraryScanFailed({required Object error}) => 'Failed to scan library: ${error}';
	@override String metadataRefreshing({required Object title}) => 'Refreshing metadata for "${title}"...';
	@override String metadataRefreshStarted({required Object title}) => 'Metadata refresh started for "${title}"';
	@override String metadataRefreshFailed({required Object error}) => 'Failed to refresh metadata: ${error}';
	@override String get logoutConfirm => 'Are you sure you want to logout?';
	@override String get noSeasonsFound => 'No seasons found';
	@override String get noEpisodesFound => 'Không tìm thấy tập nào trong phần đầu tiên';
	@override String get noEpisodesFoundGeneral => 'Không tìm thấy tập nào';
	@override String get noResultsFound => 'Không tìm thấy kết quả';
	@override String sleepTimerSet({required Object label}) => 'Sleep timer set for ${label}';
	@override String get noItemsAvailable => 'No items available';
	@override String get failedToCreatePlayQueueNoItems => 'Failed to create play queue - no items';
	@override String failedPlayback({required Object action, required Object error}) => 'Failed to ${action}: ${error}';
	@override String get switchingToCompatiblePlayer => 'Switching to compatible player...';
	@override String get serverLimitTitle => 'Playback failed';
	@override String get serverLimitBody => 'The server returned an error (HTTP 500). This usually means the server owner has set a bandwidth or transcoding limit that\'s rejecting your session. There\'s nothing to do from the client — the server owner needs to adjust their settings.';
	@override String get logsUploaded => 'Logs uploaded';
	@override String get logsUploadFailed => 'Failed to upload logs';
	@override String get logId => 'Log ID';
}

// Path: subtitlingStyling
class _TranslationsSubtitlingStylingVi extends TranslationsSubtitlingStylingEn {
	_TranslationsSubtitlingStylingVi._(TranslationsVi root) : this._root = root, super.internal(root);

	final TranslationsVi _root; // ignore: unused_field

	// Translations
	@override String get text => 'Text';
	@override String get border => 'Border';
	@override String get background => 'Background';
	@override String get fontSize => 'Font Size';
	@override String get textColor => 'Text Color';
	@override String get borderSize => 'Border Size';
	@override String get borderColor => 'Border Color';
	@override String get backgroundOpacity => 'Background Opacity';
	@override String get backgroundColor => 'Background Color';
	@override String get position => 'Position';
	@override String get assOverride => 'ASS Override';
	@override String get bold => 'Bold';
	@override String get italic => 'Italic';
}

// Path: mpvConfig
class _TranslationsMpvConfigVi extends TranslationsMpvConfigEn {
	_TranslationsMpvConfigVi._(TranslationsVi root) : this._root = root, super.internal(root);

	final TranslationsVi _root; // ignore: unused_field

	// Translations
	@override String get title => 'mpv.conf';
	@override String get description => 'Advanced video player settings';
	@override String get presets => 'Presets';
	@override String get noPresets => 'No saved presets';
	@override String get saveAsPreset => 'Save as Preset...';
	@override String get presetName => 'Preset Name';
	@override String get presetNameHint => 'Enter a name for this preset';
	@override String get loadPreset => 'Load';
	@override String get deletePreset => 'Delete';
	@override String get presetSaved => 'Preset saved';
	@override String get presetLoaded => 'Preset loaded';
	@override String get presetDeleted => 'Preset deleted';
	@override String get confirmDeletePreset => 'Are you sure you want to delete this preset?';
	@override String get configPlaceholder => 'gpu-api=vulkan\nhwdec=auto\n# comment';
}

// Path: dialog
class _TranslationsDialogVi extends TranslationsDialogEn {
	_TranslationsDialogVi._(TranslationsVi root) : this._root = root, super.internal(root);

	final TranslationsVi _root; // ignore: unused_field

	// Translations
	@override String get confirmAction => 'Confirm Action';
}

// Path: profiles
class _TranslationsProfilesVi extends TranslationsProfilesEn {
	_TranslationsProfilesVi._(TranslationsVi root) : this._root = root, super.internal(root);

	final TranslationsVi _root; // ignore: unused_field

	// Translations
	@override String get addLumiProfile => 'Thêm hồ sơ';
	@override String get switchingProfile => 'Tải hồ sơ…';
	@override String get deleteThisProfileTitle => 'Delete this profile?';
	@override String deleteThisProfileMessage({required Object displayName}) => '${displayName} will be removed. Connections themselves are not affected.';
	@override String get active => 'Đang sử dụng';
	@override String get manage => 'Manage';
	@override String get delete => 'Delete';
	@override String get signOut => 'Đăng xuất';
	@override String get signOutPlexTitle => 'Sign out of Plex?';
	@override String signOutPlexMessage({required Object displayName}) => '${displayName} and every Plex Home user on this account will be removed from this device. You can sign back in any time.';
	@override String get signedOutPlex => 'Signed out of Plex.';
	@override String get signOutFailed => 'Sign out failed.';
	@override String get sectionTitle => 'Chọn hồ sơ';
	@override String get summarySingle => 'Lựa chọn hồ sơ xem phim mặc định';
	@override String summaryMultipleWithActive({required Object count, required Object activeName}) => '${count} profiles · active: ${activeName}';
	@override String summaryMultiple({required Object count}) => '${count} profiles';
	@override String get removeConnectionTitle => 'Remove connection?';
	@override String removeConnectionMessage({required Object displayName, required Object connectionLabel}) => '${displayName} will lose access to ${connectionLabel}. The connection itself stays available to other profiles.';
	@override String get deleteProfileTitle => 'Delete profile?';
	@override String deleteProfileMessage({required Object displayName}) => 'This removes ${displayName} and all its connections from this device. The underlying Plex/Jellyfin servers aren\'t affected.';
	@override String get profileNameLabel => 'Profile name';
	@override String get pinProtectionLabel => 'PIN protection';
	@override String get pinManagedByPlex => 'PIN managed by Plex. Edit on plex.tv.';
	@override String get noPinSetEditOnPlex => 'No PIN set. To require one, edit the home user on plex.tv.';
	@override String get setPin => 'Set PIN';
	@override String get connectionsLabel => 'Connections';
	@override String get add => 'Add';
	@override String get deleteProfileButton => 'Delete profile';
	@override String get noConnectionsHint => 'No connections — add one to use this profile.';
	@override String get plexHomeAccount => 'Plex Home account';
	@override String get connectionDefault => 'Default';
	@override String get makeDefault => 'Make default';
	@override String get removeConnection => 'Remove';
	@override String borrowAddTo({required Object displayName}) => 'Add to ${displayName}';
	@override String get borrowExplain => 'Borrow a connection from another profile. PIN-protected source profiles ask for the PIN before sharing.';
	@override String get borrowEmpty => 'Nothing to borrow yet.';
	@override String get borrowEmptySubtitle => 'Connect a Plex account or Jellyfin server to another profile first, then come back here.';
	@override String get newProfile => 'New profile';
	@override String get profileNameHint => 'e.g. Guests, Kids, Family Room';
	@override String get pinProtectionOptional => 'PIN protection (optional)';
	@override String get pinExplain => '4-digit PIN required to switch into this profile. Soft barrier — anyone who can clear app data can bypass it.';
	@override String get continueButton => 'Continue';
	@override String get pinsDontMatch => 'PINs don\'t match';
}

// Path: connections
class _TranslationsConnectionsVi extends TranslationsConnectionsEn {
	_TranslationsConnectionsVi._(TranslationsVi root) : this._root = root, super.internal(root);

	final TranslationsVi _root; // ignore: unused_field

	// Translations
	@override String get sectionTitle => 'Connections';
	@override String get addConnection => 'Add connection';
	@override String get addConnectionSubtitleNoProfile => 'Sign in with Plex or connect a Jellyfin server';
	@override String addConnectionSubtitleScoped({required Object displayName}) => 'Add to ${displayName} — Plex account, Jellyfin server, or borrow from another profile';
	@override String sessionExpiredOne({required Object name}) => 'Session expired for ${name}';
	@override String sessionExpiredMany({required Object count}) => 'Session expired for ${count} servers';
	@override String get signInAgain => 'Sign in again';
}

// Path: discover
class _TranslationsDiscoverVi extends TranslationsDiscoverEn {
	_TranslationsDiscoverVi._(TranslationsVi root) : this._root = root, super.internal(root);

	final TranslationsVi _root; // ignore: unused_field

	// Translations
	@override String get title => 'Discover';
	@override String get switchProfile => 'Switch Profile';
	@override String get noContentAvailable => 'No content available';
	@override String get addMediaToLibraries => 'Add some media to your libraries';
	@override String get continueWatching => 'Phim Đang Xem';
	@override String continueWatchingIn({required Object library}) => 'Continue Watching in ${library}';
	@override String get nextUp => 'Next Up';
	@override String nextUpIn({required Object library}) => 'Next Up in ${library}';
	@override String get recentlyAdded => 'Recently Added';
	@override String recentlyAddedIn({required Object library}) => 'Recently Added in ${library}';
	@override String playEpisode({required Object season, required Object episode}) => 'Phần ${season} Tập ${episode}';
	@override String get overview => 'Overview';
	@override String get cast => 'Diễn viên';
	@override String get extras => 'Trailers & Extras';
	@override String get studio => 'Studio';
	@override String get rating => 'Rating';
	@override String get movie => 'Movie';
	@override String get tvShow => 'TV Show';
	@override String minutesLeft({required Object minutes}) => '${minutes} min left';
}

// Path: errors
class _TranslationsErrorsVi extends TranslationsErrorsEn {
	_TranslationsErrorsVi._(TranslationsVi root) : this._root = root, super.internal(root);

	final TranslationsVi _root; // ignore: unused_field

	// Translations
	@override String searchFailed({required Object error}) => 'Search failed: ${error}';
	@override String connectionTimeout({required Object context}) => 'Connection timeout while loading ${context}';
	@override String get connectionFailed => 'Unable to connect to media server';
	@override String failedToLoad({required Object context, required Object error}) => 'Failed to load ${context}: ${error}';
	@override String get noClientAvailable => 'No client available';
	@override String authenticationFailed({required Object error}) => 'Authentication failed: ${error}';
	@override String get couldNotLaunchUrl => 'Could not launch auth URL';
	@override String get pleaseEnterToken => 'Please enter a token';
	@override String get invalidToken => 'Invalid token';
	@override String failedToVerifyToken({required Object error}) => 'Failed to verify token: ${error}';
	@override String failedToSwitchProfile({required Object displayName}) => '${displayName} đăng nhập thất bại';
	@override String failedToDeleteProfile({required Object displayName}) => 'Failed to delete ${displayName}';
	@override String get failedToRate => 'Couldn\'t update rating';
}

// Path: libraries
class _TranslationsLibrariesVi extends TranslationsLibrariesEn {
	_TranslationsLibrariesVi._(TranslationsVi root) : this._root = root, super.internal(root);

	final TranslationsVi _root; // ignore: unused_field

	// Translations
	@override String get title => 'Libraries';
	@override String get scanLibraryFiles => 'Scan Library Files';
	@override String get scanLibrary => 'Scan Library';
	@override String get analyze => 'Analyze';
	@override String get analyzeLibrary => 'Analyze Library';
	@override String get refreshMetadata => 'Refresh Metadata';
	@override String get emptyTrash => 'Empty Trash';
	@override String emptyingTrash({required Object title}) => 'Emptying trash for "${title}"...';
	@override String trashEmptied({required Object title}) => 'Trash emptied for "${title}"';
	@override String failedToEmptyTrash({required Object error}) => 'Failed to empty trash: ${error}';
	@override String analyzing({required Object title}) => 'Analyzing "${title}"...';
	@override String analysisStarted({required Object title}) => 'Analysis started for "${title}"';
	@override String failedToAnalyze({required Object error}) => 'Failed to analyze library: ${error}';
	@override String get noLibrariesFound => 'No libraries found';
	@override String get allLibrariesHidden => 'All libraries are hidden';
	@override String hiddenLibrariesCount({required Object count}) => 'Hidden libraries (${count})';
	@override String get thisLibraryIsEmpty => 'This library is empty';
	@override String get all => 'Tất cả';
	@override String get clearAll => 'Clear All';
	@override String scanLibraryConfirm({required Object title}) => 'Are you sure you want to scan "${title}"?';
	@override String analyzeLibraryConfirm({required Object title}) => 'Are you sure you want to analyze "${title}"?';
	@override String refreshMetadataConfirm({required Object title}) => 'Are you sure you want to refresh metadata for "${title}"?';
	@override String emptyTrashConfirm({required Object title}) => 'Are you sure you want to empty trash for "${title}"?';
	@override String get manageLibraries => 'Manage Libraries';
	@override String get sort => 'Sort';
	@override String get sortBy => 'Sắp xếp';
	@override String get filters => 'Lọc phim';
	@override String get confirmActionMessage => 'Are you sure you want to perform this action?';
	@override String get showLibrary => 'Show library';
	@override String get hideLibrary => 'Hide library';
	@override String get libraryOptions => 'Library options';
	@override String get content => 'library content';
	@override String get selectLibrary => 'Select library';
	@override String filtersWithCount({required Object count}) => 'Filters (${count})';
	@override String get noRecommendations => 'No recommendations available';
	@override String get noCollections => 'No collections in this library';
	@override String get noFoldersFound => 'No folders found';
	@override String get folders => 'folders';
	@override late final _TranslationsLibrariesTabsVi tabs = _TranslationsLibrariesTabsVi._(_root);
	@override late final _TranslationsLibrariesGroupingsVi groupings = _TranslationsLibrariesGroupingsVi._(_root);
	@override late final _TranslationsLibrariesFilterCategoriesVi filterCategories = _TranslationsLibrariesFilterCategoriesVi._(_root);
	@override late final _TranslationsLibrariesSortLabelsVi sortLabels = _TranslationsLibrariesSortLabelsVi._(_root);
}

// Path: about
class _TranslationsAboutVi extends TranslationsAboutEn {
	_TranslationsAboutVi._(TranslationsVi root) : this._root = root, super.internal(root);

	final TranslationsVi _root; // ignore: unused_field

	// Translations
	@override String get title => 'About';
	@override String get openSourceLicenses => 'Open Source Licenses';
	@override String versionLabel({required Object version}) => 'Version ${version}';
	@override String get appDescription => 'A beautiful Plex and Jellyfin client for Flutter';
	@override String get viewLicensesDescription => 'View licenses of third-party libraries';
}

// Path: serverSelection
class _TranslationsServerSelectionVi extends TranslationsServerSelectionEn {
	_TranslationsServerSelectionVi._(TranslationsVi root) : this._root = root, super.internal(root);

	final TranslationsVi _root; // ignore: unused_field

	// Translations
	@override String get allServerConnectionsFailed => 'Failed to connect to any servers. Please check your network and try again.';
	@override String noServersFoundForAccount({required Object username, required Object email}) => 'No servers found for ${username} (${email})';
	@override String failedToLoadServers({required Object error}) => 'Failed to load servers: ${error}';
	@override String get selectServer => 'Chọn máy chủ';
	@override String get selectServerDescription => 'Chọn máy chủ kho phim mặc định';
	@override String get noServersAvailable => 'No servers available';
	@override String get online => 'Đang hoạt động';
	@override String get offline => 'Mất tín hiệu';
}

// Path: hubDetail
class _TranslationsHubDetailVi extends TranslationsHubDetailEn {
	_TranslationsHubDetailVi._(TranslationsVi root) : this._root = root, super.internal(root);

	final TranslationsVi _root; // ignore: unused_field

	// Translations
	@override String get title => 'Title';
	@override String get releaseYear => 'Release Year';
	@override String get dateAdded => 'Date Added';
	@override String get rating => 'Rating';
	@override String get noItemsFound => 'No items found';
}

// Path: logs
class _TranslationsLogsVi extends TranslationsLogsEn {
	_TranslationsLogsVi._(TranslationsVi root) : this._root = root, super.internal(root);

	final TranslationsVi _root; // ignore: unused_field

	// Translations
	@override String get clearLogs => 'Clear Logs';
	@override String get copyLogs => 'Copy Logs';
	@override String get uploadLogs => 'Upload Logs';
}

// Path: licenses
class _TranslationsLicensesVi extends TranslationsLicensesEn {
	_TranslationsLicensesVi._(TranslationsVi root) : this._root = root, super.internal(root);

	final TranslationsVi _root; // ignore: unused_field

	// Translations
	@override String get relatedPackages => 'Related Packages';
	@override String get license => 'License';
	@override String licenseNumber({required Object number}) => 'License ${number}';
	@override String licensesCount({required Object count}) => '${count} licenses';
}

// Path: navigation
class _TranslationsNavigationVi extends TranslationsNavigationEn {
	_TranslationsNavigationVi._(TranslationsVi root) : this._root = root, super.internal(root);

	final TranslationsVi _root; // ignore: unused_field

	// Translations
	@override String get movies => 'Phim lẻ';
	@override String get shows => 'Phim bộ';
	@override String get liveTv => 'Live TV';
	@override String get collections => 'Bộ sưu tập';
	@override String get playlists => 'Danh sách';
}

// Path: liveTv
class _TranslationsLiveTvVi extends TranslationsLiveTvEn {
	_TranslationsLiveTvVi._(TranslationsVi root) : this._root = root, super.internal(root);

	final TranslationsVi _root; // ignore: unused_field

	// Translations
	@override String get title => 'Live TV';
	@override String get guide => 'Guide';
	@override String get noChannels => 'No channels available';
	@override String get noDvr => 'No DVR configured on any server';
	@override String get noPrograms => 'No program data available';
	@override String get live => 'LIVE';
	@override String get reloadGuide => 'Reload Guide';
	@override String get now => 'Now';
	@override String get today => 'Today';
	@override String get tomorrow => 'Tomorrow';
	@override String get midnight => 'Midnight';
	@override String get overnight => 'Overnight';
	@override String get morning => 'Morning';
	@override String get daytime => 'Daytime';
	@override String get evening => 'Evening';
	@override String get lateNight => 'Late Night';
	@override String get whatsOn => 'What\'s On';
	@override String get watchChannel => 'Watch Channel';
	@override String get favorites => 'Favorites';
	@override String get reorderFavorites => 'Reorder Favorites';
	@override String get joinSession => 'Join Session in Progress';
	@override String watchFromStart({required Object minutes}) => 'Watch from start (${minutes} min ago)';
	@override String get watchLive => 'Watch Live';
	@override String get goToLive => 'Go to Live';
	@override String get record => 'Record';
	@override String get recordEpisode => 'Record Episode';
	@override String get recordSeries => 'Record Series';
	@override String get recordOptions => 'Record Options';
	@override String get recordings => 'Recordings';
	@override String get scheduledRecordings => 'Scheduled';
	@override String get recordingRules => 'Recording Rules';
	@override String get noScheduledRecordings => 'Nothing scheduled to record';
	@override String get noRecordingRules => 'No recording rules yet';
	@override String get manageRecording => 'Manage recording';
	@override String get cancelRecording => 'Cancel recording';
	@override String get cancelRecordingTitle => 'Cancel this recording?';
	@override String cancelRecordingMessage({required Object title}) => '${title} will no longer be recorded.';
	@override String get deleteRule => 'Delete rule';
	@override String get deleteRuleTitle => 'Delete recording rule?';
	@override String deleteRuleMessage({required Object title}) => 'Future episodes of ${title} will not be recorded.';
	@override String get recordingScheduled => 'Recording scheduled';
	@override String get alreadyScheduled => 'This program is already scheduled';
	@override String get dvrAdminRequired => 'DVR settings require an admin account';
	@override String get recordingFailed => 'Couldn\'t schedule recording';
	@override String get recordingTargetMissing => 'Couldn\'t determine recording library';
	@override String get recordNotAvailable => 'Recording not available for this program';
	@override String get recordingCancelled => 'Recording cancelled';
	@override String get recordingRuleDeleted => 'Recording rule deleted';
	@override String get processRecordingRules => 'Re-evaluate rules';
	@override String get loadingRecordings => 'Loading recordings...';
	@override String get recordingInProgress => 'Recording now';
	@override String recordingsCount({required Object count}) => '${count} scheduled';
	@override String get editRule => 'Edit rule';
	@override String get editRuleAction => 'Edit';
	@override String get recordingRuleUpdated => 'Recording rule updated';
	@override String get guideReloadRequested => 'Guide refresh requested';
	@override String get rulesProcessRequested => 'Rule re-evaluation requested';
	@override String get recordShow => 'Record show';
}

// Path: collections
class _TranslationsCollectionsVi extends TranslationsCollectionsEn {
	_TranslationsCollectionsVi._(TranslationsVi root) : this._root = root, super.internal(root);

	final TranslationsVi _root; // ignore: unused_field

	// Translations
	@override String get title => 'Collections';
	@override String get collection => 'Collection';
	@override String get empty => 'Collection is empty';
	@override String get unknownLibrarySection => 'Cannot delete: Unknown library section';
	@override String get deleteCollection => 'Delete Collection';
	@override String deleteConfirm({required Object title}) => 'Are you sure you want to delete "${title}"? This action cannot be undone.';
	@override String get deleted => 'Collection deleted';
	@override String get deleteFailed => 'Failed to delete collection';
	@override String deleteFailedWithError({required Object error}) => 'Failed to delete collection: ${error}';
	@override String failedToLoadItems({required Object error}) => 'Failed to load collection items: ${error}';
	@override String get selectCollection => 'Select Collection';
	@override String get collectionName => 'Collection Name';
	@override String get enterCollectionName => 'Enter collection name';
	@override String get addedToCollection => 'Added to collection';
	@override String get errorAddingToCollection => 'Failed to add to collection';
	@override String get created => 'Collection created';
	@override String get removeFromCollection => 'Remove from collection';
	@override String removeFromCollectionConfirm({required Object title}) => 'Remove "${title}" from this collection?';
	@override String get removedFromCollection => 'Removed from collection';
	@override String get removeFromCollectionFailed => 'Failed to remove from collection';
	@override String removeFromCollectionError({required Object error}) => 'Error removing from collection: ${error}';
	@override String get searchCollections => 'Search collections...';
}

// Path: playlists
class _TranslationsPlaylistsVi extends TranslationsPlaylistsEn {
	_TranslationsPlaylistsVi._(TranslationsVi root) : this._root = root, super.internal(root);

	final TranslationsVi _root; // ignore: unused_field

	// Translations
	@override String get title => 'Playlists';
	@override String get playlist => 'Playlist';
	@override String get noPlaylists => 'Chưa có danh sách';
	@override String get create => 'Create Playlist';
	@override String get playlistName => 'Playlist Name';
	@override String get enterPlaylistName => 'Enter playlist name';
	@override String get delete => 'Delete Playlist';
	@override String get removeItem => 'Remove from Playlist';
	@override String get smartPlaylist => 'Smart Playlist';
	@override String itemCount({required Object count}) => '${count} items';
	@override String get oneItem => '1 item';
	@override String get emptyPlaylist => 'This playlist is empty';
	@override String get deleteConfirm => 'Delete Playlist?';
	@override String deleteMessage({required Object name}) => 'Are you sure you want to delete "${name}"?';
	@override String get created => 'Playlist created';
	@override String get deleted => 'Playlist deleted';
	@override String get itemAdded => 'Added to playlist';
	@override String get itemRemoved => 'Removed from playlist';
	@override String get selectPlaylist => 'Select Playlist';
	@override String get errorCreating => 'Failed to create playlist';
	@override String get errorDeleting => 'Failed to delete playlist';
	@override String get errorLoading => 'Failed to load playlists';
	@override String get errorAdding => 'Failed to add to playlist';
	@override String get errorReordering => 'Failed to reorder playlist item';
	@override String get errorRemoving => 'Failed to remove from playlist';
}

// Path: watchTogether
class _TranslationsWatchTogetherVi extends TranslationsWatchTogetherEn {
	_TranslationsWatchTogetherVi._(TranslationsVi root) : this._root = root, super.internal(root);

	final TranslationsVi _root; // ignore: unused_field

	// Translations
	@override String get title => 'Watch Together';
	@override String get description => 'Watch content in sync with friends and family';
	@override String get createSession => 'Create Session';
	@override String get creating => 'Creating...';
	@override String get joinSession => 'Join Session';
	@override String get joining => 'Joining...';
	@override String get controlMode => 'Control Mode';
	@override String get controlModeQuestion => 'Who can control playback?';
	@override String get hostOnly => 'Host Only';
	@override String get anyone => 'Anyone';
	@override String get hostingSession => 'Hosting Session';
	@override String get inSession => 'In Session';
	@override String get sessionCode => 'Session Code';
	@override String get hostControlsPlayback => 'Host controls playback';
	@override String get anyoneCanControl => 'Anyone can control playback';
	@override String get hostControls => 'Host controls';
	@override String get anyoneControls => 'Anyone controls';
	@override String get participants => 'Participants';
	@override String get host => 'Host';
	@override String get hostBadge => 'HOST';
	@override String get youAreHost => 'You are the host';
	@override String get watchingWithOthers => 'Watching with others';
	@override String get endSession => 'End Session';
	@override String get leaveSession => 'Leave Session';
	@override String get endSessionQuestion => 'End Session?';
	@override String get leaveSessionQuestion => 'Leave Session?';
	@override String get endSessionConfirm => 'This will end the session for all participants.';
	@override String get leaveSessionConfirm => 'You will be removed from the session.';
	@override String get endSessionConfirmOverlay => 'This will end the watch session for all participants.';
	@override String get leaveSessionConfirmOverlay => 'You will be disconnected from the watch session.';
	@override String get end => 'End';
	@override String get leave => 'Leave';
	@override String get syncing => 'Syncing...';
	@override String get joinWatchSession => 'Join Watch Session';
	@override String get enterCodeHint => 'Enter 5-character code';
	@override String get pasteFromClipboard => 'Paste from clipboard';
	@override String get pleaseEnterCode => 'Please enter a session code';
	@override String get codeMustBe5Chars => 'Session code must be 5 characters';
	@override String get joinInstructions => 'Enter the session code shared by the host to join their watch session.';
	@override String get failedToCreate => 'Failed to create session';
	@override String get failedToJoin => 'Failed to join session';
	@override String get sessionCodeCopied => 'Session code copied to clipboard';
	@override String get relayUnreachable => 'The relay server is unreachable. This may be caused by your ISP blocking the connection. You can still try, but Watch Together may not work.';
	@override String get reconnectingToHost => 'Reconnecting to host...';
	@override String get currentPlayback => 'Current Playback';
	@override String get joinCurrentPlayback => 'Join Current Playback';
	@override String get joinCurrentPlaybackDescription => 'Jump back into what the host is currently watching';
	@override String get failedToOpenCurrentPlayback => 'Failed to open current playback';
	@override String participantJoined({required Object name}) => '${name} joined';
	@override String participantLeft({required Object name}) => '${name} left';
	@override String participantPaused({required Object name}) => '${name} paused';
	@override String participantResumed({required Object name}) => '${name} resumed';
	@override String participantSeeked({required Object name}) => '${name} seeked';
	@override String participantBuffering({required Object name}) => '${name} is buffering';
	@override String get waitingForParticipants => 'Waiting for others to load...';
	@override String get recentRooms => 'Recent Rooms';
	@override String get renameRoom => 'Rename Room';
	@override String get removeRoom => 'Remove';
	@override String get guestSwitchUnavailable => 'Couldn\'t switch — server unavailable for sync';
	@override String get guestSwitchFailed => 'Couldn\'t switch — content not found on this server';
}

// Path: downloads
class _TranslationsDownloadsVi extends TranslationsDownloadsEn {
	_TranslationsDownloadsVi._(TranslationsVi root) : this._root = root, super.internal(root);

	final TranslationsVi _root; // ignore: unused_field

	// Translations
	@override String get title => 'Downloads';
	@override String get manage => 'Manage';
	@override String get tvShows => 'TV Shows';
	@override String get movies => 'Movies';
	@override String get noDownloads => 'No downloads yet';
	@override String get noDownloadsDescription => 'Downloaded content will appear here for offline viewing';
	@override String get downloadNow => 'Download';
	@override String get deleteDownload => 'Delete download';
	@override String get retryDownload => 'Retry download';
	@override String get downloadQueued => 'Download queued';
	@override String get serverErrorBitrate => 'Server error — the file may exceed the remote streaming bitrate limit';
	@override String episodesQueued({required Object count}) => '${count} episodes queued for download';
	@override String get downloadDeleted => 'Download deleted';
	@override String deleteConfirm({required Object title}) => 'Are you sure you want to delete "${title}"? This will remove the downloaded file from your device.';
	@override String get deleting => 'Deleting...';
	@override String deletingWithProgress({required Object title, required Object current, required Object total}) => 'Deleting ${title}... (${current} of ${total})';
	@override String get queuedTooltip => 'Queued';
	@override String queuedFilesTooltip({required Object files}) => 'Queued ${files}';
	@override String get downloadingTooltip => 'Downloading...';
	@override String downloadingFilesTooltip({required Object files}) => 'Downloading ${files}';
	@override String get noDownloadsTree => 'No downloads';
	@override String get pauseAll => 'Pause all';
	@override String get resumeAll => 'Resume all';
	@override String get deleteAll => 'Delete all';
	@override String get selectVersion => 'Select Version';
	@override String get allEpisodes => 'All episodes';
	@override String get unwatchedOnly => 'Unwatched only';
	@override String nextNUnwatched({required Object count}) => 'Next ${count} unwatched';
	@override String get customAmount => 'Custom amount...';
	@override String get howManyEpisodes => 'How many episodes?';
	@override String itemsQueued({required Object count}) => '${count} items queued for download';
	@override String get keepSynced => 'Keep synced';
	@override String get downloadOnce => 'Download once';
	@override String keepNUnwatched({required Object count}) => 'Keep ${count} unwatched';
	@override String get editSyncRule => 'Edit sync rule';
	@override String get removeSyncRule => 'Remove sync rule';
	@override String removeSyncRuleConfirm({required Object title}) => 'Stop syncing "${title}"? Downloaded episodes will be kept.';
	@override String syncRuleCreated({required Object count}) => 'Sync rule created — keeping ${count} unwatched episodes';
	@override String get syncRuleUpdated => 'Sync rule updated';
	@override String get syncRuleRemoved => 'Sync rule removed';
	@override String syncedNewEpisodes({required Object count, required Object title}) => 'Synced ${count} new episodes for ${title}';
	@override String get activeSyncRules => 'Sync rules';
	@override String get noSyncRules => 'No sync rules';
	@override String get manageSyncRule => 'Manage sync';
	@override String get editEpisodeCount => 'Episode count';
	@override String get editSyncFilter => 'Sync filter';
	@override String get syncAllItems => 'Syncing all items';
	@override String get syncUnwatchedItems => 'Syncing unwatched items';
	@override String syncRuleServerContext({required Object server, required Object status}) => 'Server: ${server} • ${status}';
	@override String get syncRuleAvailable => 'Available';
	@override String get syncRuleOffline => 'Offline';
	@override String get syncRuleSignInRequired => 'Sign in required';
	@override String get syncRuleNotAvailableForProfile => 'Not available for current profile';
	@override String get syncRuleUnknownServer => 'Unknown server';
	@override String get syncRuleListCreated => 'Sync rule created';
}

// Path: shaders
class _TranslationsShadersVi extends TranslationsShadersEn {
	_TranslationsShadersVi._(TranslationsVi root) : this._root = root, super.internal(root);

	final TranslationsVi _root; // ignore: unused_field

	// Translations
	@override String get title => 'Shaders';
	@override String get noShaderDescription => 'No video enhancement';
	@override String get nvscalerDescription => 'NVIDIA image scaling for sharper video';
	@override String get artcnnVariantNeutral => 'Neutral';
	@override String get artcnnVariantDenoise => 'Denoise';
	@override String get artcnnVariantDenoiseSharpen => 'Denoise + Sharpen';
	@override String get qualityFast => 'Fast';
	@override String get qualityHQ => 'High Quality';
	@override String get mode => 'Mode';
	@override String get importShader => 'Import Shader';
	@override String get customShaderDescription => 'Custom GLSL shader';
	@override String get shaderImported => 'Shader imported';
	@override String get shaderImportFailed => 'Failed to import shader';
	@override String get deleteShader => 'Delete Shader';
	@override String deleteShaderConfirm({required Object name}) => 'Delete "${name}"?';
}

// Path: companionRemote
class _TranslationsCompanionRemoteVi extends TranslationsCompanionRemoteEn {
	_TranslationsCompanionRemoteVi._(TranslationsVi root) : this._root = root, super.internal(root);

	final TranslationsVi _root; // ignore: unused_field

	// Translations
	@override String get title => 'Companion Remote';
	@override String connectedTo({required Object name}) => 'Connected to ${name}';
	@override late final _TranslationsCompanionRemoteSessionVi session = _TranslationsCompanionRemoteSessionVi._(_root);
	@override late final _TranslationsCompanionRemotePairingVi pairing = _TranslationsCompanionRemotePairingVi._(_root);
	@override late final _TranslationsCompanionRemoteRemoteVi remote = _TranslationsCompanionRemoteRemoteVi._(_root);
}

// Path: videoSettings
class _TranslationsVideoSettingsVi extends TranslationsVideoSettingsEn {
	_TranslationsVideoSettingsVi._(TranslationsVi root) : this._root = root, super.internal(root);

	final TranslationsVi _root; // ignore: unused_field

	// Translations
	@override String get playbackSettings => 'Cấu hình';
	@override String get playbackSpeed => 'Tốc độ phát';
	@override String get sleepTimer => 'Hẹn giờ tắt màn hình';
	@override String get audioSync => 'Độ trễ âm thanh';
	@override String get subtitleSync => 'Độ trễ phụ đề';
	@override String get hdr => 'HDR';
	@override String get audioOutput => 'Thiết bị âm thanh';
	@override String get performanceOverlay => 'Performance Overlay';
	@override String get audioPassthrough => 'Truyền thẳng âm thanh (Passthrough)';
	@override String get audioNormalization => 'Normalize Loudness';
	@override String get off => 'Tắt';
	@override String active({required Object time}) => 'Đang bật (${time})';
	@override String get normalSpeed => 'Bình thường';
}

// Path: externalPlayer
class _TranslationsExternalPlayerVi extends TranslationsExternalPlayerEn {
	_TranslationsExternalPlayerVi._(TranslationsVi root) : this._root = root, super.internal(root);

	final TranslationsVi _root; // ignore: unused_field

	// Translations
	@override String get title => 'External Player';
	@override String get useExternalPlayer => 'Use External Player';
	@override String get useExternalPlayerDescription => 'Open videos in an external app instead of the built-in player';
	@override String get selectPlayer => 'Select Player';
	@override String get customPlayers => 'Custom Players';
	@override String get systemDefault => 'System Default';
	@override String get addCustomPlayer => 'Add Custom Player';
	@override String get playerName => 'Player Name';
	@override String get playerCommand => 'Command';
	@override String get playerPackage => 'Package Name';
	@override String get playerUrlScheme => 'URL Scheme';
	@override String get off => 'Tắt';
	@override String get launchFailed => 'Failed to open external player';
	@override String appNotInstalled({required Object name}) => '${name} is not installed';
	@override String get playInExternalPlayer => 'Play in External Player';
}

// Path: metadataEdit
class _TranslationsMetadataEditVi extends TranslationsMetadataEditEn {
	_TranslationsMetadataEditVi._(TranslationsVi root) : this._root = root, super.internal(root);

	final TranslationsVi _root; // ignore: unused_field

	// Translations
	@override String get editMetadata => 'Edit...';
	@override String get screenTitle => 'Edit Metadata';
	@override String get basicInfo => 'Basic Info';
	@override String get artwork => 'Artwork';
	@override String get advancedSettings => 'Advanced Settings';
	@override String get title => 'Title';
	@override String get sortTitle => 'Sort Title';
	@override String get originalTitle => 'Original Title';
	@override String get releaseDate => 'Release Date';
	@override String get contentRating => 'Content Rating';
	@override String get studio => 'Studio';
	@override String get tagline => 'Tagline';
	@override String get summary => 'Summary';
	@override String get poster => 'Poster';
	@override String get background => 'Background';
	@override String get logo => 'Logo';
	@override String get squareArt => 'Square Art';
	@override String get selectPoster => 'Select Poster';
	@override String get selectBackground => 'Select Background';
	@override String get selectLogo => 'Select Logo';
	@override String get selectSquareArt => 'Select Square Art';
	@override String get fromUrl => 'From URL';
	@override String get uploadFile => 'Upload File';
	@override String get enterImageUrl => 'Enter image URL';
	@override String get imageUrl => 'Image URL';
	@override String get metadataUpdated => 'Metadata updated';
	@override String get metadataUpdateFailed => 'Failed to update metadata';
	@override String get artworkUpdated => 'Artwork updated';
	@override String get artworkUpdateFailed => 'Failed to update artwork';
	@override String get noArtworkAvailable => 'No artwork available';
	@override String get notSet => 'Not set';
	@override String get libraryDefault => 'Library default';
	@override String get accountDefault => 'Account default';
	@override String get seriesDefault => 'Series default';
	@override String get episodeSorting => 'Episode Sorting';
	@override String get oldestFirst => 'Oldest first';
	@override String get newestFirst => 'Newest first';
	@override String get keep => 'Keep';
	@override String get allEpisodes => 'All episodes';
	@override String latestEpisodes({required Object count}) => '${count} latest episodes';
	@override String get latestEpisode => 'Latest episode';
	@override String episodesAddedPastDays({required Object count}) => 'Episodes added in the past ${count} days';
	@override String get deleteAfterPlaying => 'Delete Episodes After Playing';
	@override String get never => 'Never';
	@override String get afterADay => 'After a day';
	@override String get afterAWeek => 'After a week';
	@override String get afterAMonth => 'After a month';
	@override String get onNextRefresh => 'On next refresh';
	@override String get seasons => 'Seasons';
	@override String get show => 'Show';
	@override String get hide => 'Hide';
	@override String get episodeOrdering => 'Episode Ordering';
	@override String get tmdbAiring => 'The Movie Database (Aired)';
	@override String get tvdbAiring => 'TheTVDB (Aired)';
	@override String get tvdbAbsolute => 'TheTVDB (Absolute)';
	@override String get metadataLanguage => 'Metadata Language';
	@override String get useOriginalTitle => 'Use Original Title';
	@override String get preferredAudioLanguage => 'Preferred Audio Language';
	@override String get preferredSubtitleLanguage => 'Preferred Subtitle Language';
	@override String get subtitleMode => 'Auto-Select Subtitle Mode';
	@override String get manuallySelected => 'Manually selected';
	@override String get shownWithForeignAudio => 'Shown with foreign audio';
	@override String get alwaysEnabled => 'Always enabled';
	@override String get tags => 'Tags';
	@override String get addTag => 'Add tag';
	@override String get genre => 'Genre';
	@override String get director => 'Director';
	@override String get writer => 'Writer';
	@override String get producer => 'Producer';
	@override String get country => 'Country';
	@override String get collection => 'Collection';
	@override String get label => 'Label';
	@override String get style => 'Style';
	@override String get mood => 'Mood';
}

// Path: matchScreen
class _TranslationsMatchScreenVi extends TranslationsMatchScreenEn {
	_TranslationsMatchScreenVi._(TranslationsVi root) : this._root = root, super.internal(root);

	final TranslationsVi _root; // ignore: unused_field

	// Translations
	@override String get match => 'Match...';
	@override String get fixMatch => 'Fix Match...';
	@override String get unmatch => 'Unmatch';
	@override String get unmatchConfirm => 'Clear the current match for this item? Plex will treat it as unmatched until you match it again.';
	@override String get unmatchSuccess => 'Item unmatched';
	@override String get unmatchFailed => 'Failed to unmatch item';
	@override String get matchApplied => 'Match applied';
	@override String get matchFailed => 'Failed to apply match';
	@override String get titleHint => 'Title';
	@override String get yearHint => 'Year';
	@override String get search => 'Search';
	@override String get noMatchesFound => 'No matches found';
}

// Path: serverTasks
class _TranslationsServerTasksVi extends TranslationsServerTasksEn {
	_TranslationsServerTasksVi._(TranslationsVi root) : this._root = root, super.internal(root);

	final TranslationsVi _root; // ignore: unused_field

	// Translations
	@override String get title => 'Server Tasks';
	@override String get failedToLoad => 'Failed to load tasks';
	@override String get noTasks => 'No tasks running';
}

// Path: trakt
class _TranslationsTraktVi extends TranslationsTraktEn {
	_TranslationsTraktVi._(TranslationsVi root) : this._root = root, super.internal(root);

	final TranslationsVi _root; // ignore: unused_field

	// Translations
	@override String get title => 'Trakt';
	@override String get connected => 'Connected';
	@override String connectedAs({required Object username}) => 'Connected as @${username}';
	@override String get disconnectConfirm => 'Disconnect Trakt account?';
	@override String get disconnectConfirmBody => 'Lumi will stop sending playback events to Trakt. You can reconnect at any time.';
	@override String get scrobble => 'Real-time scrobbling';
	@override String get scrobbleDescription => 'Send play, pause, and stop events to Trakt during playback.';
	@override String get watchedSync => 'Sync watched status';
	@override String get watchedSyncDescription => 'When you mark items watched in Lumi, mark them on Trakt.';
}

// Path: trackers
class _TranslationsTrackersVi extends TranslationsTrackersEn {
	_TranslationsTrackersVi._(TranslationsVi root) : this._root = root, super.internal(root);

	final TranslationsVi _root; // ignore: unused_field

	// Translations
	@override String get title => 'Trackers';
	@override String get hubSubtitle => 'Keep your watch progress in sync with Trakt and other services.';
	@override String get notConnected => 'Not connected';
	@override String connectedAs({required Object username}) => 'Connected as @${username}';
	@override String get scrobble => 'Track progress automatically';
	@override String get scrobbleDescription => 'Update your list when you finish an episode or movie.';
	@override String disconnectConfirm({required Object service}) => 'Disconnect ${service}?';
	@override String disconnectConfirmBody({required Object service}) => 'Lumi will stop updating your ${service} list. You can reconnect at any time.';
	@override String connectFailed({required Object service}) => 'Couldn\'t connect to ${service}. Try again.';
	@override late final _TranslationsTrackersServicesVi services = _TranslationsTrackersServicesVi._(_root);
	@override late final _TranslationsTrackersDeviceCodeVi deviceCode = _TranslationsTrackersDeviceCodeVi._(_root);
	@override late final _TranslationsTrackersOauthProxyVi oauthProxy = _TranslationsTrackersOauthProxyVi._(_root);
	@override late final _TranslationsTrackersLibraryFilterVi libraryFilter = _TranslationsTrackersLibraryFilterVi._(_root);
}

// Path: addServer
class _TranslationsAddServerVi extends TranslationsAddServerEn {
	_TranslationsAddServerVi._(TranslationsVi root) : this._root = root, super.internal(root);

	final TranslationsVi _root; // ignore: unused_field

	// Translations
	@override String get addJellyfinTitle => 'Add Jellyfin server';
	@override String get jellyfinUrlIntro => 'Enter your Jellyfin server URL — e.g. `https://jellyfin.example.com`. You can sign in afterwards.';
	@override String get serverUrl => 'Server URL';
	@override String get findServer => 'Find server';
	@override String get username => 'Username';
	@override String get password => 'Password';
	@override String get signIn => 'Sign in';
	@override String get change => 'Change';
	@override String get required => 'Required';
	@override String couldNotReachServer({required Object error}) => 'Could not reach the server: ${error}';
	@override String signInFailed({required Object error}) => 'Sign-in failed: ${error}';
	@override String quickConnectFailed({required Object error}) => 'Quick Connect failed: ${error}';
	@override String get addPlexTitle => 'Sign in with Plex';
	@override String get plexAuthIntro => 'Choose how to sign in to Plex. The browser flow opens plex.tv where you confirm the connection; the QR option is handy for TV / remote devices.';
	@override String get plexQRPrompt => 'Scan this QR code to sign in.';
	@override String get waitingForPlexConfirmation => 'Waiting for plex.tv to confirm your sign-in…';
	@override String get pinExpired => 'PIN expired before sign-in. Please try again.';
	@override String get duplicatePlexAccount => 'This device is already signed in to a Plex account. Sign out from settings to switch accounts.';
	@override String failedToRegisterAccount({required Object error}) => 'Failed to register account: ${error}';
	@override String get enterJellyfinUrlError => 'Enter your Jellyfin server URL';
	@override String get addConnectionTitle => 'Add connection';
	@override String addConnectionTitleScoped({required Object name}) => 'Add to ${name}';
	@override String get addConnectionIntroGlobal => 'Add another media server. You can mix Plex accounts and Jellyfin servers — items from every connected backend appear together on the home screen.';
	@override String get addConnectionIntroScoped => 'Add a new server, or borrow one from another profile.';
	@override String get signInWithPlexCard => 'Sign in with Plex';
	@override String get signInWithPlexCardSubtitle => 'Authorize this device against your Plex account. Servers shared with the account come along automatically.';
	@override String get signInWithPlexCardSubtitleScoped => 'Authorize a new Plex account. Its Home users appear as profiles.';
	@override String get connectToJellyfinCard => 'Connect to Jellyfin';
	@override String get connectToJellyfinCardSubtitle => 'Enter your Jellyfin server URL and sign in with username + password (Quick Connect coming soon).';
	@override String connectToJellyfinCardSubtitleScoped({required Object name}) => 'Sign in to a Jellyfin server. Binds to ${name}.';
	@override String get borrowFromAnotherProfile => 'Borrow from another profile';
	@override String get borrowFromAnotherProfileSubtitle => 'Reuse a connection that\'s already attached to a different profile. PIN-protected source profiles ask for the PIN.';
}

// Path: languages
class _TranslationsLanguagesVi extends TranslationsLanguagesEn {
	_TranslationsLanguagesVi._(TranslationsVi root) : this._root = root, super.internal(root);

	final TranslationsVi _root; // ignore: unused_field

	// Translations
	@override String get aa => 'Afar';
	@override String get ab => 'Abkhaz';
	@override String get ae => 'Avestan';
	@override String get af => 'Afrikaans';
	@override String get ak => 'Akan';
	@override String get am => 'Amharic';
	@override String get an => 'Aragonese';
	@override String get ar => 'Tiếng Ả Rập';
	@override String get as => 'Assamese';
	@override String get av => 'Avaric';
	@override String get ay => 'Aymara';
	@override String get az => 'Azerbaijani';
	@override String get ba => 'Bashkir';
	@override String get be => 'Belarusian';
	@override String get bg => 'Bulgarian';
	@override String get bh => 'Bihari';
	@override String get bi => 'Bislama';
	@override String get bm => 'Bambara';
	@override String get bn => 'Tiếng Bengal';
	@override String get bo => 'Tibetan Standard, Tibetan, Central';
	@override String get br => 'Breton';
	@override String get bs => 'Bosnian';
	@override String get ca => 'Catalan';
	@override String get ce => 'Chechen';
	@override String get ch => 'Chamorro';
	@override String get co => 'Corsican';
	@override String get cr => 'Cree';
	@override String get cs => 'Tiếng Séc';
	@override String get cu => 'Old Church Slavonic, Church Slavonic, Old Bulgarian';
	@override String get cv => 'Chuvash';
	@override String get cy => 'Welsh';
	@override String get da => 'Tiếng Đan Mạch';
	@override String get de => 'Tiếng Đức';
	@override String get dv => 'Divehi, Dhivehi, Maldivian';
	@override String get dz => 'Dzongkha';
	@override String get ee => 'Ewe';
	@override String get el => 'Tiếng Hy Lạp';
	@override String get en => 'Tiếng Anh';
	@override String get eo => 'Esperanto';
	@override String get es => 'Tiếng Tây Ban Nha';
	@override String get et => 'Estonian';
	@override String get eu => 'Basque';
	@override String get fa => 'Tiếng Ba Tư';
	@override String get ff => 'Fula, Fulah, Pulaar, Pular';
	@override String get fi => 'Tiếng Phần Lan';
	@override String get fj => 'Fijian';
	@override String get fo => 'Faroese';
	@override String get fr => 'Tiếng Pháp';
	@override String get fy => 'Western Frisian';
	@override String get ga => 'Irish';
	@override String get gd => 'Scottish Gaelic, Gaelic';
	@override String get gl => 'Galician';
	@override String get gn => 'Guaraní';
	@override String get gu => 'Gujarati';
	@override String get gv => 'Manx';
	@override String get ha => 'Hausa';
	@override String get he => 'Tiếng Do Thái';
	@override String get hi => 'Tiếng Hindi';
	@override String get ho => 'Hiri Motu';
	@override String get hr => 'Croatian';
	@override String get ht => 'Haitian, Haitian Creole';
	@override String get hu => 'Tiếng Hungary';
	@override String get hy => 'Armenian';
	@override String get hz => 'Herero';
	@override String get ia => 'Interlingua';
	@override String get id => 'Tiếng Indonesia';
	@override String get ie => 'Interlingue';
	@override String get ig => 'Igbo';
	@override String get ii => 'Nuosu';
	@override String get ik => 'Inupiaq';
	@override String get io => 'Ido';
	@override String get kIs => 'Icelandic';
	@override String get it => 'Tiếng Ý';
	@override String get iu => 'Inuktitut';
	@override String get ja => 'Tiếng Nhật';
	@override String get jv => 'Javanese';
	@override String get ka => 'Georgian';
	@override String get kg => 'Kongo';
	@override String get ki => 'Kikuyu, Gikuyu';
	@override String get kj => 'Kwanyama, Kuanyama';
	@override String get kk => 'Kazakh';
	@override String get kl => 'Kalaallisut, Greenlandic';
	@override String get km => 'Khmer';
	@override String get kn => 'Kannada';
	@override String get ko => 'Tiếng Hàn';
	@override String get kr => 'Kanuri';
	@override String get ks => 'Kashmiri';
	@override String get ku => 'Kurdish';
	@override String get kv => 'Komi';
	@override String get kw => 'Cornish';
	@override String get ky => 'Kyrgyz';
	@override String get la => 'Latin';
	@override String get lb => 'Luxembourgish, Letzeburgesch';
	@override String get lg => 'Ganda';
	@override String get li => 'Limburgish, Limburgan, Limburger';
	@override String get ln => 'Lingala';
	@override String get lo => 'Lao';
	@override String get lt => 'Lithuanian';
	@override String get lu => 'Luba-Katanga';
	@override String get lv => 'Latvian';
	@override String get mg => 'Malagasy';
	@override String get mh => 'Marshallese';
	@override String get mi => 'Māori';
	@override String get mk => 'Macedonian';
	@override String get ml => 'Malayalam';
	@override String get mn => 'Mongolian';
	@override String get mr => 'Marathi (Marāṭhī)';
	@override String get ms => 'Malay';
	@override String get mt => 'Maltese';
	@override String get my => 'Burmese';
	@override String get na => 'Nauruan';
	@override String get nb => 'Norwegian Bokmål';
	@override String get nd => 'Northern Ndebele';
	@override String get ne => 'Nepali';
	@override String get ng => 'Ndonga';
	@override String get nl => 'Tiếng Hà Lan';
	@override String get nn => 'Norwegian Nynorsk';
	@override String get no => 'Tiếng Na Uy';
	@override String get nr => 'Southern Ndebele';
	@override String get nv => 'Navajo, Navaho';
	@override String get ny => 'Chichewa, Chewa, Nyanja';
	@override String get oc => 'Occitan';
	@override String get oj => 'Ojibwe, Ojibwa';
	@override String get om => 'Oromo';
	@override String get or => 'Oriya';
	@override String get os => 'Ossetian, Ossetic';
	@override String get pa => '(Eastern) Punjabi';
	@override String get pi => 'Pāli';
	@override String get pl => 'Tiếng Ba Lan';
	@override String get ps => 'Pashto, Pushto';
	@override String get pt => 'Tiếng Bồ Đào Nha';
	@override String get qu => 'Quechua';
	@override String get rm => 'Romansh';
	@override String get rn => 'Kirundi';
	@override String get ro => 'Tiếng Romania';
	@override String get ru => 'Tiếng Nga';
	@override String get rw => 'Kinyarwanda';
	@override String get sa => 'Sanskrit (Saṁskṛta)';
	@override String get sc => 'Sardinian';
	@override String get sd => 'Sindhi';
	@override String get se => 'Northern Sami';
	@override String get sg => 'Sango';
	@override String get si => 'Sinhalese, Sinhala';
	@override String get sk => 'Slovak';
	@override String get sl => 'Slovene';
	@override String get sm => 'Samoan';
	@override String get sn => 'Shona';
	@override String get so => 'Somali';
	@override String get sq => 'Albanian';
	@override String get sr => 'Serbian';
	@override String get ss => 'Swati';
	@override String get st => 'Southern Sotho';
	@override String get su => 'Sundanese';
	@override String get sv => 'Tiếng Thụy Điển';
	@override String get sw => 'Swahili';
	@override String get ta => 'Tamil';
	@override String get te => 'Telugu';
	@override String get tg => 'Tajik';
	@override String get th => 'Tiếng Thái';
	@override String get ti => 'Tigrinya';
	@override String get tk => 'Turkmen';
	@override String get tl => 'Tagalog';
	@override String get tn => 'Tswana';
	@override String get to => 'Tonga (Tonga Islands)';
	@override String get tr => 'Tiếng Thổ Nhĩ Kỳ';
	@override String get ts => 'Tsonga';
	@override String get tt => 'Tatar';
	@override String get tw => 'Twi';
	@override String get ty => 'Tahitian';
	@override String get ug => 'Uyghur';
	@override String get uk => 'Tiếng Ukraina';
	@override String get ur => 'Urdu';
	@override String get uz => 'Uzbek';
	@override String get ve => 'Venda';
	@override String get vi => 'Tiếng Việt';
	@override String get vo => 'Volapük';
	@override String get wa => 'Walloon';
	@override String get wo => 'Wolof';
	@override String get xh => 'Xhosa';
	@override String get yi => 'Yiddish';
	@override String get yo => 'Yoruba';
	@override String get za => 'Zhuang, Chuang';
	@override String get zh => 'Tiếng Trung';
	@override String get zu => 'Zulu';
	@override String get unknown => 'Không xác định';
}

// Path: hotkeys.actions
class _TranslationsHotkeysActionsVi extends TranslationsHotkeysActionsEn {
	_TranslationsHotkeysActionsVi._(TranslationsVi root) : this._root = root, super.internal(root);

	final TranslationsVi _root; // ignore: unused_field

	// Translations
	@override String get playPause => 'Play/Pause';
	@override String get volumeUp => 'Volume Up';
	@override String get volumeDown => 'Volume Down';
	@override String seekForward({required Object seconds}) => 'Seek Forward (${seconds}s)';
	@override String seekBackward({required Object seconds}) => 'Seek Backward (${seconds}s)';
	@override String get fullscreenToggle => 'Toggle Fullscreen';
	@override String get muteToggle => 'Toggle Mute';
	@override String get subtitleToggle => 'Toggle Subtitles';
	@override String get audioTrackNext => 'Next Audio Track';
	@override String get subtitleTrackNext => 'Next Subtitle Track';
	@override String get chapterNext => 'Next Chapter';
	@override String get chapterPrevious => 'Previous Chapter';
	@override String get episodeNext => 'Next Episode';
	@override String get episodePrevious => 'Previous Episode';
	@override String get speedIncrease => 'Increase Speed';
	@override String get speedDecrease => 'Decrease Speed';
	@override String get speedReset => 'Reset Speed';
	@override String get subSeekNext => 'Seek to Next Subtitle';
	@override String get subSeekPrev => 'Seek to Previous Subtitle';
	@override String get shaderToggle => 'Toggle Shaders';
	@override String get skipMarker => 'Skip Intro/Credits';
}

// Path: videoControls.pipErrors
class _TranslationsVideoControlsPipErrorsVi extends TranslationsVideoControlsPipErrorsEn {
	_TranslationsVideoControlsPipErrorsVi._(TranslationsVi root) : this._root = root, super.internal(root);

	final TranslationsVi _root; // ignore: unused_field

	// Translations
	@override String get androidVersion => 'Requires Android 8.0 or newer';
	@override String get iosVersion => 'Requires iOS 15.0 or newer';
	@override String get permissionDisabled => 'Picture-in-picture permission is disabled. Enable it in Settings > Apps > Lumi > Picture-in-picture';
	@override String get notSupported => 'Device doesn\'t support picture-in-picture mode';
	@override String get voSwitchFailed => 'Failed to switch video output for picture-in-picture';
	@override String get failed => 'Picture-in-picture failed to start';
	@override String unknown({required Object error}) => 'An error occurred: ${error}';
}

// Path: libraries.tabs
class _TranslationsLibrariesTabsVi extends TranslationsLibrariesTabsEn {
	_TranslationsLibrariesTabsVi._(TranslationsVi root) : this._root = root, super.internal(root);

	final TranslationsVi _root; // ignore: unused_field

	// Translations
	@override String get recommended => 'Recommended';
	@override String get browse => 'Tất cả';
	@override String get collections => 'Bộ sưu tập';
	@override String get playlists => 'Danh sách';
}

// Path: libraries.groupings
class _TranslationsLibrariesGroupingsVi extends TranslationsLibrariesGroupingsEn {
	_TranslationsLibrariesGroupingsVi._(TranslationsVi root) : this._root = root, super.internal(root);

	final TranslationsVi _root; // ignore: unused_field

	// Translations
	@override String get title => 'Grouping';
	@override String get all => 'All';
	@override String get movies => 'Phim';
	@override String get shows => 'Phim bộ';
	@override String get seasons => 'Phần';
	@override String get episodes => 'Các tập phim';
	@override String get folders => 'Folders';
}

// Path: libraries.filterCategories
class _TranslationsLibrariesFilterCategoriesVi extends TranslationsLibrariesFilterCategoriesEn {
	_TranslationsLibrariesFilterCategoriesVi._(TranslationsVi root) : this._root = root, super.internal(root);

	final TranslationsVi _root; // ignore: unused_field

	// Translations
	@override String get genre => 'Thể loại';
	@override String get year => 'Năm phát hành';
	@override String get contentRating => 'Phân loại nội dung';
	@override String get tag => 'Thẻ';
	@override String get unwatched => 'Chưa xem';
	@override String get unwatchedOnly => 'Chỉ chưa xem';
	@override String get unwatchedShows => 'Chưa xem';
	@override String get unwatchedEpisodes => 'Tập chưa xem';
	@override String get unplayed => 'Chưa xem';
	@override String get show_unwatched => 'Phim chưa xem';
	@override String get episode_unwatched => 'Tập chưa xem';
	@override String get show_unplayed => 'Phim chưa xem';
	@override String get episode_unplayed => 'Tập chưa xem';
	@override String get shows_unwatched => 'Phim chưa xem';
	@override String get episodes_unwatched => 'Tập chưa xem';
	@override String get inProgress => 'Đang xem';
	@override String get audioLanguage => 'Ngôn ngữ âm thanh';
	@override String get subtitleLanguage => 'Ngôn ngữ phụ đề';
	@override String get decade => 'Thập niên';
	@override String get actor => 'Diễn viên';
	@override String get director => 'Đạo diễn';
	@override String get writer => 'Biên kịch';
	@override String get producer => 'Nhà sản xuất';
	@override String get country => 'Quốc gia';
	@override String get network => 'Nhà đài';
}

// Path: libraries.sortLabels
class _TranslationsLibrariesSortLabelsVi extends TranslationsLibrariesSortLabelsEn {
	_TranslationsLibrariesSortLabelsVi._(TranslationsVi root) : this._root = root, super.internal(root);

	final TranslationsVi _root; // ignore: unused_field

	// Translations
	@override String get title => 'Tên phim';
	@override String get dateAdded => 'Ngày cập nhật';
	@override String get releaseDate => 'Ngày phát hành';
	@override String get rating => 'Điểm đánh giá';
	@override String get lastPlayed => 'Xem gần đây';
	@override String get playCount => 'Lượt xem';
	@override String get random => 'Ngẫu nhiên';
	@override String get dateShared => 'Ngày chia sẻ';
	@override String get latestEpisodeAirDate => 'Ngày phát sóng tập mới nhất';
	@override String get latestEpisodeAddedDate => 'Ngày thêm tập mới nhất';
}

// Path: companionRemote.session
class _TranslationsCompanionRemoteSessionVi extends TranslationsCompanionRemoteSessionEn {
	_TranslationsCompanionRemoteSessionVi._(TranslationsVi root) : this._root = root, super.internal(root);

	final TranslationsVi _root; // ignore: unused_field

	// Translations
	@override String get startingServer => 'Starting remote server...';
	@override String get failedToCreate => 'Failed to start remote server:';
	@override String get hostAddress => 'Host Address';
	@override String get connected => 'Connected';
	@override String get serverRunning => 'Remote server active';
	@override String get serverStopped => 'Remote server stopped';
	@override String get serverRunningDescription => 'Mobile devices on your network can discover and connect to this app';
	@override String get serverStoppedDescription => 'Start the server to allow mobile devices to connect';
	@override String get usePhoneToControl => 'Use your mobile device to control this app';
	@override String get startServer => 'Start Server';
	@override String get stopServer => 'Stop Server';
	@override String get minimize => 'Minimize';
}

// Path: companionRemote.pairing
class _TranslationsCompanionRemotePairingVi extends TranslationsCompanionRemotePairingEn {
	_TranslationsCompanionRemotePairingVi._(TranslationsVi root) : this._root = root, super.internal(root);

	final TranslationsVi _root; // ignore: unused_field

	// Translations
	@override String get discoveryDescription => 'Devices on your network running Lumi with the same Plex account will appear automatically';
	@override String get hostAddressHint => '192.168.1.100:48632';
	@override String get connecting => 'Connecting...';
	@override String get searchingForDevices => 'Looking for devices...';
	@override String get noDevicesFound => 'No devices found on your network';
	@override String get noDevicesHint => 'Make sure Lumi is open on your desktop and both devices are on the same WiFi network';
	@override String get availableDevices => 'Available Devices';
	@override String get manualConnection => 'Manual Connection';
	@override String get cryptoInitFailed => 'Could not initialize secure connection. Make sure you are signed in to a Plex account.';
	@override String get validationHostRequired => 'Please enter host address';
	@override String get validationHostFormat => 'Format must be IP:port (e.g., 192.168.1.100:48632)';
	@override String get connectionTimedOut => 'Connection timed out. Make sure both devices are on the same network.';
	@override String get sessionNotFound => 'Could not find the device. Make sure Lumi is running on the host.';
	@override String get authFailed => 'Authentication failed. Make sure both devices are on the same Plex account.';
	@override String failedToConnect({required Object error}) => 'Failed to connect: ${error}';
}

// Path: companionRemote.remote
class _TranslationsCompanionRemoteRemoteVi extends TranslationsCompanionRemoteRemoteEn {
	_TranslationsCompanionRemoteRemoteVi._(TranslationsVi root) : this._root = root, super.internal(root);

	final TranslationsVi _root; // ignore: unused_field

	// Translations
	@override String get disconnectConfirm => 'Do you want to disconnect from the remote session?';
	@override String get reconnecting => 'Reconnecting...';
	@override String attemptOf({required Object current}) => 'Attempt ${current} of 5';
	@override String get retryNow => 'Retry Now';
	@override String get tabRemote => 'Remote';
	@override String get tabPlay => 'Play';
	@override String get tabMore => 'More';
	@override String get menu => 'Menu';
	@override String get tabNavigation => 'Tab Navigation';
	@override String get tabDiscover => 'Discover';
	@override String get tabLibraries => 'Libraries';
	@override String get tabSearch => 'Search';
	@override String get tabDownloads => 'Downloads';
	@override String get tabSettings => 'Cài đặt';
	@override String get previous => 'Previous';
	@override String get playPause => 'Play/Pause';
	@override String get next => 'Next';
	@override String get seekBack => 'Seek Back';
	@override String get stop => 'Stop';
	@override String get seekForward => 'Seek Fwd';
	@override String get volume => 'Volume';
	@override String get volumeDown => 'Down';
	@override String get volumeUp => 'Up';
	@override String get fullscreen => 'Fullscreen';
	@override String get subtitles => 'Subtitles';
	@override String get audio => 'Audio';
	@override String get searchHint => 'Search on desktop...';
}

// Path: trackers.services
class _TranslationsTrackersServicesVi extends TranslationsTrackersServicesEn {
	_TranslationsTrackersServicesVi._(TranslationsVi root) : this._root = root, super.internal(root);

	final TranslationsVi _root; // ignore: unused_field

	// Translations
	@override String get mal => 'MyAnimeList';
	@override String get anilist => 'AniList';
	@override String get simkl => 'Simkl';
}

// Path: trackers.deviceCode
class _TranslationsTrackersDeviceCodeVi extends TranslationsTrackersDeviceCodeEn {
	_TranslationsTrackersDeviceCodeVi._(TranslationsVi root) : this._root = root, super.internal(root);

	final TranslationsVi _root; // ignore: unused_field

	// Translations
	@override String title({required Object service}) => 'Activate Lumi on ${service}';
	@override String body({required Object url}) => 'Visit ${url} and enter this code:';
	@override String openToActivate({required Object service}) => 'Open ${service} to activate';
	@override String get waitingForAuthorization => 'Waiting for authorization…';
	@override String get codeCopied => 'Code copied';
}

// Path: trackers.oauthProxy
class _TranslationsTrackersOauthProxyVi extends TranslationsTrackersOauthProxyEn {
	_TranslationsTrackersOauthProxyVi._(TranslationsVi root) : this._root = root, super.internal(root);

	final TranslationsVi _root; // ignore: unused_field

	// Translations
	@override String title({required Object service}) => 'Sign in to ${service}';
	@override String get body => 'Scan this QR code with your phone, or open the URL below on any device with a browser.';
	@override String openToSignIn({required Object service}) => 'Open ${service} to sign in';
	@override String get urlCopied => 'URL copied';
}

// Path: trackers.libraryFilter
class _TranslationsTrackersLibraryFilterVi extends TranslationsTrackersLibraryFilterEn {
	_TranslationsTrackersLibraryFilterVi._(TranslationsVi root) : this._root = root, super.internal(root);

	final TranslationsVi _root; // ignore: unused_field

	// Translations
	@override String get title => 'Library filter';
	@override String get subtitleAllSyncing => 'Syncing all libraries';
	@override String get subtitleNoneSyncing => 'Nothing syncing';
	@override String subtitleBlocked({required Object count}) => '${count} blocked';
	@override String subtitleAllowed({required Object count}) => '${count} allowed';
	@override String get mode => 'Filter mode';
	@override String get modeBlacklist => 'Blacklist';
	@override String get modeWhitelist => 'Whitelist';
	@override String get modeHintBlacklist => 'Sync every library except the ones checked below.';
	@override String get modeHintWhitelist => 'Sync only the libraries checked below.';
	@override String get libraries => 'Libraries';
	@override String get noLibraries => 'No libraries available';
}

/// The flat map containing all translations for locale <vi>.
/// Only for edge cases! For simple maps, use the map function of this library.
///
/// The Dart AOT compiler has issues with very large switch statements,
/// so the map is split into smaller functions (512 entries each).
extension on TranslationsVi {
	dynamic _flatMapFunction(String path) {
		return switch (path) {
			'app.title' => 'Lumi',
			'app.tagline' => 'App coi phim dỏm nhất Việt Nam',
			'auth.signIn' => 'Sign in',
			'auth.signInWithPlex' => 'Đăng nhập tài khoản Plex',
			'auth.showQRCode' => 'Quét mã QR',
			'auth.authenticate' => 'Authenticate',
			'auth.authenticationTimeout' => 'Phiên xác thực đã quá hạn. Hãy thử lại.',
			'auth.scanQRToSignIn' => 'Quét mã QR này để đăng nhập',
			'auth.waitingForAuth' => 'Đang xác thực...\nHãy thực hiện đăng nhập qua trang web.',
			'auth.useBrowser' => 'Use browser',
			'auth.or' => 'or',
			'auth.connectToJellyfin' => 'Connect to Jellyfin',
			'auth.useQuickConnect' => 'Use Quick Connect',
			'auth.quickConnectCode' => 'Quick Connect code',
			'auth.quickConnectInstructions' => 'Open your Jellyfin server in a web browser, sign in, and choose Quick Connect from the user menu. Enter this code to approve sign-in.',
			'auth.quickConnectWaiting' => 'Waiting for approval…',
			'auth.quickConnectCancel' => 'Hủy',
			'auth.quickConnectExpired' => 'Quick Connect code expired before approval. Please try again.',
			'common.cancel' => 'Hủy',
			'common.save' => 'Save',
			'common.ok' => 'OK',
			'common.close' => 'Close',
			'common.clear' => 'Thiết lập lại',
			'common.reset' => 'Reset',
			'common.later' => 'Later',
			'common.submit' => 'Xác nhận',
			'common.confirm' => 'Confirm',
			'common.retry' => 'Thử lại',
			'common.logout' => 'Đăng xuất',
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
			'common.search' => 'Tìm kiếm',
			'common.home' => 'Trang chủ',
			'common.back' => 'Back',
			'common.settings' => 'Cài đặt',
			'common.mute' => 'Mute',
			'common.reconnect' => 'Reconnect',
			'common.exit' => 'Exit',
			'common.viewAll' => 'View All',
			'common.checkingNetwork' => 'Kiểm tra tín hiệu mạng...',
			'common.refreshingServers' => 'Refreshing servers...',
			'common.loadingServers' => 'Loading servers...',
			'common.connectingToServers' => 'Kiểm tra tín hiệu máy chủ...',
			'common.startingOfflineMode' => 'Starting offline mode...',
			'common.loading' => 'Loading...',
			'common.fullscreen' => 'Fullscreen',
			'common.exitFullscreen' => 'Exit fullscreen',
			'common.pressBackAgainToExit' => 'Press back again to exit',
			'common.done' => 'Hoàn tất',
			'screens.licenses' => 'Licenses',
			'screens.switchProfile' => 'Chọn hồ sơ',
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
			'mediaDetail.watchNow' => 'Xem phim',
			'mediaDetail.addToPlaylist' => 'Thêm danh sách',
			'mediaDetail.plot' => 'Nội dung',
			'mediaDetail.season' => 'Phần',
			'mediaDetail.episodes' => 'Các tập phim',
			'mediaDetail.episode' => 'Tập',
			'mediaDetail.episodesListHeader' => 'Danh sách tập phim',
			'mediaDetail.seasonsColumn' => 'Các phần phim',
			'settings.title' => 'Cài đặt',
			'settings.supportDeveloper' => 'Support Lumi',
			'settings.supportDeveloperDescription' => 'Donate via Liberapay to fund development',
			'settings.language' => 'Ngôn ngữ',
			'settings.theme' => 'Giao diện',
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
			'settings.systemTheme' => 'Mặc định hệ thống',
			'settings.lightTheme' => 'Sáng',
			'settings.darkTheme' => 'Tối',
			'settings.oledTheme' => 'Siêu tối',
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
			'settings.playerBackend' => 'Chương trình xem phim',
			'settings.audioLanguage' => 'Ngôn ngữ âm thanh',
			'settings.none' => 'Không có',
			'settings.exoPlayer' => 'Nâng cao (Khuyên dùng)',
			'settings.mpv' => 'Tiêu chuẩn',
			'settings.hardwareDecoding' => 'Hardware Decoding',
			'settings.hardwareDecodingDescription' => 'Use hardware acceleration when available',
			'settings.bufferSize' => 'Buffer Size',
			'settings.bufferSizeMB' => ({required Object size}) => '${size}MB',
			'settings.bufferSizeAuto' => 'Auto (Recommended)',
			'settings.bufferSizeWarning' => ({required Object heap, required Object size}) => 'Your device has ${heap}MB of memory. A ${size}MB buffer may cause playback issues.',
			'settings.defaultQualityTitle' => 'Chất lượng hình ảnh',
			'settings.defaultQualityDescription' => 'Used when starting playback. Lower values reduce bandwidth.',
			'settings.switchServer' => 'Chọn máy chủ',
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
			'settings.watchTogetherRelay' => 'Watch Together Relay',
			'settings.watchTogetherRelayDescription' => 'Set a custom relay server for Watch Together. All participants must use the same server.',
			'settings.watchTogetherRelayHint' => 'https://my-relay.example.com',
			'settings.crashReporting' => 'Crash Reporting',
			'settings.crashReportingDescription' => 'Send crash reports to help improve the app',
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
			'settings.trakt' => 'Trakt',
			'settings.traktDescription' => 'Sync watch history with Trakt',
			'settings.trackers' => 'Trackers',
			'settings.trackersDescription' => 'Sync progress to Trakt, MyAnimeList, AniList, and Simkl',
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
			'search.hint' => 'Tên của phim cần tìm kiếm...',
			'search.tryDifferentTerm' => 'Thử lại với từ khóa khác',
			'search.searchYourMedia' => 'Tìm kiếm phim',
			'search.enterTitleActorOrKeyword' => 'Gõ từ khóa vào khung tìm kiếm',
			'search.otherResults' => 'Kết quả khác',
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
			'fileInfo.subtitles' => 'Phụ đề',
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
			'videoControls.audioLabel' => 'Âm thanh',
			'videoControls.subtitlesLabel' => 'Phụ đề',
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
			'videoControls.autoPlayNext' => 'Tự động chuyển phim tiếp theo',
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
			'videoControls.qualityColumnHeader' => 'Chất lượng hình ảnh',
			'videoControls.qualityOriginal' => 'Cao nhất',
			'videoControls.qualityPresetLabel' => ({required Object resolution, required Object bitrate}) => '${resolution}p ${bitrate} Mbps',
			'videoControls.qualityBandwidthEstimate' => ({required Object bitrate}) => '~${bitrate} Mbps',
			'videoControls.transcodeUnavailableFallback' => 'Transcoding unavailable — playing original quality',
			'videoControls.pipButton' => 'Picture-in-Picture mode',
			'videoControls.aspectRatioButton' => 'Aspect ratio',
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
			'messages.noEpisodesFound' => 'Không tìm thấy tập nào trong phần đầu tiên',
			'messages.noEpisodesFoundGeneral' => 'Không tìm thấy tập nào',
			'messages.noResultsFound' => 'Không tìm thấy kết quả',
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
			'profiles.addLumiProfile' => 'Thêm hồ sơ',
			'profiles.switchingProfile' => 'Tải hồ sơ…',
			'profiles.deleteThisProfileTitle' => 'Delete this profile?',
			'profiles.deleteThisProfileMessage' => ({required Object displayName}) => '${displayName} will be removed. Connections themselves are not affected.',
			'profiles.active' => 'Đang sử dụng',
			'profiles.manage' => 'Manage',
			'profiles.delete' => 'Delete',
			'profiles.signOut' => 'Đăng xuất',
			'profiles.signOutPlexTitle' => 'Sign out of Plex?',
			'profiles.signOutPlexMessage' => ({required Object displayName}) => '${displayName} and every Plex Home user on this account will be removed from this device. You can sign back in any time.',
			'profiles.signedOutPlex' => 'Signed out of Plex.',
			'profiles.signOutFailed' => 'Sign out failed.',
			'profiles.sectionTitle' => 'Chọn hồ sơ',
			'profiles.summarySingle' => 'Lựa chọn hồ sơ xem phim mặc định',
			'profiles.summaryMultipleWithActive' => ({required Object count, required Object activeName}) => '${count} profiles · active: ${activeName}',
			_ => null,
		} ?? switch (path) {
			'profiles.summaryMultiple' => ({required Object count}) => '${count} profiles',
			'profiles.removeConnectionTitle' => 'Remove connection?',
			'profiles.removeConnectionMessage' => ({required Object displayName, required Object connectionLabel}) => '${displayName} will lose access to ${connectionLabel}. The connection itself stays available to other profiles.',
			'profiles.deleteProfileTitle' => 'Delete profile?',
			'profiles.deleteProfileMessage' => ({required Object displayName}) => 'This removes ${displayName} and all its connections from this device. The underlying Plex/Jellyfin servers aren\'t affected.',
			'profiles.profileNameLabel' => 'Profile name',
			'profiles.pinProtectionLabel' => 'PIN protection',
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
			'discover.continueWatching' => 'Phim Đang Xem',
			'discover.continueWatchingIn' => ({required Object library}) => 'Continue Watching in ${library}',
			'discover.nextUp' => 'Next Up',
			'discover.nextUpIn' => ({required Object library}) => 'Next Up in ${library}',
			'discover.recentlyAdded' => 'Recently Added',
			'discover.recentlyAddedIn' => ({required Object library}) => 'Recently Added in ${library}',
			'discover.playEpisode' => ({required Object season, required Object episode}) => 'Phần ${season} Tập ${episode}',
			'discover.overview' => 'Overview',
			'discover.cast' => 'Diễn viên',
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
			'errors.failedToSwitchProfile' => ({required Object displayName}) => '${displayName} đăng nhập thất bại',
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
			'libraries.all' => 'Tất cả',
			'libraries.clearAll' => 'Clear All',
			'libraries.scanLibraryConfirm' => ({required Object title}) => 'Are you sure you want to scan "${title}"?',
			'libraries.analyzeLibraryConfirm' => ({required Object title}) => 'Are you sure you want to analyze "${title}"?',
			'libraries.refreshMetadataConfirm' => ({required Object title}) => 'Are you sure you want to refresh metadata for "${title}"?',
			'libraries.emptyTrashConfirm' => ({required Object title}) => 'Are you sure you want to empty trash for "${title}"?',
			'libraries.manageLibraries' => 'Manage Libraries',
			'libraries.sort' => 'Sort',
			'libraries.sortBy' => 'Sắp xếp',
			'libraries.filters' => 'Lọc phim',
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
			'libraries.tabs.browse' => 'Tất cả',
			'libraries.tabs.collections' => 'Bộ sưu tập',
			'libraries.tabs.playlists' => 'Danh sách',
			'libraries.groupings.title' => 'Grouping',
			'libraries.groupings.all' => 'All',
			'libraries.groupings.movies' => 'Phim',
			'libraries.groupings.shows' => 'Phim bộ',
			'libraries.groupings.seasons' => 'Phần',
			'libraries.groupings.episodes' => 'Các tập phim',
			'libraries.groupings.folders' => 'Folders',
			'libraries.filterCategories.genre' => 'Thể loại',
			'libraries.filterCategories.year' => 'Năm phát hành',
			'libraries.filterCategories.contentRating' => 'Phân loại nội dung',
			'libraries.filterCategories.tag' => 'Thẻ',
			'libraries.filterCategories.unwatched' => 'Chưa xem',
			'libraries.filterCategories.unwatchedOnly' => 'Chỉ chưa xem',
			'libraries.filterCategories.unwatchedShows' => 'Chưa xem',
			'libraries.filterCategories.unwatchedEpisodes' => 'Tập chưa xem',
			'libraries.filterCategories.unplayed' => 'Chưa xem',
			'libraries.filterCategories.show_unwatched' => 'Phim chưa xem',
			'libraries.filterCategories.episode_unwatched' => 'Tập chưa xem',
			'libraries.filterCategories.show_unplayed' => 'Phim chưa xem',
			'libraries.filterCategories.episode_unplayed' => 'Tập chưa xem',
			'libraries.filterCategories.shows_unwatched' => 'Phim chưa xem',
			'libraries.filterCategories.episodes_unwatched' => 'Tập chưa xem',
			'libraries.filterCategories.inProgress' => 'Đang xem',
			'libraries.filterCategories.audioLanguage' => 'Ngôn ngữ âm thanh',
			'libraries.filterCategories.subtitleLanguage' => 'Ngôn ngữ phụ đề',
			'libraries.filterCategories.decade' => 'Thập niên',
			'libraries.filterCategories.actor' => 'Diễn viên',
			'libraries.filterCategories.director' => 'Đạo diễn',
			'libraries.filterCategories.writer' => 'Biên kịch',
			'libraries.filterCategories.producer' => 'Nhà sản xuất',
			'libraries.filterCategories.country' => 'Quốc gia',
			'libraries.filterCategories.network' => 'Nhà đài',
			'libraries.sortLabels.title' => 'Tên phim',
			'libraries.sortLabels.dateAdded' => 'Ngày cập nhật',
			'libraries.sortLabels.releaseDate' => 'Ngày phát hành',
			'libraries.sortLabels.rating' => 'Điểm đánh giá',
			'libraries.sortLabels.lastPlayed' => 'Xem gần đây',
			'libraries.sortLabels.playCount' => 'Lượt xem',
			'libraries.sortLabels.random' => 'Ngẫu nhiên',
			'libraries.sortLabels.dateShared' => 'Ngày chia sẻ',
			'libraries.sortLabels.latestEpisodeAirDate' => 'Ngày phát sóng tập mới nhất',
			'libraries.sortLabels.latestEpisodeAddedDate' => 'Ngày thêm tập mới nhất',
			'about.title' => 'About',
			'about.openSourceLicenses' => 'Open Source Licenses',
			'about.versionLabel' => ({required Object version}) => 'Version ${version}',
			'about.appDescription' => 'A beautiful Plex and Jellyfin client for Flutter',
			'about.viewLicensesDescription' => 'View licenses of third-party libraries',
			'serverSelection.allServerConnectionsFailed' => 'Failed to connect to any servers. Please check your network and try again.',
			'serverSelection.noServersFoundForAccount' => ({required Object username, required Object email}) => 'No servers found for ${username} (${email})',
			'serverSelection.failedToLoadServers' => ({required Object error}) => 'Failed to load servers: ${error}',
			'serverSelection.selectServer' => 'Chọn máy chủ',
			'serverSelection.selectServerDescription' => 'Chọn máy chủ kho phim mặc định',
			'serverSelection.noServersAvailable' => 'No servers available',
			'serverSelection.online' => 'Đang hoạt động',
			'serverSelection.offline' => 'Mất tín hiệu',
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
			'navigation.movies' => 'Phim lẻ',
			'navigation.shows' => 'Phim bộ',
			'navigation.liveTv' => 'Live TV',
			'navigation.collections' => 'Bộ sưu tập',
			'navigation.playlists' => 'Danh sách',
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
			'playlists.noPlaylists' => 'Chưa có danh sách',
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
			'watchTogether.title' => 'Watch Together',
			'watchTogether.description' => 'Watch content in sync with friends and family',
			'watchTogether.createSession' => 'Create Session',
			'watchTogether.creating' => 'Creating...',
			'watchTogether.joinSession' => 'Join Session',
			'watchTogether.joining' => 'Joining...',
			'watchTogether.controlMode' => 'Control Mode',
			'watchTogether.controlModeQuestion' => 'Who can control playback?',
			'watchTogether.hostOnly' => 'Host Only',
			'watchTogether.anyone' => 'Anyone',
			'watchTogether.hostingSession' => 'Hosting Session',
			'watchTogether.inSession' => 'In Session',
			'watchTogether.sessionCode' => 'Session Code',
			'watchTogether.hostControlsPlayback' => 'Host controls playback',
			'watchTogether.anyoneCanControl' => 'Anyone can control playback',
			'watchTogether.hostControls' => 'Host controls',
			'watchTogether.anyoneControls' => 'Anyone controls',
			'watchTogether.participants' => 'Participants',
			'watchTogether.host' => 'Host',
			'watchTogether.hostBadge' => 'HOST',
			'watchTogether.youAreHost' => 'You are the host',
			'watchTogether.watchingWithOthers' => 'Watching with others',
			'watchTogether.endSession' => 'End Session',
			'watchTogether.leaveSession' => 'Leave Session',
			'watchTogether.endSessionQuestion' => 'End Session?',
			'watchTogether.leaveSessionQuestion' => 'Leave Session?',
			'watchTogether.endSessionConfirm' => 'This will end the session for all participants.',
			'watchTogether.leaveSessionConfirm' => 'You will be removed from the session.',
			'watchTogether.endSessionConfirmOverlay' => 'This will end the watch session for all participants.',
			'watchTogether.leaveSessionConfirmOverlay' => 'You will be disconnected from the watch session.',
			'watchTogether.end' => 'End',
			'watchTogether.leave' => 'Leave',
			'watchTogether.syncing' => 'Syncing...',
			'watchTogether.joinWatchSession' => 'Join Watch Session',
			'watchTogether.enterCodeHint' => 'Enter 5-character code',
			'watchTogether.pasteFromClipboard' => 'Paste from clipboard',
			'watchTogether.pleaseEnterCode' => 'Please enter a session code',
			'watchTogether.codeMustBe5Chars' => 'Session code must be 5 characters',
			'watchTogether.joinInstructions' => 'Enter the session code shared by the host to join their watch session.',
			'watchTogether.failedToCreate' => 'Failed to create session',
			'watchTogether.failedToJoin' => 'Failed to join session',
			'watchTogether.sessionCodeCopied' => 'Session code copied to clipboard',
			'watchTogether.relayUnreachable' => 'The relay server is unreachable. This may be caused by your ISP blocking the connection. You can still try, but Watch Together may not work.',
			'watchTogether.reconnectingToHost' => 'Reconnecting to host...',
			'watchTogether.currentPlayback' => 'Current Playback',
			'watchTogether.joinCurrentPlayback' => 'Join Current Playback',
			'watchTogether.joinCurrentPlaybackDescription' => 'Jump back into what the host is currently watching',
			'watchTogether.failedToOpenCurrentPlayback' => 'Failed to open current playback',
			'watchTogether.participantJoined' => ({required Object name}) => '${name} joined',
			'watchTogether.participantLeft' => ({required Object name}) => '${name} left',
			'watchTogether.participantPaused' => ({required Object name}) => '${name} paused',
			'watchTogether.participantResumed' => ({required Object name}) => '${name} resumed',
			'watchTogether.participantSeeked' => ({required Object name}) => '${name} seeked',
			'watchTogether.participantBuffering' => ({required Object name}) => '${name} is buffering',
			'watchTogether.waitingForParticipants' => 'Waiting for others to load...',
			'watchTogether.recentRooms' => 'Recent Rooms',
			'watchTogether.renameRoom' => 'Rename Room',
			'watchTogether.removeRoom' => 'Remove',
			'watchTogether.guestSwitchUnavailable' => 'Couldn\'t switch — server unavailable for sync',
			'watchTogether.guestSwitchFailed' => 'Couldn\'t switch — content not found on this server',
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
			'companionRemote.remote.tabSettings' => 'Cài đặt',
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
			'videoSettings.playbackSettings' => 'Cấu hình',
			'videoSettings.playbackSpeed' => 'Tốc độ phát',
			'videoSettings.sleepTimer' => 'Hẹn giờ tắt màn hình',
			'videoSettings.audioSync' => 'Độ trễ âm thanh',
			'videoSettings.subtitleSync' => 'Độ trễ phụ đề',
			'videoSettings.hdr' => 'HDR',
			'videoSettings.audioOutput' => 'Thiết bị âm thanh',
			'videoSettings.performanceOverlay' => 'Performance Overlay',
			'videoSettings.audioPassthrough' => 'Truyền thẳng âm thanh (Passthrough)',
			'videoSettings.audioNormalization' => 'Normalize Loudness',
			'videoSettings.off' => 'Tắt',
			'videoSettings.active' => ({required Object time}) => 'Đang bật (${time})',
			'videoSettings.normalSpeed' => 'Bình thường',
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
			'externalPlayer.off' => 'Tắt',
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
			_ => null,
		} ?? switch (path) {
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
			'trakt.title' => 'Trakt',
			'trakt.connected' => 'Connected',
			'trakt.connectedAs' => ({required Object username}) => 'Connected as @${username}',
			'trakt.disconnectConfirm' => 'Disconnect Trakt account?',
			'trakt.disconnectConfirmBody' => 'Lumi will stop sending playback events to Trakt. You can reconnect at any time.',
			'trakt.scrobble' => 'Real-time scrobbling',
			'trakt.scrobbleDescription' => 'Send play, pause, and stop events to Trakt during playback.',
			'trakt.watchedSync' => 'Sync watched status',
			'trakt.watchedSyncDescription' => 'When you mark items watched in Lumi, mark them on Trakt.',
			'trackers.title' => 'Trackers',
			'trackers.hubSubtitle' => 'Keep your watch progress in sync with Trakt and other services.',
			'trackers.notConnected' => 'Not connected',
			'trackers.connectedAs' => ({required Object username}) => 'Connected as @${username}',
			'trackers.scrobble' => 'Track progress automatically',
			'trackers.scrobbleDescription' => 'Update your list when you finish an episode or movie.',
			'trackers.disconnectConfirm' => ({required Object service}) => 'Disconnect ${service}?',
			'trackers.disconnectConfirmBody' => ({required Object service}) => 'Lumi will stop updating your ${service} list. You can reconnect at any time.',
			'trackers.connectFailed' => ({required Object service}) => 'Couldn\'t connect to ${service}. Try again.',
			'trackers.services.mal' => 'MyAnimeList',
			'trackers.services.anilist' => 'AniList',
			'trackers.services.simkl' => 'Simkl',
			'trackers.deviceCode.title' => ({required Object service}) => 'Activate Lumi on ${service}',
			'trackers.deviceCode.body' => ({required Object url}) => 'Visit ${url} and enter this code:',
			'trackers.deviceCode.openToActivate' => ({required Object service}) => 'Open ${service} to activate',
			'trackers.deviceCode.waitingForAuthorization' => 'Waiting for authorization…',
			'trackers.deviceCode.codeCopied' => 'Code copied',
			'trackers.oauthProxy.title' => ({required Object service}) => 'Sign in to ${service}',
			'trackers.oauthProxy.body' => 'Scan this QR code with your phone, or open the URL below on any device with a browser.',
			'trackers.oauthProxy.openToSignIn' => ({required Object service}) => 'Open ${service} to sign in',
			'trackers.oauthProxy.urlCopied' => 'URL copied',
			'trackers.libraryFilter.title' => 'Library filter',
			'trackers.libraryFilter.subtitleAllSyncing' => 'Syncing all libraries',
			'trackers.libraryFilter.subtitleNoneSyncing' => 'Nothing syncing',
			'trackers.libraryFilter.subtitleBlocked' => ({required Object count}) => '${count} blocked',
			'trackers.libraryFilter.subtitleAllowed' => ({required Object count}) => '${count} allowed',
			'trackers.libraryFilter.mode' => 'Filter mode',
			'trackers.libraryFilter.modeBlacklist' => 'Blacklist',
			'trackers.libraryFilter.modeWhitelist' => 'Whitelist',
			'trackers.libraryFilter.modeHintBlacklist' => 'Sync every library except the ones checked below.',
			'trackers.libraryFilter.modeHintWhitelist' => 'Sync only the libraries checked below.',
			'trackers.libraryFilter.libraries' => 'Libraries',
			'trackers.libraryFilter.noLibraries' => 'No libraries available',
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
			'languages.ar' => 'Tiếng Ả Rập',
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
			'languages.bn' => 'Tiếng Bengal',
			'languages.bo' => 'Tibetan Standard, Tibetan, Central',
			'languages.br' => 'Breton',
			'languages.bs' => 'Bosnian',
			'languages.ca' => 'Catalan',
			'languages.ce' => 'Chechen',
			'languages.ch' => 'Chamorro',
			'languages.co' => 'Corsican',
			'languages.cr' => 'Cree',
			'languages.cs' => 'Tiếng Séc',
			'languages.cu' => 'Old Church Slavonic, Church Slavonic, Old Bulgarian',
			'languages.cv' => 'Chuvash',
			'languages.cy' => 'Welsh',
			'languages.da' => 'Tiếng Đan Mạch',
			'languages.de' => 'Tiếng Đức',
			'languages.dv' => 'Divehi, Dhivehi, Maldivian',
			'languages.dz' => 'Dzongkha',
			'languages.ee' => 'Ewe',
			'languages.el' => 'Tiếng Hy Lạp',
			'languages.en' => 'Tiếng Anh',
			'languages.eo' => 'Esperanto',
			'languages.es' => 'Tiếng Tây Ban Nha',
			'languages.et' => 'Estonian',
			'languages.eu' => 'Basque',
			'languages.fa' => 'Tiếng Ba Tư',
			'languages.ff' => 'Fula, Fulah, Pulaar, Pular',
			'languages.fi' => 'Tiếng Phần Lan',
			'languages.fj' => 'Fijian',
			'languages.fo' => 'Faroese',
			'languages.fr' => 'Tiếng Pháp',
			'languages.fy' => 'Western Frisian',
			'languages.ga' => 'Irish',
			'languages.gd' => 'Scottish Gaelic, Gaelic',
			'languages.gl' => 'Galician',
			'languages.gn' => 'Guaraní',
			'languages.gu' => 'Gujarati',
			'languages.gv' => 'Manx',
			'languages.ha' => 'Hausa',
			'languages.he' => 'Tiếng Do Thái',
			'languages.hi' => 'Tiếng Hindi',
			'languages.ho' => 'Hiri Motu',
			'languages.hr' => 'Croatian',
			'languages.ht' => 'Haitian, Haitian Creole',
			'languages.hu' => 'Tiếng Hungary',
			'languages.hy' => 'Armenian',
			'languages.hz' => 'Herero',
			'languages.ia' => 'Interlingua',
			'languages.id' => 'Tiếng Indonesia',
			'languages.ie' => 'Interlingue',
			'languages.ig' => 'Igbo',
			'languages.ii' => 'Nuosu',
			'languages.ik' => 'Inupiaq',
			'languages.io' => 'Ido',
			'languages.kIs' => 'Icelandic',
			'languages.it' => 'Tiếng Ý',
			'languages.iu' => 'Inuktitut',
			'languages.ja' => 'Tiếng Nhật',
			'languages.jv' => 'Javanese',
			'languages.ka' => 'Georgian',
			'languages.kg' => 'Kongo',
			'languages.ki' => 'Kikuyu, Gikuyu',
			'languages.kj' => 'Kwanyama, Kuanyama',
			'languages.kk' => 'Kazakh',
			'languages.kl' => 'Kalaallisut, Greenlandic',
			'languages.km' => 'Khmer',
			'languages.kn' => 'Kannada',
			'languages.ko' => 'Tiếng Hàn',
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
			'languages.nl' => 'Tiếng Hà Lan',
			'languages.nn' => 'Norwegian Nynorsk',
			'languages.no' => 'Tiếng Na Uy',
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
			'languages.pl' => 'Tiếng Ba Lan',
			'languages.ps' => 'Pashto, Pushto',
			'languages.pt' => 'Tiếng Bồ Đào Nha',
			'languages.qu' => 'Quechua',
			'languages.rm' => 'Romansh',
			'languages.rn' => 'Kirundi',
			'languages.ro' => 'Tiếng Romania',
			'languages.ru' => 'Tiếng Nga',
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
			'languages.sv' => 'Tiếng Thụy Điển',
			'languages.sw' => 'Swahili',
			'languages.ta' => 'Tamil',
			'languages.te' => 'Telugu',
			'languages.tg' => 'Tajik',
			'languages.th' => 'Tiếng Thái',
			'languages.ti' => 'Tigrinya',
			'languages.tk' => 'Turkmen',
			'languages.tl' => 'Tagalog',
			'languages.tn' => 'Tswana',
			'languages.to' => 'Tonga (Tonga Islands)',
			'languages.tr' => 'Tiếng Thổ Nhĩ Kỳ',
			'languages.ts' => 'Tsonga',
			'languages.tt' => 'Tatar',
			'languages.tw' => 'Twi',
			'languages.ty' => 'Tahitian',
			'languages.ug' => 'Uyghur',
			'languages.uk' => 'Tiếng Ukraina',
			'languages.ur' => 'Urdu',
			'languages.uz' => 'Uzbek',
			'languages.ve' => 'Venda',
			'languages.vi' => 'Tiếng Việt',
			'languages.vo' => 'Volapük',
			'languages.wa' => 'Walloon',
			'languages.wo' => 'Wolof',
			'languages.xh' => 'Xhosa',
			'languages.yi' => 'Yiddish',
			'languages.yo' => 'Yoruba',
			'languages.za' => 'Zhuang, Chuang',
			'languages.zh' => 'Tiếng Trung',
			'languages.zu' => 'Zulu',
			'languages.unknown' => 'Không xác định',
			_ => null,
		};
	}
}
