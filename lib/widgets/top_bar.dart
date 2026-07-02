import 'package:flutter/material.dart';
import '../theme.dart';

class TopBar extends StatelessWidget implements PreferredSizeWidget {
  final int dailyCount;
  final bool hasNotification;

  const TopBar({
    super.key,
    this.dailyCount = 25,
    this.hasNotification = true,
  });

  @override
  Size get preferredSize => const Size.fromHeight(56);

  Widget _circleIcon(IconData icon) {
    return Container(
      width: 40,
      height: 40,
      decoration: const BoxDecoration(
        color: AppColors.cardWhite,
        shape: BoxShape.circle,
      ),
      child: Icon(icon, size: 20, color: AppColors.textPrimary),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: false,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
        child: Row(
          children: [
            _circleIcon(Icons.menu),
            const SizedBox(width: 10),
            Expanded(
              child: Container(
                height: 36,
                padding: const EdgeInsets.symmetric(horizontal: 14),
                decoration: BoxDecoration(
                  color: AppColors.cardWhite,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 8,
                      height: 8,
                      decoration: const BoxDecoration(
                        color: AppColors.accent,
                        shape: BoxShape.circle,
                      ),
                    ),
                    const SizedBox(width: 8),
                    Text(
                      'Daily $dailyCount',
                      style: const TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 14,
                        color: AppColors.textPrimary,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(width: 10),
            _circleIcon(Icons.bolt_outlined),
            const SizedBox(width: 10),
            _circleIcon(Icons.track_changes_outlined),
            const SizedBox(width: 10),
            Stack(
              clipBehavior: Clip.none,
              children: [
                _circleIcon(Icons.notifications_none_rounded),
                if (hasNotification)
                  Positioned(
                    right: 2,
                    top: 2,
                    child: Container(
                      width: 9,
                      height: 9,
                      decoration: BoxDecoration(
                        color: AppColors.accent,
                        shape: BoxShape.circle,
                        border: Border.all(color: AppColors.cardWhite, width: 1.5),
                      ),
                    ),
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
