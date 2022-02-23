import 'address.dart';
import 'locale.dart';

class Organization {
  const Organization({
    this.id,
    this.name,
    this.inn,
    this.type,
    this.address,
    this.subordinationIds,
    this.subordination,
    this.localeIds,
    this.locale,
  });

  factory Organization.fromMap(Map<String, dynamic> json) => Organization(
        id: json['id'],
        name: json['name'],
        inn: json['inn'],
        type: json['type'],
        address:
            json['address'] == null ? null : Address.fromMap(json['address']),
        subordinationIds: json['subordinationIds'] == null
            ? null
            : List<int>.from(json['subordinationIds'].map((x) => x)),
        subordination: json['subordination'] == null
            ? null
            : Locale.fromMap(json['subordination']),
        localeIds: json['localeIds'] == null
            ? null
            : List<int>.from(json['localeIds'].map((x) => x)),
        locale: json['locale'] == null ? null : Locale.fromMap(json['locale']),
      );

  final int? id;
  final String? name;
  final String? inn;
  final String? type;
  final Address? address;
  final List<int>? subordinationIds;
  final Locale? subordination;
  final List<int>? localeIds;
  final Locale? locale;
}
