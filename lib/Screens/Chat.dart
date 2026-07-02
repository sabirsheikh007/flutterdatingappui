
// --- Main Chat Screen ---
import 'package:flutter/material.dart';
import '../Model/ChatUserModel.dart';
import '../Model/StoryModel.dart';
import 'StoryView.dart';

// --- Main Chat Screen ---
class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  int _currentIndex = 0;

  // --- Fake Story Data ---
  final List<StoryModel> _stories = [
    StoryModel(
      id: 'my',
      name: 'Your Story',
      imageUrl: 'https://i.pravatar.cc/150?img=1',
      isMyStory: true,
    ),
    StoryModel(
      id: '1',
      name: 'Sophia',
      imageUrl: 'https://i.pravatar.cc/150?img=5',
    ),
    StoryModel(
      id: '2',
      name: 'Emma',
      imageUrl: 'https://i.pravatar.cc/150?img=9',
    ),
    StoryModel(
      id: '3',
      name: 'Olivia',
      imageUrl: 'https://i.pravatar.cc/150?img=16',
      isViewed: true,
    ),
    StoryModel(
      id: '4',
      name: 'Ava',
      imageUrl: 'https://i.pravatar.cc/150?img=20',
    ),
    StoryModel(
      id: '5',
      name: 'Isabella',
      imageUrl: 'https://i.pravatar.cc/150?img=23',
      isViewed: true,
    ),
    StoryModel(
      id: '6',
      name: 'Mia',
      imageUrl: 'https://i.pravatar.cc/150?img=25',
    ),
    StoryModel(
      id: '7',
      name: 'Luna',
      imageUrl: 'https://i.pravatar.cc/150?img=28',
      isViewed: true,
    ),
    StoryModel(
      id: '8',
      name: 'Chloe',
      imageUrl: 'https://i.pravatar.cc/150?img=32',
    ),
  ];

  // --- Fake Chat User Data ---
  final List<ChatUserModel> _chatUsers = [
    ChatUserModel(
      id: '1',
      name: 'Sophia Anderson',
      imageUrl: 'https://i.pravatar.cc/150?img=5',
      lastMessage: 'Hey! Are you coming to the party tonight? 🎉',
      time: '2:34 PM',
      unreadCount: 3,
      isOnline: true,
    ),
    ChatUserModel(
      id: '2',
      name: 'Emma Watson',
      imageUrl: 'https://i.pravatar.cc/150?img=9',
      lastMessage: 'That pink dress looks amazing on you! 💕',
      time: '1:20 PM',
      unreadCount: 1,
      isOnline: true,
    ),
    ChatUserModel(
      id: '3',
      name: 'Olivia Martinez',
      imageUrl: 'https://i.pravatar.cc/150?img=16',
      lastMessage: 'Sent a photo',
      time: '12:45 PM',
      unreadCount: 0,
      isOnline: false,
    ),
    ChatUserModel(
      id: '4',
      name: 'Ava Johnson',
      imageUrl: 'https://i.pravatar.cc/150?img=20',
      lastMessage: 'Can you send me the address?',
      time: '11:30 AM',
      unreadCount: 2,
      isOnline: true,
    ),
    ChatUserModel(
      id: '5',
      name: 'Isabella Brown',
      imageUrl: 'https://i.pravatar.cc/150?img=23',
      lastMessage: 'Lol that was so funny 😂',
      time: '10:15 AM',
      unreadCount: 0,
      isOnline: false,
    ),
    ChatUserModel(
      id: '6',
      name: 'Mia Davis',
      imageUrl: 'https://i.pravatar.cc/150?img=25',
      lastMessage: 'See you tomorrow! 🌸',
      time: '9:00 AM',
      unreadCount: 0,
      isOnline: false,
    ),
    ChatUserModel(
      id: '7',
      name: 'Luna Wilson',
      imageUrl: 'https://i.pravatar.cc/150?img=28',
      lastMessage: 'I love this song! 🎵',
      time: 'Yesterday',
      unreadCount: 0,
      isOnline: true,
    ),
    ChatUserModel(
      id: '8',
      name: 'Chloe Taylor',
      imageUrl: 'https://i.pravatar.cc/150?img=32',
      lastMessage: 'Thanks for the help! 🙏',
      time: 'Yesterday',
      unreadCount: 0,
      isOnline: false,
    ),
    ChatUserModel(
      id: '9',
      name: 'Lily Thomas',
      imageUrl: 'https://i.pravatar.cc/150?img=35',
      lastMessage: 'Let\'s plan the trip 🌺',
      time: 'Monday',
      unreadCount: 5,
      isOnline: false,
    ),
    ChatUserModel(
      id: '10',
      name: 'Grace Harris',
      imageUrl: 'https://i.pravatar.cc/150?img=38',
      lastMessage: 'You: Sure, I\'ll be there!',
      time: 'Monday',
      unreadCount: 0,
      isOnline: false,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Chat',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 22,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.camera_alt_outlined),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              showSearch(
                context: context,
                delegate: _ChatSearchDelegate(_chatUsers),
              );
            },
          ),
          PopupMenuButton<String>(
            icon: const Icon(Icons.more_vert),
            onSelected: (value) {
              if (value == 'new_group') {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('New Group tapped'),
                    backgroundColor: Color(0xFFE91E63),
                  ),
                );
              } else if (value == 'settings') {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Settings tapped'),
                    backgroundColor: Color(0xFFE91E63),
                  ),
                );
              }
            },
            itemBuilder: (context) => [
              const PopupMenuItem(
                value: 'new_group',
                child: Row(
                  children: [
                    Icon(Icons.group_add, color: Color(0xFFE91E63)),
                    SizedBox(width: 12),
                    Text('New Group'),
                  ],
                ),
              ),
              const PopupMenuItem(
                value: 'settings',
                child: Row(
                  children: [
                    Icon(Icons.settings, color: Color(0xFFE91E63)),
                    SizedBox(width: 12),
                    Text('Settings'),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
      body: Column(
        children: [
          // --- Chat List ---
          Expanded(
            child: _buildChatList(),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color(0xFFE91E63),
        foregroundColor: Colors.white,
        elevation: 4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        onPressed: () {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Start new chat'),
              backgroundColor: Color(0xFFE91E63),
            ),
          );
        },
        child: const Icon(Icons.edit, size: 24),
      ),
    );
  }

  // --- Stories Section ---
  Widget _buildStoriesSection() {
    return Container(
      height: 140,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: const Color(0xFFE91E63).withOpacity(0.08),
            blurRadius: 10,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: ListView.separated(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        scrollDirection: Axis.horizontal,
        itemCount: _stories.length,
        separatorBuilder: (_, __) => const SizedBox(width: 14),
        itemBuilder: (context, index) {
          return _buildStoryItem(_stories[index]);
        },
      ),
    );
  }

  Widget _buildStoryItem(StoryModel story) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => StoryViewScreen(
              stories: _stories,
              initialIndex: _stories.indexOf(story),
            ),
          ),
        );
      },
      child: Column(
        children: [
          // Circle Story Avatar
          Container(
            padding: const EdgeInsets.all(3),
            decoration: story.isMyStory
                ? BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: const Color(0xFFE91E63),
                width: 2,
              ),
            )
                : story.isViewed
                ? BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: Colors.grey.shade300,
                width: 2,
              ),
            )
                : BoxDecoration(
              shape: BoxShape.circle,
              gradient: const LinearGradient(
                colors: [
                  Color(0xFFE91E63),
                  Color(0xFFF48FB1),
                  Color(0xFFFF80AB),
                  Color(0xFFE91E63),
                ],
                stops: [0.0, 0.3, 0.6, 1.0],
              ),
            ),
            child: Container(
              padding: const EdgeInsets.all(2),
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white,
              ),
              child: CircleAvatar(
                radius: 30,
                backgroundImage: NetworkImage(story.imageUrl),
              ),
            ),
          ),
          const SizedBox(height: 6),
          // Story Name
          SizedBox(
            width: 64,
            child: Text(
              story.name,
              textAlign: TextAlign.center,
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
              style: TextStyle(
                fontSize: 11,
                fontWeight: story.isViewed ? FontWeight.normal : FontWeight.w600,
                color: story.isViewed ? Colors.grey.shade600 : const Color(0xFF333333),
              ),
            ),
          ),
          // Add icon for My Story
          if (story.isMyStory)
            Positioned(
              bottom: 28,
              right: 0,
              child: Container(
                width: 20,
                height: 20,
                decoration: const BoxDecoration(
                  color: Color(0xFFE91E63),
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.add,
                  color: Colors.white,
                  size: 14,
                ),
              ),
            ),
        ],
      ),
    );
  }

  // --- Chat List ---
  Widget _buildChatList() {
    return Container(
      color: const Color(0xFFFFF0F3),
      child: ListView.separated(
        padding: const EdgeInsets.only(top: 8),
        itemCount: _chatUsers.length + 1,
        separatorBuilder: (_, index) {
          // Stories ke baad divider mat dikhana ho to:
          if (index == 0) {
            return const SizedBox.shrink();
          }

          return Divider(
            indent: 76,
            endIndent: 16,
            height: 1,
            color: const Color(0xFFF8BBD0).withOpacity(0.4),
          );
        },
        itemBuilder: (context, index) {
          if (index == 0) {
            return _buildStoriesSection();
          }

          return _buildChatItem(_chatUsers[index - 1]);
        },
      ),
    );
  }

  Widget _buildChatItem(ChatUserModel user) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => ConversationScreen(user: user),
          ),
        );
      },
      onLongPress: () {
        _showChatOptions(context, user);
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        child: Row(
          children: [
            // Avatar with Online Indicator
            Stack(
              children: [
                Container(
                  padding: const EdgeInsets.all(2),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: user.isOnline
                        ? const LinearGradient(
                      colors: [Color(0xFFE91E63), Color(0xFFF48FB1)],
                    )
                        : null,
                    border: user.isOnline
                        ? null
                        : Border.all(color: Colors.grey.shade200, width: 1),
                    color: user.isOnline ? null : Colors.grey.shade100,
                  ),
                  child: CircleAvatar(
                    radius: 28,
                    backgroundColor: Colors.grey.shade200,
                    backgroundImage: NetworkImage(user.imageUrl),
                  ),
                ),
                if (user.isOnline)
                  Positioned(
                    bottom: 2,
                    right: 2,
                    child: Container(
                      width: 12,
                      height: 12,
                      decoration: BoxDecoration(
                        color: const Color(0xFF4CAF50),
                        shape: BoxShape.circle,
                        border: Border.all(color: Colors.white, width: 2),
                      ),
                    ),
                  ),
              ],
            ),
            const SizedBox(width: 14),

            // Chat Info
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        user.name,
                        style: const TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                          color: Color(0xFF333333),
                        ),
                      ),
                      Text(
                        user.time,
                        style: TextStyle(
                          fontSize: 12,
                          color: user.unreadCount > 0
                              ? const Color(0xFFE91E63)
                              : Colors.grey.shade500,
                          fontWeight: user.unreadCount > 0
                              ? FontWeight.w600
                              : FontWeight.normal,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 4),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(
                          user.lastMessage,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                          style: TextStyle(
                            fontSize: 13,
                            color: user.unreadCount > 0
                                ? const Color(0xFF555555)
                                : Colors.grey.shade500,
                            fontWeight: user.unreadCount > 0
                                ? FontWeight.w500
                                : FontWeight.normal,
                          ),
                        ),
                      ),
                      if (user.unreadCount > 0) ...[
                        const SizedBox(width: 8),
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 8,
                            vertical: 2,
                          ),
                          decoration: BoxDecoration(
                            color: const Color(0xFFE91E63),
                            borderRadius: BorderRadius.circular(12),
                            boxShadow: [
                              BoxShadow(
                                color: const Color(0xFFE91E63).withOpacity(0.3),
                                blurRadius: 4,
                                offset: const Offset(0, 2),
                              ),
                            ],
                          ),
                          child: Text(
                            '${user.unreadCount}',
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 11,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showChatOptions(BuildContext context, ChatUserModel user) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        return SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 40,
                height: 4,
                margin: const EdgeInsets.only(top: 12, bottom: 8),
                decoration: BoxDecoration(
                  color: Colors.grey.shade300,
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
              ListTile(
                leading: const Icon(Icons.push_pin, color: Color(0xFFE91E63)),
                title: const Text('Pin Chat'),
                onTap: () => Navigator.pop(context),
              ),
              ListTile(
                leading: const Icon(Icons.notifications_off, color: Color(0xFFE91E63)),
                title: const Text('Mute Notifications'),
                onTap: () => Navigator.pop(context),
              ),
              ListTile(
                leading: const Icon(Icons.archive, color: Color(0xFFE91E63)),
                title: const Text('Archive Chat'),
                onTap: () => Navigator.pop(context),
              ),
              ListTile(
                leading: const Icon(Icons.delete_outline, color: Colors.red),
                title: const Text('Delete Chat', style: TextStyle(color: Colors.red)),
                onTap: () => Navigator.pop(context),
              ),
              const SizedBox(height: 8),
            ],
          ),
        );
      },
    );
  }


}



