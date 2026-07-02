import 'package:flutter/material.dart';
import '../theme.dart';

class DetailRow extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;
  final String? sub;

  const DetailRow({
    super.key,
    required this.icon,
    required this.label,
    required this.value,
    this.sub,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 14),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 34,
            height: 34,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: AppColors.accentSoft,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Icon(icon, size: 17, color: AppColors.accent),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Text(label, style: AppText.label),
          ),
          Expanded(
            flex: 2,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(value, textAlign: TextAlign.right, style: AppText.value),
                if (sub != null) ...[
                  const SizedBox(height: 2),
                  Text(sub!, textAlign: TextAlign.right, style: AppText.valueSub),
                ],
              ],
            ),
          ),
        ],
      ),
    );
  }
}
