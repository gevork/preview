class Category {
  const Category({
    this.name,
    this.sysName,
  });

  factory Category.fromMap(Map<String, dynamic> json) => Category(
        name: json['name'],
        sysName: json['sysName'],
      );

  final String? name;
  final String? sysName;
}
