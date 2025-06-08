import "package:flutter/material.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";

class SwooshPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final Rect rect = Rect.fromLTWH(0, 0, size.width, size.height * 0.3);
    final Gradient gradient = const LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      colors: <Color>[
        Color.fromRGBO(255, 69, 161, 1.0),
        Color.fromRGBO(210, 30, 103, 1.0)
      ],
    );

    final Paint paint = Paint()
      ..shader = gradient.createShader(rect)
      ..style = PaintingStyle.fill;

    final double height = 0.33;

    final Path path = Path()
      ..moveTo(0, size.height * height)
      ..quadraticBezierTo(0, size.height * (height * 0.5), size.width * 0.5,
          size.height * (height * 0.5))
      ..quadraticBezierTo(
          size.width, size.height * (height * 0.5), size.width, 0)
      ..lineTo(0, 0)
      ..close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class MainLayout extends ConsumerWidget {
  const MainLayout({super.key, required this.title, required this.body});
  final String title;
  final Widget body;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Stack(
        children: [
          // Background swoosh
          CustomPaint(
            size: MediaQuery.of(context).size,
            painter: SwooshPainter(),
          ),
          // Foreground content
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 20, 0, 60),
            child: SingleChildScrollView(
              padding: const EdgeInsets.fromLTRB(30, 60, 30, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Text(
                        title,
                        style:
                            Theme.of(context).textTheme.displayLarge?.copyWith(
                                  color: Colors.black87,
                                ),
                      ),
                    ],
                  ),
                  body,
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
