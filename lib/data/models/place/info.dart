class Info {
  const Info({
    this.path,
    this.category,
    this.createDate,
    this.updateDate,
  });

  factory Info.fromMap(Map<String, dynamic> json) => Info(
        path: json['path'],
        category: json['category'],
        createDate: json['createDate'] == null
            ? null
            : DateTime.tryParse(json['createDate'] ?? ''),
        updateDate: json['updateDate'] == null
            ? null
            : DateTime.tryParse(json['updateDate'] ?? ''),
      );

  final String? path;
  final String? category;
  final DateTime? createDate;
  final DateTime? updateDate;
}
