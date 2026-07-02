import 'package:flutter/material.dart';
import '../models/profile.dart';
import '../theme.dart';
import 'stat_badge.dart';

enum SwipeDirection { left, right, none }

class SwipeCard extends StatefulWidget {
  final Profile profile;
  final VoidCallback onTapDetails;
  final ValueChanged<SwipeDirection> onSwiped;
  final bool isFront;

  const SwipeCard({
    super.key,
    required this.profile,
    required this.onTapDetails,
    required this.onSwiped,
    this.isFront = true,
  });

  @override
  State<SwipeCard> createState() => _SwipeCardState();
}

class _SwipeCardState extends State<SwipeCard>
    with SingleTickerProviderStateMixin {
  Offset _drag = Offset.zero;
  late AnimationController _controller;
  Animation<Offset>? _resetAnim;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 260),
    )..addListener(() {
        if (_resetAnim != null) {
          setState(() => _drag = _resetAnim!.value);
        }
      });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _onPanUpdate(DragUpdateDetails d) {
    if (!widget.isFront) return;
    setState(() => _drag += d.delta);
  }

  void _onPanEnd(DragEndDetails d) {
    if (!widget.isFront) return;
    final threshold = MediaQuery.of(context).size.width * 0.28;
    if (_drag.dx.abs() > threshold) {
      final dir = _drag.dx > 0 ? SwipeDirection.right : SwipeDirection.left;
      widget.onSwiped(dir);
    } else {
      _resetAnim = Tween<Offset>(begin: _drag, end: Offset.zero)
          .animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut));
      _controller.forward(from: 0);
    }
  }

  @override
  Widget build(BuildContext context) {
    final angle = (_drag.dx / 300).clamp(-0.4, 0.4);
    final p = widget.profile;

    return Transform.translate(
      offset: _drag,
      child: Transform.rotate(
        angle: angle,
        child: GestureDetector(
          onPanUpdate: _onPanUpdate,
          onPanEnd: _onPanEnd,
          onTap: widget.onTapDetails,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(28),
            child: Stack(
              fit: StackFit.expand,
              children: [
                Image.network(p.imageUrl, fit: BoxFit.cover),
                // bottom gradient for text legibility
                Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Colors.transparent,
                        Colors.black.withOpacity(0.75),
                      ],
                      stops: const [0.55, 1.0],
                    ),
                  ),
                ),
                // top-left refresh / top-right menu
                Positioned(
                  top: 14,
                  left: 14,
                  right: 14,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _roundIcon(Icons.refresh_rounded),
                      _roundIcon(Icons.more_vert_rounded),
                    ],
                  ),
                ),
                // rose / like button
                Positioned(
                  right: 16,
                  bottom: 96,
                  child: Container(
                    width: 48,
                    height: 48,
                    decoration: const BoxDecoration(
                      color: AppColors.cardWhite,
                      shape: BoxShape.circle,
                    ),
                    alignment: Alignment.center,
                    child: const Text('🌹', style: TextStyle(fontSize: 22)),
                  ),
                ),
                // bottom info block
                Positioned(
                  left: 16,
                  right: 16,
                  bottom: 16,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          StatBadge(
                            dark: true,
                            dotColor: AppColors.badgeMatch,
                            text: '${p.matchPercent}% Match',
                          ),
                          const SizedBox(width: 8),
                          StatBadge(
                            dark: true,
                            dotColor: AppColors.badgeTrust,
                            text: '${p.trustPercent}% Trust',
                          ),
                          const SizedBox(width: 8),
                          StatBadge(
                            dark: true,
                            dotColor: AppColors.badgeReply,
                            text: '${p.replyTime} Reply',
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      Row(
                        children: [
                          Text(
                            p.name,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 24,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          const SizedBox(width: 8),
                          Text(
                            '${p.age}',
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 22,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          if (p.verified) ...[
                            const SizedBox(width: 6),
                            const Icon(Icons.verified_rounded,
                                color: AppColors.accent, size: 20),
                          ],
                        ],
                      ),
                      const SizedBox(height: 6),
                      _iconLine(Icons.location_on_outlined,
                          '${p.location} · ${p.distanceKm.toStringAsFixed(0)} km away'),
                      const SizedBox(height: 2),
                      _iconLine(Icons.work_outline_rounded,
                          '${p.occupation} · ${p.height}'),
                      const SizedBox(height: 2),
                      _iconLine(Icons.favorite_border_rounded, p.relationshipGoal),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _roundIcon(IconData icon) => Container(
        width: 34,
        height: 34,
        decoration: BoxDecoration(
          color: Colors.black.withOpacity(0.35),
          shape: BoxShape.circle,
        ),
        child: Icon(icon, color: Colors.white, size: 18),
      );

  Widget _iconLine(IconData icon, String text) => Row(
        children: [
          Icon(icon, color: Colors.white70, size: 14),
          const SizedBox(width: 6),
          Flexible(
            child: Text(
              text,
              style: const TextStyle(
                color: Colors.white70,
                fontSize: 13,
                fontWeight: FontWeight.w500,
              ),
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      );
}
