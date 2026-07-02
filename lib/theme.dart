import 'package:flutter/material.dart';

/// Central palette pulled from the reference design: warm cream background,
/// a single rose/pink accent, and near-black text.
class AppColors {
  static const background = Color(0xFFF3ECE6);
  static const cardWhite = Color(0xFFFFFFFF);
  static const accent = Color(0xFFE94D6E); // rose/pink accent
  static const accentSoft = Color(0xFFFCE4E9);
  static const textPrimary = Color(0xFF1E1B1A);
  static const textSecondary = Color(0xFF9A928C);
  static const divider = Color(0xFFEDE6DF);
  static const badgeMatch = Color(0xFF3FA7A0); // teal-blue "match" dot
  static const badgeTrust = Color(0xFF2FB37C); // green "trust" dot
  static const badgeReply = Color(0xFFE0A93A); // amber "reply" dot
  static const online = Color(0xFF35C46A);
}

class AppText {
  static const label = TextStyle(
    fontSize: 13,
    color: AppColors.textSecondary,
    fontWeight: FontWeight.w500,
  );
  static const value = TextStyle(
    fontSize: 15,
    color: AppColors.textPrimary,
    fontWeight: FontWeight.w700,
  );
  static const valueSub = TextStyle(
    fontSize: 12,
    color: AppColors.textSecondary,
    fontWeight: FontWeight.w400,
  );
}
