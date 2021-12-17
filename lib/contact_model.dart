// To parse this JSON data, do
//
//     final contact = contactFromJson(jsonString);

import 'dart:convert';

Contact contactFromJson(String str) => Contact.fromJson(json.decode(str));

String contactToJson(Contact data) => json.encode(data.toJson());

class Contact {
  Contact({
    required this.name,
    required this.phone,
    required this.country,
    required this.region,
    required this.email,
  });

  String name;
  String phone;
  String country;
  String region;
  String email;

  factory Contact.fromJson(Map<String, dynamic> json) => Contact(
        name: json["name"],
        phone: json["phone"],
        country: json["country"],
        region: json["region"],
        email: json["email"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "phone": phone,
        "country": country,
        "region": region,
        "email": email,
      };
}
