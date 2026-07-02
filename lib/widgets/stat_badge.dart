import 'package:flutter/material.dart';

class StatBadge extends StatelessWidget {
  final Color dotColor;
  final String text;
  final bool dark; // true = translucent dark chip (over photo), false = light chip

  const StatBadge({
    super.key,
    required this.dotColor,
    required this.text,
    this.dark = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      decoration: BoxDecoration(
        color: dark ? Colors.black.withOpacity(0.35) : const Color(0xFFF5F0EC),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 7,
            height: 7,
            decoration: BoxDecoration(color: dotColor, shape: BoxShape.circle),
          ),
          const SizedBox(width: 6),
          Text(
            text,
            style: TextStyle(
              color: dark ? Colors.white : const Color(0xFF1E1B1A),
              fontSize: 12,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}
