// --- Chat User Model ---
class ChatUserModel {
  final String id;
  final String name;
  final String imageUrl;
  final String lastMessage;
  final String time;
  final int unreadCount;
  final bool isOnline;

  ChatUserModel({
    required this.id,
    required this.name,
    required this.imageUrl,
    required this.lastMessage,
    required this.time,
    this.unreadCount = 0,
    this.isOnline = false,
  });
}