// --- Conversation Screen ---
class ConversationScreen extends StatefulWidget {
  final ChatUserModel user;

  const ConversationScreen({super.key, required this.user});

  @override
  State<ConversationScreen> createState() => _ConversationScreenState();
}

class _ConversationScreenState extends State<ConversationScreen> {
  final TextEditingController _messageController = TextEditingController();
  final List<Map<String, String>> _messages = [];
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    // Add some fake messages
    _messages.addAll([
      {'sender': 'them', 'text': 'Hey! How are you? 💕'},
      {'sender': 'me', 'text': 'Hi! I\'m doing great, thanks!'},
      {'sender': 'them', 'text': 'That\'s wonderful! Are you free tonight?'},
      {'sender': 'me', 'text': 'Yes, what\'s the plan? 🌸'},
      {'sender': 'them', 'text': widget.user.lastMessage},
    ]);
  }

  void _sendMessage() {
    if (_messageController.text.trim().isEmpty) return;
    setState(() {
      _messages.add({
        'sender': 'me',
        'text': _messageController.text.trim(),
      });
    });
    _messageController.clear();
    _scrollController.animateTo(
      _scrollController.position.maxScrollExtent,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
        title: Row(
          children: [
            CircleAvatar(
              radius: 18,
              backgroundImage: NetworkImage(widget.user.imageUrl),
            ),
            const SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.user.name,
                  style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                ),
                Text(
                  widget.user.isOnline ? 'online' : 'last seen recently',
                  style: const TextStyle(fontSize: 11, color: Color(0xFFFFCDD2)),
                ),
              ],
            ),
          ],
        ),
        actions: [
          IconButton(icon: const Icon(Icons.video_chat), onPressed: () {}),
          IconButton(icon: const Icon(Icons.call), onPressed: () {}),
          IconButton(icon: const Icon(Icons.more_vert), onPressed: () {}),
        ],
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: NetworkImage('https://picsum.photos/seed/pinkchatbg/800/1200'),
            fit: BoxFit.cover,
          ),
        ),
        child: Stack(
          children: [
            // Semi-transparent overlay for readability
            Container(color: Colors.white.withOpacity(0.85)),
            // Messages
            ListView.builder(
              controller: _scrollController,
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
              itemCount: _messages.length,
              itemBuilder: (context, index) {
                final msg = _messages[index];
                final isMe = msg['sender'] == 'me';
                return _buildMessageBubble(msg['text']!, isMe);
              },
            ),
          ],
        ),
      ),
      bottomNavigationBar: _buildMessageInput(),
    );
  }

  Widget _buildMessageBubble(String text, bool isMe) {
    return Align(
      alignment: isMe ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        margin: const EdgeInsets.only(bottom: 8, top: 4),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        constraints: BoxConstraints(
          maxWidth: MediaQuery.of(context).size.width * 0.75,
        ),
        decoration: BoxDecoration(
          gradient: isMe
              ? const LinearGradient(
            colors: [Color(0xFFE91E63), Color(0xFFF06292)],
          )
              : null,
          color: isMe ? null : Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: const Radius.circular(18),
            topRight: const Radius.circular(18),
            bottomLeft: isMe ? const Radius.circular(18) : const Radius.circular(4),
            bottomRight: isMe ? const Radius.circular(4) : const Radius.circular(18),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 5,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Text(
          text,
          style: TextStyle(
            color: isMe ? Colors.white : const Color(0xFF333333),
            fontSize: 14,
            height: 1.4,
          ),
        ),
      ),
    );
  }

  Widget _buildMessageInput() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: const Color(0xFFE91E63).withOpacity(0.08),
            blurRadius: 10,
            offset: const Offset(0, -3),
          ),
        ],
      ),
      child: SafeArea(
        child: Row(
          children: [
            IconButton(
              icon: const Icon(Icons.emoji_emotions_outlined, color: Color(0xFFE91E63)),
              onPressed: () {},
            ),
            Expanded(
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                decoration: BoxDecoration(
                  color: const Color(0xFFFFF0F3),
                  borderRadius: BorderRadius.circular(24),
                  border: Border.all(color: const Color(0xFFF8BBD0)),
                ),
                child: TextField(
                  controller: _messageController,
                  decoration: const InputDecoration(
                    hintText: 'Type a message...',
                    hintStyle: TextStyle(color: Color(0xFFB0BEC5)),
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.symmetric(vertical: 10),
                  ),
                  onSubmitted: (_) => _sendMessage(),
                ),
              ),
            ),
            IconButton(
              icon: const Icon(Icons.attach_file, color: Color(0xFFE91E63)),
              onPressed: () {},
            ),
            Container(
              margin: const EdgeInsets.only(left: 4),
              decoration: const BoxDecoration(
                color: Color(0xFFE91E63),
                shape: BoxShape.circle,
              ),
              child: IconButton(
                icon: const Icon(Icons.send, color: Colors.white, size: 20),
                onPressed: _sendMessage,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// --- Search Delegate ---
class _ChatSearchDelegate extends SearchDelegate<String> {
  final List<ChatUserModel> users;

  _ChatSearchDelegate(this.users);

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: const Icon(Icons.clear, color: Color(0xFFE91E63)),
        onPressed: () {
          query = '';
          showSuggestions(context);
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back, color: Color(0xFFE91E63)),
      onPressed: () => close(context, ''),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    final results = users
        .where((u) => u.name.toLowerCase().contains(query.toLowerCase()))
        .toList();
    return ListView.builder(
      itemCount: results.length,
      itemBuilder: (context, index) {
        final user = results[index];
        return ListTile(
          leading: CircleAvatar(
            backgroundImage: NetworkImage(user.imageUrl),
          ),
          title: Text(user.name),
          subtitle: Text(user.lastMessage),
          onTap: () => close(context, user.id),
        );
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    if (query.isEmpty) {
      return const Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.search, size: 48, color: Color(0xFFF48FB1)),
            SizedBox(height: 12),
            Text(
              'Search for conversations',
              style: TextStyle(color: Color(0xFFB0BEC5), fontSize: 16),
            ),
          ],
        ),
      );
    }
    return buildResults(context);
  }

  @override
  ThemeData appBarTheme(BuildContext context) {
    return Theme.of(context).copyWith(
      appBarTheme: const AppBarTheme(
        backgroundColor: Colors.white,
        foregroundColor: Color(0xFFE91E63),
        elevation: 0,
      ),
      inputDecorationTheme: const InputDecorationTheme(
        hintStyle: TextStyle(color: Color(0xFFB0BEC5)),
        border: InputBorder.none,
      ),
      textTheme: const TextTheme(
        titleLarge: TextStyle(color: Color(0xFF333333)),
      ),
    );
  }
}

