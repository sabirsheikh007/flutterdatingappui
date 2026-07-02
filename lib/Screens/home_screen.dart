import 'package:flutter/material.dart';
import '../models/profile.dart';
import '../theme.dart';
import '../widgets/top_bar.dart';
import '../widgets/bottom_nav.dart';
import '../widgets/swipe_card.dart';
import 'Chat.dart';
import 'profile_detail_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late List<Profile> _stack;
  int _navIndex = 0;

  @override
  void initState() {
    super.initState();
    _stack = List.of(sampleProfiles.reversed);
  }

  void _handleSwipe(SwipeDirection dir) {
    setState(() {
      if (_stack.isNotEmpty) _stack.removeLast();
    });
  }

  void _openDetails(Profile p) {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (_) => ProfileDetailScreen(profile: p)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: const TopBar(),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(16, 4, 16, 12),
        child: _stack.isEmpty
            ? const Center(
                child: Text(
                  'No more profiles today.\nCheck back tomorrow!',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: AppColors.textSecondary, fontSize: 15),
                ),
              )
            : Stack(
                children: [
                  for (int i = 0; i < _stack.length; i++)
                    Positioned.fill(
                      child: SwipeCard(
                        key: ValueKey(_stack[i].name),
                        profile: _stack[i],
                        isFront: i == _stack.length - 1,
                        onTapDetails: () => _openDetails(_stack[i]),
                        onSwiped: _handleSwipe,
                      ),
                    ),
                ],
              ),
      ),
      bottomNavigationBar: BottomNav(
        currentIndex: _navIndex,
        onTap: (i) {
          if (i == 3) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => const ChatScreen(),
              ),
            );
            return;
          }


          setState(() {
            _navIndex = i;
          });
        },
      ),
    );
  }
}
