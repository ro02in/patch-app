class TradeRequestDTO {
  final String senderId;
  final String receiverId;
  final int badgeOfferedId;
  final int badgeRequestedId;

  TradeRequestDTO({
    required this.senderId,
    required this.receiverId,
    required this.badgeOfferedId,
    required this.badgeRequestedId,
  });

  Map<String, dynamic> toJson() {
    return {
      'senderId': senderId,
      'receiverId': receiverId,
      'badgeOfferedId': badgeOfferedId,
      'badgeRequestedId': badgeRequestedId,
    };
  }

  factory TradeRequestDTO.fromJson(Map<String, dynamic> json) {
    return TradeRequestDTO(
      senderId: json['senderId'],
      receiverId: json['receiverId'],
      badgeOfferedId: json['badgeOfferedId'],
      badgeRequestedId: json['badgeRequestedId'],
    );
  }
}
