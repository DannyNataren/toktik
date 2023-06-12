class User {
  final String image;
  final int id;
  final String username;
  final String password;
  final String name;
  final String lastName;
  final DateTime createdAt;
  final bool isActive;
  final List<ContentUser> content;

  User({
    required this.image,
    required this.id,
    required this.username,
    required this.password,
    required this.name,
    required this.lastName,
    required this.createdAt,
    required this.isActive,
    required this.content,
  });
}

class ContentUser {
  final int id;
  final String originalName;
  final String name;
  final String caption;
  final int likes;
  final int views;
  final String url;
  final String type;
  final String publicId;

  ContentUser({
    required this.id,
    required this.originalName,
    required this.name,
    required this.caption,
    required this.likes,
    required this.views,
    required this.url,
    required this.type,
    required this.publicId,
  });
}