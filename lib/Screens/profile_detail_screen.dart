import 'package:flutter/material.dart';
import '../models/profile.dart';
import '../theme.dart';
import '../widgets/top_bar.dart';
import '../widgets/stat_badge.dart';
import '../widgets/detail_row.dart';

class ProfileDetailScreen extends StatelessWidget {
  final Profile profile;
  const ProfileDetailScreen({super.key, required this.profile});

  @override
  Widget build(BuildContext context) {
    final p = profile;
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: const TopBar(),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(16, 4, 16, 24),
        children: [
          // Photo header card
          ClipRRect(
            borderRadius: BorderRadius.circular(28),
            child: Stack(
              children: [
                SizedBox(
                  height: 220,
                  width: double.infinity,
                  child: Image.network(p.imageUrl, fit: BoxFit.cover),
                ),
                Container(
                  height: 220,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [Colors.transparent, Colors.black.withOpacity(0.75)],
                      stops: const [0.4, 1.0],
                    ),
                  ),
                ),
                Positioned(
                  right: 16,
                  top: 16,
                  child: Container(
                    width: 40,
                    height: 40,
                    decoration: const BoxDecoration(
                      color: AppColors.cardWhite,
                      shape: BoxShape.circle,
                    ),
                    alignment: Alignment.center,
                    child: const Text('🌹', style: TextStyle(fontSize: 18)),
                  ),
                ),
                Positioned(
                  left: 16,
                  right: 16,
                  bottom: 14,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          StatBadge(dark: true, dotColor: AppColors.badgeMatch, text: '${p.matchPercent}% Match'),
                          const SizedBox(width: 8),
                          StatBadge(dark: true, dotColor: AppColors.badgeTrust, text: '${p.trustPercent}% Trust'),
                          const SizedBox(width: 8),
                          StatBadge(dark: true, dotColor: AppColors.badgeReply, text: '${p.replyTime} Reply'),
                        ],
                      ),
                      const SizedBox(height: 8),
                      Row(
                        children: [
                          Container(
                            width: 9,
                            height: 9,
                            margin: const EdgeInsets.only(right: 6),
                            decoration: const BoxDecoration(
                              color: AppColors.online,
                              shape: BoxShape.circle,
                            ),
                          ),
                          Text(
                            p.name,
                            style: const TextStyle(
                                color: Colors.white, fontSize: 22, fontWeight: FontWeight.w700),
                          ),
                          const SizedBox(width: 6),
                          Text('${p.age}',
                              style: const TextStyle(color: Colors.white, fontSize: 20)),
                        ],
                      ),
                      const SizedBox(height: 4),
                      Text(
                        '${p.location} · ${p.distanceKm.toStringAsFixed(0)} km away',
                        style: const TextStyle(color: Colors.white70, fontSize: 12, fontWeight: FontWeight.w500),
                      ),
                      Text(
                        '${p.occupation} · ${p.height}',
                        style: const TextStyle(color: Colors.white70, fontSize: 12, fontWeight: FontWeight.w500),
                      ),
                      Text(
                        p.relationshipGoal,
                        style: const TextStyle(color: Colors.white70, fontSize: 12, fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          if (p.about.isNotEmpty) ...[
            const SizedBox(height: 24),
            const Text(
              'ABOUT',
              style: TextStyle(
                color: AppColors.accent,
                fontSize: 12,
                fontWeight: FontWeight.w700,
                letterSpacing: 0.6,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              p.about,
              style: const TextStyle(
                fontSize: 15,
                height: 1.4,
                color: AppColors.textPrimary,
              ),
            ),
          ],

          const SizedBox(height: 24),
          const Text(
            'THE BASICS',
            style: TextStyle(
              color: AppColors.accent,
              fontSize: 12,
              fontWeight: FontWeight.w700,
              letterSpacing: 0.6,
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 10),
            padding: const EdgeInsets.symmetric(horizontal: 16),
            decoration: BoxDecoration(
              color: AppColors.cardWhite,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              children: [
                DetailRow(
                  icon: Icons.cake_outlined,
                  label: 'Age',
                  value: '${p.age} years old',
                  sub: p.birthDate.isEmpty ? null : p.birthDate,
                ),
                const Divider(height: 1, color: AppColors.divider),
                DetailRow(icon: Icons.straighten_rounded, label: 'Height', value: p.height),
                const Divider(height: 1, color: AppColors.divider),
                if (p.livesIn.isNotEmpty) ...[
                  DetailRow(
                    icon: Icons.people_outline_rounded,
                    label: 'Lives in',
                    value: p.livesIn.split(',').first,
                    sub: p.livesIn.contains(',')
                        ? p.livesIn.substring(p.livesIn.indexOf(',') + 1).trim()
                        : null,
                  ),
                  const Divider(height: 1, color: AppColors.divider),
                ],
                if (p.loveLanguage.isNotEmpty) ...[
                  DetailRow(
                    icon: Icons.favorite_border_rounded,
                    label: 'Love language',
                    value: p.loveLanguage.split('(').first.trim(),
                    sub: p.loveLanguage.contains('(')
                        ? p.loveLanguage.split('(').last.replaceAll(')', '')
                        : null,
                  ),
                  const Divider(height: 1, color: AppColors.divider),
                ],
                if (p.religion.isNotEmpty) ...[
                  DetailRow(icon: Icons.self_improvement_outlined, label: 'Religion', value: p.religion),
                  const Divider(height: 1, color: AppColors.divider),
                ],
                if (p.interestedIn.isNotEmpty) ...[
                  DetailRow(icon: Icons.list_alt_rounded, label: 'Interested in', value: p.interestedIn),
                  const Divider(height: 1, color: AppColors.divider),
                ],
                if (p.zodiac.isNotEmpty) ...[
                  DetailRow(
                    icon: Icons.wb_sunny_outlined,
                    label: 'Zodiac',
                    value: p.zodiac,
                    sub: p.zodiacTraits.isEmpty ? null : p.zodiacTraits,
                  ),
                  const Divider(height: 1, color: AppColors.divider),
                ],
                if (p.motherTongue.isNotEmpty) ...[
                  DetailRow(icon: Icons.translate_rounded, label: 'Mother tongue', value: p.motherTongue),
                  const Divider(height: 1, color: AppColors.divider),
                ],
                if (p.communicationStyle.isNotEmpty)
                  DetailRow(icon: Icons.phone_outlined, label: 'Communication style', value: p.communicationStyle),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
