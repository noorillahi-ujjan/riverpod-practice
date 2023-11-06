// // To parse this JSON data, do
// //
// //     final country = countryFromJson(jsonString);

// import 'dart:convert';

// import 'package:flutter/material.dart';

// List<Country> countryFromJson(String str) =>
//     List<Country>.from(json.decode(str).map((x) => Country.fromJson(x)));

// String countryToJson(List<Country> data) =>
//     json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

// class Country {
//   NetworkImage flag;
//   String country;
//   String? code;

//   Country({
//     required this.flag,
//     required this.country,
//     this.code,
//   });

//   factory Country.fromJson(Map<String, dynamic> json) => Country(
//         flag: json["flag"],
//         country: json["country"],
//         code: json["code"],
//       );

//   Map<String, dynamic> toJson() => {
//         "flag": flag,
//         "country": country,
//         "code": code,
//       };

//   toList() {}
// }

import 'package:flutter/material.dart';

class Country {
  final NetworkImage flag;
  final String country;
  final String code;

  Country({
    required this.flag,
    required this.country,
    required this.code,
  });

  factory Country.fromJson(Map<String, dynamic> json) {
    return Country(
      flag: NetworkImage(json['flag']),
      country: json['country'],
      code: json['code'],
    );
  }
}
