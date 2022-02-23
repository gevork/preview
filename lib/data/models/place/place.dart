import 'package:equatable/equatable.dart';

import 'place_data.dart';

class Place extends Equatable {
  const Place({
    this.id = '',
    this.hash,
    this.nativeId,
    this.activated,
    this.data,
    this.status,
    this.updateSession,
    this.odSetVersions,
    this.odSchema,
    this.dataset,
    this.nativeName,
    this.created,
    this.modified,
  });

  factory Place.fromMap(Map<String, dynamic> json) => Place(
        id: json['_id'] ?? '',
        hash: DateTime.tryParse(json['hash'] ?? ''),
        nativeId: json['nativeId'],
        activated: DateTime.tryParse(json['activated'] ?? ''),
        data: json['data'] == null ? null : PlaceData.fromMap(json['data']),
        status: json['status'],
        updateSession: json['updateSession'],
        odSetVersions: json['odSetVersions'] == null
            ? null
            : List<String>.from(json['odSetVersions'].map((x) => x)),
        odSchema: json['odSchema'],
        dataset: json['dataset'],
        nativeName: json['nativeName'],
        created: DateTime.tryParse(json['created'] ?? ''),
        modified: DateTime.tryParse(json['modified'] ?? ''),
      );

  final String id;
  final DateTime? hash;
  final String? nativeId;
  final DateTime? activated;
  final PlaceData? data;
  final int? status;
  final String? updateSession;
  final List<String>? odSetVersions;
  final String? odSchema;
  final String? dataset;
  final String? nativeName;
  final DateTime? created;
  final DateTime? modified;

  @override
  List<Object?> get props => [id];
}
