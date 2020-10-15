import 'package:flutter/material.dart';
import 'dart:math' as math;

class TextAnimation extends StatefulWidget {
  @override
  _TextAnimationState createState() { _TextAnimationState()};
  //for multiple line
}

class _TextAnimationState extends State<TextAnimation>
    with TickerProviderStateMixin {
  Animation<double> animation;
  AnimationController controller;
  Tween<double> _rotationTween = Tween(begin: -math.pi, end: math.pi);
  double _redius = 110;

  @override
  void initState() {
    super.initState();
    controller =
        AnimationController(vsync: this, duration: Duration(seconds: 5));

    animation = _rotationTween.animate(controller)
      ..addListener(() {
        setState(() {});
      })
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          controller.repeat();
        } else if (status == AnimationStatus.dismissed) {
          controller.forward();
        }
      });

    controller.forward();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: CustomPaint(
              painter: ShapePainter(_redius, 50, animation.value),
              child: Container(),
            ),
          ),
          Text(
            'redius ',
            style: TextStyle(color: Colors.white),
          ),
          Slider(
            value: _redius,
            max: 200,
            onChanged: (value) {
              setState(() {
                _redius = value;
              });
            },
          ),
        ],
      ),
    );
  }
}

class ShapePainter extends CustomPainter {
  final double radius;
  final double radius2;
  final double rotation;
  ShapePainter(this.radius, this.radius2, this.rotation);
  @override
  void paint(Canvas canvas, Size size) {
    var paint1 = Paint()
      ..color = Colors.teal
      ..strokeWidth = 2
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    var paint2 = Paint()
      ..color = Colors.red
      ..strokeWidth = 20
      ..style = PaintingStyle.fill
      ..strokeCap = StrokeCap.round;

    var paint3 = Paint()
      ..color = Colors.yellow
      ..strokeWidth = 2
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    var paint4 = Paint()
      ..color = Colors.cyan
      ..strokeWidth = 2
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    Offset center = Offset(size.width / 2, size.height / 2);
    Offset dotPosittion = Offset(radius * math.cos(rotation) + center.dx,
        radius * math.sin(rotation) + center.dy);
    canvas.drawCircle(center, radius, paint1);
    canvas.drawCircle(dotPosittion, 5, paint2);
    canvas.drawCircle(
        center,
        math.cos(rotation) >= 0
            ? radius * math.cos(rotation)
            : -radius * math.cos(rotation),
        paint3);
    canvas.drawLine(center,
        Offset(radius * math.cos(rotation) + center.dx, center.dy), paint4);
    canvas.drawLine(center, dotPosittion, paint4);
    canvas.drawLine(Offset(radius * math.cos(rotation) + center.dx, center.dy),
        dotPosittion, paint4);

    final textspan = TextSpan(
        text:
            "(${(dotPosittion.dx - center.dx).round()},${(dotPosittion.dy - center.dy).round()})",
        style: TextStyle(color: Colors.black, fontSize: 16));
    final txtPrinter = TextPainter(
      text: textspan,
      textDirection: TextDirection.ltr,
    );
    txtPrinter.layout(minWidth: 0, maxWidth: 100);
    txtPrinter.paint(canvas, dotPosittion);
    //canvas.drawLine(center, Offset(center.dx - radius, center.dy), paint4);
  }

  @override
  bool shouldRepaint(CustomPainter oldDeleget) {
    return true;
  }
}


