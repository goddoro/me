class Medium {
  String? id;
  String? title;
  String? subtitle;
  int? claps;
  String? author;
  String? imageUrl;
  String? url;
  String? publishedAt;
  String? publicationId;

  Medium(
      {this.id,
      this.title,
      this.subtitle,
      this.claps,
      this.author,
      this.imageUrl,
      this.url,
      this.publishedAt,
      this.publicationId});

  factory Medium.fromJson(Map<String, dynamic> json) {
    return Medium(
      id: json['id'],
      title: json['title'],
      subtitle: json['subtitle'],
      claps: json['claps'],
      author: json['author'],
      imageUrl: json['imageUrl'],
      url: json['url'],
      publishedAt: json['publishedAt'],
      publicationId: json['publicationId']
    );
  }
}
