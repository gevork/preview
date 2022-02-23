class ExternalInfo {
  const ExternalInfo({
    this.url,
    this.serviceName,
  });

  factory ExternalInfo.fromMap(Map<String, dynamic> json) => ExternalInfo(
    url: json['url'],
    serviceName: json['serviceName'],
  );

  final String? url;
  final String? serviceName;
}
