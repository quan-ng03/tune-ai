import 'package:flutter/material.dart';
import 'dart:math';

class WaveRing extends StatefulWidget {
  final bool isListening;
  final VoidCallback onTap;

  const WaveRing({
    super.key,
    required this.isListening,
    required this.onTap,
  });

  @override
  State<WaveRing> createState() => WaveRingState();
}

class WaveRingState extends State<WaveRing>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..repeat();
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: SizedBox(
        height: 200,
        width: 200,
        child: Stack(
          alignment: Alignment.center,
          children: [
            AnimatedBuilder(
              animation: _controller,
              builder: (_, __) {
                return CustomPaint(
                  painter: WaveRingPainter(_controller.value),
                  size: Size(200, 200),
                );
              },
            ),
            Container(
              width: 90,
              height: 90,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: widget.isListening ? Colors.red : Colors.deepPurple,
                boxShadow: [
                  BoxShadow(
                    color: Colors.deepPurple.withOpacity(0.5),
                    blurRadius: 25,
                    spreadRadius: 5,
                  ),
                ],
              ),
              child: Icon(
                widget.isListening ? Icons.stop : Icons.mic,
                color: Colors.white,
                size: 40,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class WaveRingPainter extends CustomPainter {
  final double animationValue;

  WaveRingPainter(this.animationValue);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.deepPurple.withOpacity(0.4)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2;

    final center = size.center(Offset.zero);
    final radius = size.width * 0.45;
    final waveCount = 30;
    final waveRadius = 4.0;

    for (int i = 0; i < waveCount; i++) {
      final angle = (2 * pi / waveCount) * i;
      final anim = sin(animationValue * 2 * pi + angle) * 6;
      final dx = center.dx + cos(angle) * (radius + anim);
      final dy = center.dy + sin(angle) * (radius + anim);

      canvas.drawCircle(Offset(dx, dy), waveRadius, paint);
    }
  }

  @override
  bool shouldRepaint(covariant WaveRingPainter oldDelegate) =>
      oldDelegate.animationValue != animationValue;
}
