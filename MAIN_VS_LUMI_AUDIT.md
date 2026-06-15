# main → lumi: Feature & Fix Audit

Comparison of upstream `main` (tip `d44a8994`, 2026-06-08) against the `lumi` fork.
Merge base: `2208d6c6` (2026-05-07). main has 360 commits since; lumi has 219 of its own.

**Method:** lumi is a heavily-rebuilt fork — commit messages don't map across branches,
so each item below was verified against lumi's *actual code* (symbols/files/behavior),
not commit logs. Confidence = how sure the audit is that the feature is truly absent.

**How to use:** mark each row Port / Skip. Items are grouped by area and roughly ordered
high-value first. Hashes are upstream `main` commits — use `git show <hash>` to inspect.

---

## 1. Big-ticket features (large ports)

| Feature | What it does | Hash(es) | Effort | Conf | Port/Skip |
|---|---|---|---|---|---|
| **Trackers (MAL/AniList/Simkl/Trakt)** | Whole `lib/services/trackers/` (36 files) + rating sheet + anime episode sync. **Entirely absent from lumi.** | 3e749373, 310c4280, 9e5098f3, 8f9947a8, 126e6b93, de129fbb | ~15–25h | high | ☐ |
| **tvOS Top Shelf** | Native tvOS top-shelf featured content (extension bundle + Swift plugin + wiring script) | 43012da2 | medium | high | ☐ |
| **M3 app menus** | Unified Material-3 context-menu widget (`lib/widgets/app_menu.dart`) replacing scattered menus | 75b1c863 | medium | high | ☐ |

> Note on **Discord posters** (bdbd6675): lumi already diverged — it uses Litterbox image
> hosting instead of main's self-hosted `server/main.go` endpoint. Not a port; a *choice*.
> Lumi's approach is arguably better (no server to run). **Skip unless you want self-hosting.**

---

## 2. Jellyfin

| Feature | What it does | Hash(es) | Conf | Port/Skip |
|---|---|---|---|---|
| Local server discovery | LAN discovery + endpoint probing for Jellyfin | e3db5494, 1b5334e7 | high | ☐ |
| Multiple server URLs | Fallback URLs per server (failover) | 6642348a | high | ☐ |
| Metadata editing | Edit title/year/images/ratings via Jellyfin API | 09f51217 | high | ☐ |
| Media quality labels (HDR/DV) | Detect & show HDR/Dolby-Vision badges | e5bbdc06 | high | ☐ |
| Actor media browsing | Browse by person/actor | 2bbd31d9 | high | ☐ |
| Continue-watching by recency | Merge resume+next-up, order by recency (PARTIAL in lumi) | e8df18e7 | high | ☐ |

---

## 3. Player / Playback / Video

| Feature | What it does | Hash(es) | Conf | Port/Skip |
|---|---|---|---|---|
| End-of-video sleep timer | Arm sleep timer at EOF instead of fixed duration | 294996ea | high | ☐ |
| Exit fullscreen on player close | Setting to auto-exit fullscreen when closing player | 7cac0505 | high | ☐ |
| Custom zoom controls | Two-finger double-tap zoom presets (1x/1.5x/2x/fit/center) | 2b7ea5fe | high | ☐ |
| Screenshot shortcut | Configurable hotkey to capture current frame | 6bad4548 | high | ☐ |
| Player chrome controller | Centralized overlay visibility/auto-hide state machine | 24b5080c | high | ☐ |
| Prevent play-next EOF loop | Hysteresis so play-next prompt doesn't re-fire at end | 08491511 | high | ☐ |
| Consolidate auto-skip cancel | Unified skip-marker cancellation (kbd/nav/visibility) | 01e58149 | high | ☐ |
| Stabilize mobile content strip | Fix content-strip layout jitter on mobile | 42d91689 | high | ☐ |
| Quality picker → playback settings | Move version/quality picker into video settings menu | 653fada5 | high | ☐ |
| Block TV background media resume | Stop Android TV auto-resuming in background | ffc20b26 | high | ☐ |
| Apple DV conversion | Swift mpv bridge for Apple DV→HEVC | ba621294 | high | ☐ |
| Restore system UI after playback | Restore gesture nav/system UI on fullscreen exit | 08a806e4 | high | ☐ |
| Apple PiP lifecycle hardening | Robust iOS/macOS PiP state cleanup | 1e6bd019 | high | ☐ |
| Accumulate repeated seeks | Coalesce rapid seeks to avoid buffer stalls | e10cc7d2 | high | ☐ |
| Remember subtitle search language | Persist last subtitle-search language | cd31b2e2 | high | ☐ |
| Harden watch-progress edge cases | Offline/online progress edge-case fixes | dba01f14 | high | ☐ |
| Harden offline source reporting | Stabilize download/offline playback reporting | d93ea981 | high | ☐ |
| Sync downloaded watch progress | Correct progress sync for downloads | 7501f461 | high | ☐ |
| Android MPV decoder refresh on startup | Reinit decoder on launch (PARTIAL) | 3e6ebcdb, 2b455577 | high | ☐ |
| Clear stale tracks before open | Purge track cache before opening media | 12073ea1 | high | ☐ |
| Gate frame-rate refresh on restart | Only refresh display FR on real restart | 7d679c9d | med | ☐ |
| Sync restored volume state | Volume synced on state restore | bb66ab65 | med | ☐ |

