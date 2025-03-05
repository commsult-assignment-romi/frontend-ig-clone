class Post {
  final int id;
  final String imageUrl;
  final String caption;
  final int likeCount;
  final List<dynamic> comments;

  Post({
    required this.id,
    required this.imageUrl,
    required this.caption,
    required this.likeCount,
    required this.comments,
  });

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      id: json['id'],
      imageUrl: json['imageUrl'],
      caption: json['caption'] ?? '',
      likeCount: json['likeCount'] ?? 0,
      comments: json['comments'] ?? [],
    );
  }
}
