import 'phone.dart';

class Contacts {
  const Contacts({
    this.website,
    this.email,
    this.phones,
  });

  factory Contacts.fromMap(Map<String, dynamic> json) => Contacts(
        website: json['website'],
        email: json['email'],
        phones: json['phones'] == null
            ? null
            : List<Phone>.from(json['phones'].map((x) => Phone.fromMap(x))),
      );

  final String? website;
  final String? email;
  final List<Phone>? phones;
}
