import 'package:flutter/material.dart';
import '../theme.dart';

class BottomNav extends StatelessWidget {
  final int currentIndex;
  final ValueChanged<int> onTap;

  const BottomNav({super.key, required this.currentIndex, required this.onTap});

  static const _items = [
    (_NavIcon.home, 'Home'),
    (_NavIcon.dateNow, 'Date Now'),
    (_NavIcon.admirers, 'Admirers'),
    (_NavIcon.chat, 'Chat'),
    (_NavIcon.events, 'Events'),
  ];

  IconData _iconFor(_NavIcon icon) {
    switch (icon) {
      case _NavIcon.home:
        return Icons.home_rounded;
      case _NavIcon.dateNow:
        return Icons.play_circle_outline_rounded;
      case _NavIcon.admirers:
        return Icons.favorite_border_rounded;
      case _NavIcon.chat:
        return Icons.chat_bubble_outline_rounded;
      case _NavIcon.events:
        return Icons.calendar_today_outlined;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: AppColors.cardWhite,
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      padding: const EdgeInsets.only(top: 10, bottom: 4),
      child: SafeArea(
        top: false,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: List.generate(_items.length, (i) {
            final selected = i == currentIndex;
            final color = selected ? AppColors.accent : AppColors.textSecondary;
            return GestureDetector(
              onTap: () => onTap(i),
              behavior: HitTestBehavior.opaque,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(_iconFor(_items[i].$1), color: color, size: 24),
                  const SizedBox(height: 4),
                  Text(
                    _items[i].$2,
                    style: TextStyle(
                      color: color,
                      fontSize: 11,
                      fontWeight: selected ? FontWeight.w700 : FontWeight.w500,
                    ),
                  ),
                ],
              ),
            );
          }),
        ),
      ),
    );
  }
}

enum _NavIcon { home, dateNow, admirers, chat, events }
