mixin Refreshable {
  void refresh();
}

mixin FullRefreshable {
  void fullRefresh();
}

mixin FocusableTab {
  void focusActiveTabIfReady();
}

mixin SearchInputFocusable {
  void focusSearchInput();
  void setSearchQuery(String query);
}

mixin LibraryLoadable {
  /// Load [libraryGlobalKey]'s content. When [focusContent] is false the screen
  /// does not move focus into its grid — used when a selection originates from
  /// the side navigation rail so focus stays on the rail for fast hopping.
  void loadLibraryByKey(String libraryGlobalKey, {bool focusContent = true});
}
