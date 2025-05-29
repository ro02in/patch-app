import 'dart:ffi';
import 'dart:typed_data'; //stackoverflow.com/questions/49016508/what-is-the-dart-equivalent-of-java-byte

class PatchModel {
  final Long patchId;
  final String description;
  final String ownerGoogleId;
  final Uint8List pictureData;
  final bool isPublic;
  final String placement;
  final String klubbmasteri;
  final String patchName;
  final String color;

  PatchModel({
    required this.patchId,
    required this.description,
    required this.ownerGoogleId,
    required this.pictureData,
    required this.isPublic,
    required this.placement,
    required this.klubbmasteri,
    required this.patchName,
    required this.color,
  });

  factory PatchModel.fromJson(Map<String, dynamic> json) {
    return PatchModel(
      patchId: json['patchId'],
      ownerGoogleId: json['ownerGoogleId'],
      description: json['description'] ?? '',
      pictureData: Uint8List.fromList(List<int>.from(json['pictureData'])),
      isPublic: json['isPublic'] ?? '',
      placement: json['placement'] ?? '',
      klubbmasteri: json['klubbmasteri'] ?? '',
      patchName: json['patchName'] ?? '',
      color: json['color'] ?? '',
    );
  }

  Map<String, dynamic> toJson() =>
      {
        'patchId': patchId,
        'description': description,
        'ownerGoogleId': ownerGoogleId,
        'pictureData': pictureData,
        'isPublic': isPublic,
        'placement': placement,
        'klubbmasteri': klubbmasteri,
        'patchName': patchName,
        'color': color,
      };
}
