/// A genre available in a library section.
///
/// [id] is the backend filter value used to query items in this genre
/// (Plex's `genre=<id>` param). [title] is the English genre name returned by
/// the server — translation for display happens at the UI layer via
/// `translatedGenreName`.
class MediaGenre {
  final String id;
  final String title;

  const MediaGenre({required this.id, required this.title});
}
