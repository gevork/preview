class Image {
  const Image({
    this.url,
    this.title,
  });

  factory Image.fromMap(Map<String, dynamic> json) => Image(
        url: json['url'],
        title: json['title'],
      );

  final String? url;
  final String? title;
}
