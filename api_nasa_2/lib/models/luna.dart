import 'dart:convert';

LunacrisModel lunacrisModelFromJson(String str) => LunacrisModel.fromJson(json.decode(str));

String lunacrisModelToJson(LunacrisModel data) => json.encode(data.toJson());

class LunacrisModel {
  LunacrisModel({
    required this.collection,
  });

  final Collection collection;

  factory LunacrisModel.fromJson(Map<String, dynamic> json) => LunacrisModel(
    collection: Collection.fromJson(json["collection"]),
  );

  Map<String, dynamic> toJson() => {
    "collection": collection.toJson(),
  };
}

class Collection {
  Collection({
    required this.version,
    required this.href,
    required this.items,
    required this.metadata,
    required this.links,
  });

  final String version;
  final String href;
  final List<Item> items;
  final Metadata metadata;
  final List<CollectionLink> links;

  factory Collection.fromJson(Map<String, dynamic> json) => Collection(
    version: json["version"],
    href: json["href"],
    items: List<Item>.from(json["items"].map((x) => Item.fromJson(x))),
    metadata: Metadata.fromJson(json["metadata"]),
    links: List<CollectionLink>.from(
        json["links"].map((x) => CollectionLink.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "version": version,
    "href": href,
    "items": List<dynamic>.from(items.map((x) => x.toJson())),
    "metadata": metadata.toJson(),
    "links": List<dynamic>.from(links.map((x) => x.toJson())),
  };
}

class Item {
  Item({
    required this.href,
    required this.data,
    required this.links,
  });

  final String href;
  final List<Datum> data;
  final List<ItemLink> links;

  factory Item.fromJson(Map<String, dynamic> json) => Item(
    href: json["href"],
    data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
    links:
    List<ItemLink>.from(json["links"].map((x) => ItemLink.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "href": href,
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
    "links": List<dynamic>.from(links.map((x) => x.toJson())),
  };
}

class Datum {
  Datum({
    required this.title,
    required this.photographer,
    required this.keywords,
    required this.location,
    required this.nasaId,
    required this.dateCreated,
    required this.description,
    required this.description508,
    required this.secondaryCreator,
    required this.album,
  });

  final String? title;
  final String? photographer;
  final List<String>? keywords;
  final String? location;
  final String? nasaId;
  final DateTime? dateCreated;
  final String? description;
  final String? description508;
  final String? secondaryCreator;
  final List<String>? album;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    title: json["title"],
    photographer:
    json["photographer"] == null ? null : json["photographer"],
    keywords: json["keywords"] == null
        ? null
        : List<String>.from(json["keywords"].map((x) => x)),
    location: json["location"] == null ? null : json["location"],
    nasaId: json["nasa_id"],
    dateCreated: DateTime.parse(json["date_created"]),
    description: json["description"],
    description508:
    json["description_508"] == null ? null : json["description_508"],
    secondaryCreator: json["secondary_creator"] == null
        ? null
        : json["secondary_creator"],
    album: json["album"] == null
        ? null
        : List<String>.from(json["album"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "title": title,
    "photographer": photographer == null ? null : photographer,
    "keywords": keywords == null
        ? null
        : List<dynamic>.from(keywords!.map((x) => x)),
    "location": location == null ? null : location,
    "nasa_id": nasaId,
    "date_created": dateCreated?.toIso8601String(),
    "description": description,
    "description_508": description508 == null ? null : description508,
    "secondary_creator": secondaryCreator == null ? null : secondaryCreator,
    "album":
    album == null ? null : List<dynamic>.from(album!.map((x) => x)),
  };
}

enum Center { AFRC, JPL, MSFC, JSC, GRC, HQ, KSC, ARC }

enum MediaType { IMAGE, VIDEO }

class ItemLink {
  ItemLink({
    required this.href,
  });

  final String href;

  factory ItemLink.fromJson(Map<String, dynamic> json) => ItemLink(
    href: json["href"],
  );

  Map<String, dynamic> toJson() => {
    "href": href,
  };
}

enum Rel { PREVIEW, CAPTIONS }

class CollectionLink {
  CollectionLink({
    required this.rel,
    required this.prompt,
    required this.href,
  });

  final String rel;
  final String prompt;
  final String href;

  factory CollectionLink.fromJson(Map<String, dynamic> json) => CollectionLink(
    rel: json["rel"],
    prompt: json["prompt"],
    href: json["href"],
  );

  Map<String, dynamic> toJson() => {
    "rel": rel,
    "prompt": prompt,
    "href": href,
  };
}

class Metadata {
  Metadata({
    required this.totalHits,
  });

  final int totalHits;

  factory Metadata.fromJson(Map<String, dynamic> json) => Metadata(
    totalHits: json["total_hits"],
  );

  Map<String, dynamic> toJson() => {
    "total_hits": totalHits,
  };
}
