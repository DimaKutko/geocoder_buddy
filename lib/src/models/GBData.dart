// Geocoder Buddy Data Model
import 'dart:convert';

GBData gbDataFromJson(String str) => GBData.fromJson(json.decode(str));

String gbDataToJson(GBData data) => json.encode(data.toJson());

class GBData {
  GBData({
    this.placeId,
    this.osmType,
    this.id,
    this.lat,
    this.lon,
    this.placeRank,
    this.importance,
    this.displayName,
    this.address,
    this.boundingbox,
  });

  int? placeId;
  String? osmType;
  int? id;
  String? lat;
  String? lon;
  int? placeRank;
  double? importance;
  String? displayName;
  Address? address;
  List<String>? boundingbox;

  factory GBData.fromJson(Map<String, dynamic> json) => GBData(
        placeId: json["place_id"],
        osmType: json["osm_type"],
        id: json["osm_id"],
        lat: json["lat"],
        lon: json["lon"],
        placeRank: json["place_rank"],
        importance: json["importance"].toDouble(),
        displayName: json["display_name"],
        address: Address.fromJson(json["address"]),
        boundingbox: List<String>.from(json["boundingbox"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "place_id": placeId,
        "osm_type": osmType,
        "osm_id": id,
        "lat": lat,
        "lon": lon,
        "place_rank": placeRank,
        "importance": importance,
        "display_name": displayName,
        "address": address?.toJson(),
        "boundingbox": List<dynamic>.from(boundingbox?.map((x) => x) ?? []),
      };
}

class Address {
  Address({
    this.road,
    this.village,
    this.county,
    this.stateDistrict,
    this.state,
    this.iso31662Lvl4,
    this.postcode,
    this.country,
    this.countryCode,
  });

  String? road;
  String? village;
  String? county;
  String? stateDistrict;
  String? state;
  String? iso31662Lvl4;
  String? postcode;
  String? country;
  String? countryCode;

  factory Address.fromJson(Map<String, dynamic> json) => Address(
        road: json["road"],
        village: json["village"],
        county: json["county"],
        stateDistrict: json["state_district"],
        state: json["state"],
        iso31662Lvl4: json["ISO3166-2-lvl4"],
        postcode: json["postcode"],
        country: json["country"],
        countryCode: json["country_code"],
      );

  Map<String, dynamic> toJson() => {
        "road": road,
        "village": village,
        "county": county,
        "state_district": stateDistrict,
        "state": state,
        "ISO3166-2-lvl4": iso31662Lvl4,
        "postcode": postcode,
        "country": country,
        "country_code": countryCode,
      };
}
