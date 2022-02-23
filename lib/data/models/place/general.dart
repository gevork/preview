import 'address.dart';
import 'category.dart';
import 'contacts.dart';
import 'external_info.dart';
import 'extra_fields.dart';
import 'image.dart';
import 'locale.dart';
import 'organization.dart';

class General {
  const General({
    this.id,
    this.name,
    this.description,
    this.status,
    this.address,
    this.category,
    this.contacts,
    this.externalInfo,
    this.extraFields,
    this.gallery,
    this.image,
    this.localeIds,
    this.locale,
    this.organization,
    this.recommendations,
    this.tags,
    this.ticketReport,
  });

  factory General.fromMap(Map<String, dynamic> json) => General(
        id: json['id'],
        name: json['name'],
        description: json['description'],
        status: json['status'],
        address:
            json['address'] == null ? null : Address.fromMap(json['address']),
        category: json['category'] == null
            ? null
            : Category.fromMap(json['category']),
        contacts: json['contacts'] == null
            ? null
            : Contacts.fromMap(json['contacts']),
        externalInfo: json['externalInfo'] == null
            ? null
            : List<ExternalInfo>.from(
                json['externalInfo'].map((x) => ExternalInfo.fromMap(x))),
        extraFields: json['extraFields'] == null
            ? null
            : ExtraFields.fromMap(json['extraFields']),
        gallery: json['gallery'] == null
            ? null
            : List<Image>.from(json['gallery'].map((x) => Image.fromMap(x))),
        image: json['image'] == null ? null : Image.fromMap(json['image']),
        localeIds: json['localeIds'] == null
            ? null
            : List<int>.from(json['localeIds'].map((x) => x)),
        locale: json['locale'] == null ? null : Locale.fromMap(json['locale']),
        organization: json['organization'] == null
            ? null
            : Organization.fromMap(json['organization']),
        recommendations: json['recommendations'] == null
            ? null
            : List<Locale>.from(
                json['recommendations'].map((x) => Locale.fromMap(x))),
        tags: json['tags'] == null
            ? null
            : List<Locale>.from(json['tags'].map((x) => Locale.fromMap(x))),
        ticketReport: json['ticketReport'] == null
            ? null
            : List<dynamic>.from(json['ticketReport'].map((x) => x)),
      );

  final int? id;
  final String? name;
  final String? description;
  final String? status;
  final Address? address;
  final Category? category;
  final Contacts? contacts;
  final List<ExternalInfo>? externalInfo;
  final ExtraFields? extraFields;
  final List<Image>? gallery;
  final Image? image;
  final List<int>? localeIds;
  final Locale? locale;
  final Organization? organization;
  final List<Locale>? recommendations;
  final List<Locale>? tags;
  final List<dynamic>? ticketReport;
}
