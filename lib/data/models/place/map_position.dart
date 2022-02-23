class MapPosition {
  const MapPosition({
    this.type,
    this.coordinates,
  });

  factory MapPosition.fromMap(Map<String, dynamic> json) => MapPosition(
        type: json['type'],
        coordinates: json['coordinates'] == null
            ? null
            : List<double>.from(json['coordinates'].map((x) => x.toDouble())),
      );

  double? get latitude => coordinates?[1];

  double? get longitude => coordinates?[0];

  final String? type;
  final List<double>? coordinates;
}
