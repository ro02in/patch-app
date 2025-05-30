import 'dart:ffi';
import 'dart:typed_data';

class TradeRequestModel {
  final int tradeId;
  final int createdId;
  final int reciverId;
  final int senderId;
  final int status;
  final int patchOfferedId;
  final int patchRequestId;

  TradeRequestModel({
    required this.tradeId,
    required this.createdId,
    required this.reciverId,
    required this.senderId,
    required this.status,
    required this.patchOfferedId,
    required this.patchRequestId,
  });

  factory TradeRequestModel.fromJson(Map<String, dynamic> json) {
    return TradeRequestModel(
      tradeId: json['tradeId'],
      createdId: json['createdId'],
      reciverId: json['reciverId'] ?? '',
      senderId: json['senderId'] ?? '',
      status: json['status'] ?? '',
      patchOfferedId: json['patchOfferedId'] ?? '',
      patchRequestId: json['patchRequestId'] ?? '',
    );
  }
 
  Map<String, dynamic> toJson() =>
      {
        'tradeId': tradeId,
        'createdId': createdId,
        'reciverId': reciverId,
        'senderId': senderId,
        'status': status,
        'patchOfferedId': patchOfferedId,
        'patchRequestId': patchRequestId,
      };
}
