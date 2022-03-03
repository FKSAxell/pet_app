// To parse this JSON data, do
//
//     final place = placeFromJson(jsonString);

import 'dart:convert';

List<Place> placeFromJson(String str) =>
    List<Place>.from(json.decode(str).map((x) => Place.fromJson(x)));

String placeToJson(List<Place> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Place {
  Place({
    required this.name,
    required this.image,
    required this.description,
    required this.location,
    required this.category,
    required this.callphone,
    required this.wsphone,
    required this.schedule,
  });

  String name;
  String image;
  String description;
  Location location;
  String category;
  String callphone;
  String wsphone;
  Schedule schedule;

  factory Place.fromJson(Map<String, dynamic> json) => Place(
        name: json["name"],
        image: json["image"],
        description: json["description"],
        location: Location.fromJson(json["location"]),
        category: json["category"],
        callphone: json["callphone"],
        wsphone: json["wsphone"],
        schedule: Schedule.fromJson(json["schedule"]),
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "image": image,
        "description": description,
        "location": location.toJson(),
        "category": category,
        "callphone": callphone,
        "wsphone": wsphone,
        "schedule": schedule.toJson(),
      };
}

class Location {
  Location({
    required this.lat,
    required this.lng,
  });

  double lat;
  double lng;

  factory Location.fromJson(Map<String, dynamic> json) => Location(
        lat: json["lat"].toDouble(),
        lng: json["lng"].toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "lat": lat,
        "lng": lng,
      };
}

class Schedule {
  Schedule({
    required this.ini,
    required this.end,
  });

  String ini;
  String end;

  factory Schedule.fromJson(Map<String, dynamic> json) => Schedule(
        ini: json["ini"],
        end: json["end"],
      );

  Map<String, dynamic> toJson() => {
        "ini": ini,
        "end": end,
      };
}
