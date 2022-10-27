
import 'dart:convert';

NasaModel nasaModelFromJson(String str) =>
    NasaModel.fromJson(json.decode(str));

String NasaModelToJson(NasaModel data) => json.encode(data.toJson());

class NasaModel {
  NasaModel({
    required this.photos,
  });

  List<Photo> photos;

  factory NasaModel.fromJson(Map<String, dynamic> json) => NasaModel(
    photos: List<Photo>.from(json["photos"].map((x) => Photo.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "photos": List<dynamic>.from(photos.map((x) => x.toJson())),
  };
}

class Photo {
  Photo({
    required this.id,
    required this.sol,
    required this.camera,
    required this.imgSrc,
    required this.earthDate,
    required this.rover,
  });

  int id;
  int sol;
  Camera camera;
  String imgSrc;
  DateTime earthDate;
  Rover rover;

  factory Photo.fromJson(Map<String, dynamic> json) => Photo(
    id: json["id"],
    sol: json["sol"],
    camera: Camera.fromJson(json["camera"]),
    imgSrc: json["img_src"],
    earthDate: DateTime.parse(json["earth_date"]),
    rover: Rover.fromJson(json["rover"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "sol": sol,
    "camera": camera.toJson(),
    "img_src": imgSrc,
    "earth_date":
    "${earthDate.year.toString().padLeft(4, '0')}-${earthDate.month.toString().padLeft(2, '0')}-${earthDate.day.toString().padLeft(2, '0')}",
    "rover": rover.toJson(),
  };
}

class Camera {
  Camera({
    required this.id,
    required this.roverId,
  });

  int id;
  int roverId;

  factory Camera.fromJson(Map<String, dynamic> json) => Camera(
    id: json["id"],
    roverId: json["rover_id"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "rover_id": roverId,
  };
}

enum FullName {
  FRONT_HAZARD_AVOIDANCE_CAMERA,
  REAR_HAZARD_AVOIDANCE_CAMERA,
  MAST_CAMERA,
  CHEMISTRY_AND_CAMERA_COMPLEX,
  NAVIGATION_CAMERA
}

enum CameraName { FHAZ, RHAZ, MAST, CHEMCAM, NAVCAM }

class Rover {
  Rover({
    required this.id,
    required this.landingDate,
    required this.launchDate,
  });

  int id;
  DateTime landingDate;
  DateTime launchDate;

  factory Rover.fromJson(Map<String, dynamic> json) => Rover(
    id: json["id"],
    landingDate: DateTime.parse(json["landing_date"]),
    launchDate: DateTime.parse(json["launch_date"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "landing_date":
    "${landingDate.year.toString().padLeft(4, '0')}-${landingDate.month.toString().padLeft(2, '0')}-${landingDate.day.toString().padLeft(2, '0')}",
    "launch_date":
    "${launchDate.year.toString().padLeft(4, '0')}-${launchDate.month.toString().padLeft(2, '0')}-${launchDate.day.toString().padLeft(2, '0')}",
  };
}

enum RoverName { CURIOSITY }
