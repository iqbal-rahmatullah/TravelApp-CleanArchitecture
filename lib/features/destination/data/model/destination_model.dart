import 'package:travel_app_clean_architecture/features/destination/domain/entities/destination_entity.dart';

class DestinationModel extends DestinationEntity {
  DestinationModel(
      {required super.id,
      required super.name,
      required super.category,
      required super.cover,
      required super.rate,
      required super.rateCount,
      required super.location,
      required super.description,
      required super.images,
      required super.facilities});

  factory DestinationModel.fromJson(Map<String, dynamic> json) {
    return DestinationModel(
      id: json['id'],
      name: json['name'],
      category: json['category'],
      cover: json['cover'],
      rate: json['rate'],
      rateCount: json['rateCount'],
      location: json['location'],
      description: json['description'],
      images: (json['images'] as String).split(", "),
      facilities: (json['facilities'] as String).split(", "),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'category': category,
      'cover': cover,
      'rate': rate,
      'rateCount': rateCount,
      'location': location,
      'description': description,
      'images': images.join(", "),
      'facilities': facilities.join(", "),
    };
  }

  DestinationEntity get toEntity => DestinationEntity(
        id: id,
        name: name,
        category: category,
        cover: cover,
        rate: rate,
        rateCount: rateCount,
        location: location,
        description: description,
        images: images,
        facilities: facilities,
      );
}
