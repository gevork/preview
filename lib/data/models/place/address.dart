import 'map_position.dart';

class Address {
  const Address({
    this.street,
    this.comment,
    this.fiasHouseId,
    this.fiasStreetId,
    this.fiasCityId,
    this.fiasRegionId,
    this.fullAddress,
    this.mapPosition,
  });

  factory Address.fromMap(Map<String, dynamic> json) => Address(
        street: json['street'],
        comment: json['comment'],
        fiasHouseId: json['fiasHouseId'],
        fiasStreetId: json['fiasStreetId'],
        fiasCityId: json['fiasCityId'],
        fiasRegionId: json['fiasRegionId'],
        fullAddress: json['fullAddress'],
        mapPosition: json['mapPosition'] == null
            ? null
            : MapPosition.fromMap(json['mapPosition']),
      );

  final String? street;
  final String? comment;
  final String? fiasHouseId;
  final String? fiasStreetId;
  final String? fiasCityId;
  final String? fiasRegionId;
  final String? fullAddress;
  final MapPosition? mapPosition;
}