*(Timeline-churn perf tweaks 5401b500/d38f7cf7/5d2302b3 are PARTIAL — lumi's player differs; low priority.)*

---

## 4. TV / tvOS / Android TV

| Feature | What it does | Hash(es) | Conf | Port/Skip |
|---|---|---|---|---|
| Spotlight browse layouts | `TvBrowseRail` + `TvSpotlightBackground` enhanced TV browse | 7690a16 | high | ☐ |
| Focus glow overlay | Symmetric all-sides card focus glow via root overlay | d90cc61 | high | ☐ |
| Full-card layout support | Full-bleed card option (`tvFullCardLayout`) | 47276e1 | high | ☐ |
| D-pad horizontal focus trap | Stop d-pad escaping button-row edges off-screen | 097e48d7 | med | ☐ |
| App-bar actions via UP from tabs | Reach action bar by pressing UP from tab chips | 32421e4c | med | ☐ |
| Sidebar interaction expansion | Sidebar expands on hover/focus w/ animated padding | 0dd7d7c, afc94a50, fea973a7 | med | ☐ |
| Native play/pause remote handling | Suppress duplicate Apple TV remote play/pause events | 92bfae3 | med | ☐ |
| On-screen keyboard focus wrap | Wrap focus at virtual-keyboard edges (PARTIAL) | 50ff514 | med | ☐ |

---

## 5. UI / Navigation / Libraries / Detail / Live TV / Search

### Navigation & startup
| Feature | What it does | Hash(es) | Conf | Port/Skip |
|---|---|---|---|---|
| Startup section setting | Open app on a chosen tab | 1ef4032 | high | ☐ |
| Move mobile settings to home menu | Settings via profile menu on mobile | aed42052 | high | ☐ |
| Pointer cursors on controls | Desktop MouseRegion cursors on clickables | 5a68711 | high | ☐ |
| Hide sidebar bg during focus | Sidebar focus UX | 487c7b87 | med | ☐ |
| Recover failed server bind | Graceful startup on server-bind error | d0ffd49f | med | ☐ |

### Libraries & browse
| Feature | What it does | Hash(es) | Conf | Port/Skip |
|---|---|---|---|---|
| Nav quick picker sheet | Jump between libraries | e45bfadc | high | ☐ |
| Respect grouping type in browse | Honor season/episode grouping mode | 7ffb20b5 | med | ☐ |
| Keep show after deleting downloads | State preservation in browse | 23efb026 | med | ☐ |
| Reload when server connects | Auto-refresh libraries on server online | 6111c381 | med | ☐ |
| Mobile browse options sheet | Filters/sort sheet (PARTIAL in lumi) | 8201d8dc | high | ☐ |

### Media detail
| Feature | What it does | Hash(es) | Conf | Port/Skip |
|---|---|---|---|---|
| Highlight next unwatched episode | Auto-select first unwatched ep | 381e82d6 | high | ☐ |
| Lazily page detail episodes | Paged loading for big seasons | 0fd0506 | high | ☐ |
| Show video/audio quality labels | Codec/bitrate badges on detail | 0e7ff609 | high | ☐ |
| Isolate overlay-sheet scrolling | Independent sheet/handle scroll | e559a61 | med | ☐ |
| Prevent detail action layout churn | Stable play-button layout | 7ec4527 | med | ☐ |

### Live TV
| Feature | What it does | Hash(es) | Conf | Port/Skip |
|---|---|---|---|---|
| Group guide by source | Channel grouping by service | 87db5917 | high | ☐ |
| Debounce time-shift skips | Stop skip overshoot in live TV | f74314bb | high | ☐ |
| Active recording indicators | Mark recording shows in guide | 0582ab29, 3ddd8913 | high | ☐ |
| Expand program summaries | Full descriptions in guide | 048d22cb | med | ☐ |
| Show guide without favorites | All channels, not just favorites | 0e296e8 | med | ☐ |

### Search & profiles & sheets
| Feature | What it does | Hash(es) | Conf | Port/Skip |
|---|---|---|---|---|
| Rank media search results | Relevance scoring | be0e9686 | high | ☐ |
| Position desktop sheets near cursor | Sheet opens near mouse | 4cdcd2f2 | high | ☐ |
| Sort profiles by recent use | Order by last login | 5788d93 | high | ☐ |
| Improve PIN entry | Better PIN dialog UX | a39a2a25 | med | ☐ |
| Share bottom-sheet scaffold | Shared sheet layout widget | 19dea4b3 | med | ☐ |

---

## 6. Platform integration (Android / iOS / macOS / Windows)

| Feature | What it does | Hash(es) | Conf | Port/Skip |
|---|---|---|---|---|
| External player progress sync | Track & sync back progress from MX/VLC | 1cd585ee | high | ☐ |
| iOS status-bar tap → scroll top | Tap status bar to scroll list to top | e1e9adbb | high | ☐ |
| Android deeplink routing disable | Disable Flutter auto-deeplink for custom handler | bcb7f1d3 | high | ☐ |
| macOS LuaJIT hardened-runtime entitlements | allow-jit / unsigned-exec-mem for LuaJIT | eba55341 | high | ☐ |
| macOS local-network permissions | NSLocalNetworkUsageDescription + Bonjour | 6f273b0a | high | ☐ |
| Windows taskbar-flash fix | No taskbar flash when minimizing fullscreen | a4f0b92b | high | ☐ |
| Windows VLC install-path detect | Find VLC via registry/Program Files | 29e0654d | high | ☐ |
| macOS fullscreen startup + chrome sync | Start fullscreen + sync titlebar/traffic lights (PARTIAL) | 0bb085c7, afda6111 | high | ☐ |
| Windows patched connectivity_plus | Pin git fork to fix Windows connectivity | d3e8dcef | high | ☐ |

> ⚠️ **Skip / lumi-specific:** main's `565885cc` *adds* iOS location+photo usage strings —
> lumi deliberately **removed** these (stripped DKImagePickerController). **Do NOT port.**

---

## 7. Plex / Downloads / Offline / Watch-Together / Companion Remote / DB

| Feature | What it does | Hash(es) | Conf | Port/Skip |
|---|---|---|---|---|
| Plays + User Rating sort options | Extra Plex sorts not advertised by API | 9cebcb97 | high | ☐ |
| Repair offline artwork service | `DownloadArtworkService` for normalized art storage | dcd0b030 | high | ☐ |
| Cap aggregate download progress <100% | Hold at 99% until all episodes done | 00fce3a9 | high | ☐ |
| Remember manual remote host | Persist manually-entered companion host | 68e27fdb | high | ☐ |
| Respect remote-server enable/disable | Start/stop host when toggled in settings | 5a468570 | high | ☐ |
| Cleanup orphaned plexImageCache | Remove legacy cache dir on startup | fcbe4591 | high | ☐ |
| Cross-drive desktop DB migration | Copy+delete fallback (OneDrive ERROR_NOT_SAME_DEVICE) | bae127e4 | high | ☐ |
| Watch-Together dpad recent-room actions | OverlaySheetHost for dpad SELECT actions | cda4c1e7 | high | ☐ |
| Restore host resume in watch-together | Restore host playback position on re-entry | 562d19c2 | med | ☐ |
| Honor hidden profiles in offline mode | Don't show hidden profiles offline | a189ee57 | med | ☐ |

> Many Plex transcode tweaks (MKV attachments, no-burn subs, fail-open capability,
> promoted hubs, per-show season display, transient-failure tolerance) came back
> **PARTIAL/uncertain** — lumi's `plex_client.dart` has diverged and may already cover
> them. These need case-by-case `git show` review *before* deciding. Listed in detail
> in the per-area notes; treat as "investigate if you hit the bug."

---

## Quick recommendations

**Highest value, low risk, mostly self-contained** (good first ports):
End-of-video sleep timer · Screenshot shortcut · Exit-fullscreen-on-close · Startup section
setting · Highlight next unwatched episode · Group live TV guide by source · Sort profiles by
recent use · Plays/User-Rating sorts · Cross-drive DB migration · Windows taskbar-flash fix ·
macOS LuaJIT entitlements.

**High value but larger:** Trackers subsystem · M3 app menus · tvOS Top Shelf · Jellyfin local
discovery / multiple URLs / metadata editing · Player chrome controller.

**Do NOT port (lumi diverged intentionally):** iOS location/photo usage strings (565885cc) ·
Discord self-hosted posters (bdbd6675) — unless you want the upstream behavior back.

**Investigate before porting (PARTIAL/uncertain):** Plex transcode tweaks · timeline-churn perf ·
mobile browse sheet parity · Android frame-rate refactor.
