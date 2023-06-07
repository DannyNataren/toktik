class Video {
  final String originalName;
  final String name;
  final String caption;
  final int likes;
  final int views;
  final String url;
  final String type;

  Video({required this.originalName, required this.name, required this.url, required this.type, required this.caption, this.likes = 0, this.views = 0});
}