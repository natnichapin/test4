/*// To parse this JSON data, do
//
//     final exchangeRate = exchangeRateFromJson(jsonString);

import 'dart:convert';

ExchangeRate exchangeRateFromJson(String str) => ExchangeRate.fromJson(json.decode(str));

String exchangeRateToJson(ExchangeRate data) => json.encode(data.toJson());

class ExchangeRate {
  ExchangeRate({
    this.rate,
    this.base,
    this.date,
  });

  Map<String, double> rate;
  String base;
  DateTime date;

  factory ExchangeRate.fromJson(Map<String, dynamic> json) => ExchangeRate(
    rate: json["rate"] == null ? null : Map.from(json["rate"]).map((k, v) => MapEntry<String, double>(k, v.toDouble())),
    date: json["date"] == null ? null : DateTime.parse(json["date"]),
  );

  Map<String, dynamic> toJson() => {
    "rate": rate == null ? null : Map.from(rate).map((k, v) => MapEntry<String, dynamic>(k, v)),
    "base": base == null ? null : base,
    "date": date == null ? null : "${date.year.toString().padLeft(4, '0')}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}",
  };
}
*/