import 'dart:math' as math;

import 'package:flutter/material.dart';

/// Gauge busur setengah-lingkaran menunjukkan happiness 0-100 (`docs/DATA_MODELS.md`
/// `Tamagotchi.happiness`) — mendekati bentuk arc di desain Figma layar Tamagotchi.
class HappinessArc extends StatelessWidget {
  final int happiness;
  final Widget child;

  const HappinessArc({super.key, required this.happiness, required this.child});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 260,
      width: double.infinity,
      child: CustomPaint(
        painter: _ArcPainter(happiness: happiness.clamp(0, 100) / 100),
        child: Align(
          alignment: const Alignment(0, 0.35),
          child: child,
        ),
      ),
    );
  }
}

class _ArcPainter extends CustomPainter {
  final double happiness;
  _ArcPainter({required this.happiness});

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height * 0.55);
    final radius = size.width * 0.42;
    const strokeWidth = 10.0;

    final bgPaint = Paint()
      ..color = const Color(0xFFD9E8C4)
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth
      ..strokeCap = StrokeCap.round;

    final fgPaint = Paint()
      ..color = const Color(0xFF4E8A2E)
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth
      ..strokeCap = StrokeCap.round;

    const startAngle = math.pi;
    const sweepTotal = math.pi;
    final rect = Rect.fromCircle(center: center, radius: radius);

    canvas.drawArc(rect, startAngle, sweepTotal, false, bgPaint);
    canvas.drawArc(rect, startAngle, sweepTotal * happiness, false, fgPaint);
  }

  @override
  bool shouldRepaint(covariant _ArcPainter oldDelegate) => oldDelegate.happiness != happiness;
}
