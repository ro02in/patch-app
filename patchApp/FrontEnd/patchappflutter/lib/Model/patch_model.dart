import 'dart:convert';
import 'dart:ffi';
import 'dart:typed_data'; //stackoverflow.com/questions/49016508/what-is-the-dart-equivalent-of-java-byte


class PatchModel {
  final int? patchId;
  final String description;
  final int? ownerId;
  final Uint8List? pictureData;
  final bool isPublic;
  final String placement;
  final String klubbmasteri;
  final String patchName;
  final String color;

  PatchModel({
    this.patchId,
    required this.description,
    required this.ownerId,
    this.pictureData,
    required this.isPublic,
    required this.placement,
    required this.klubbmasteri,
    required this.patchName,
    required this.color,
  });

  factory PatchModel.fromJson(Map<String, dynamic> json) {
    return PatchModel(
      patchId: json['patchId'],
      ownerId: json['ownerId'],
      description: json['description'] ?? '',
      pictureData: json['pictureData'],
      isPublic: json['isPublic'] ?? true,
      placement: json['placement'] ?? '',
      klubbmasteri: json['klubbmästeri'] ?? '',
      patchName: json['patchName'] ?? '',
      color: json['color'] ?? '',
    );
  }


  Map<String, dynamic> toJson() =>
      {
        'patchId': patchId,
        'description': description,
        'ownerId': ownerId,
        'pictureData': pictureData,
        'isPublic': isPublic,
        'placement': placement,
        'klubbmästeri': klubbmasteri,
        'patchName': patchName,
        'color': color,
      };
}
