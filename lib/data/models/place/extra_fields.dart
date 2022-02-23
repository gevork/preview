class ExtraFields {
  const ExtraFields({
    this.artType,
    this.audienceType,
    this.language,
  });

  factory ExtraFields.fromMap(Map<String, dynamic> json) => ExtraFields(
        artType: json['artType'],
        audienceType: json['audienceType'],
        language: json['language'],
      );

  final String? artType;
  final String? audienceType;
  final String? language;
}
