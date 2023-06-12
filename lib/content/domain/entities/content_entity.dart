class UserContent {
  final int id;
  final String username;
  final String image;
  UserContent({required this.id, required this.username, this.image = ""});

}

class Content {
  final int id;
  final String originalName;
  final String name;
  final String caption;
  final int likes;
  final int views;
  final String url;
  final String type;
  final UserContent user;

  Content({required this.user, required this.id, required this.originalName, required this.name, required this.url, required this.type, required this.caption, this.likes = 0, this.views = 0});
}