import 'general.dart';
import 'info.dart';

class PlaceData {
  const PlaceData({
    this.info,
    this.general,
  });

  factory PlaceData.fromMap(Map<String, dynamic> json) => PlaceData(
    info: json['info'] == null ? null : Info.fromMap(json['info']),
    general:
    json['general'] == null ? null : General.fromMap(json['general']),
  );

  final Info? info;
  final General? general;
}