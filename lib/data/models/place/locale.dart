class Locale {
  const Locale({
    this.id,
    this.name,
    this.timezone,
    this.sysName,
  });

  factory Locale.fromMap(Map<String, dynamic> json) => Locale(
    name: json['name'],
    timezone: json['timezone'],
    sysName: json['sysName'],
    id: json['id'],
  );

  final int? id;
  final String? name;
  final String? timezone;
  final String? sysName;
}