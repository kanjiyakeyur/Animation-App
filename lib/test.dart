import 'package:flutter/material.dart';
import 'dart:math' as math;

class TextAnimation extends StatefulWidget {
  @override
  _TextAnimationState createState() => _TextAnimationState();
}

class _TextAnimationState extends State<TextAnimation>
    with TickerProviderStateMixin {
  Animation<double> animation;
  AnimationController controller;
  Animation<double> rediusAnimation;
  Tween<double> _rotationTween = Tween(begin: -math.pi, end: math.pi);
  Tween<double> _rediusTween = Tween(begin: 0, end: 200);
  int _side = 3;
  double _redius = 50;

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
          controller.reverse();
        } else if (status == AnimationStatus.dismissed) {
          controller.forward();
        }
      });

    rediusAnimation = _rediusTween.animate(controller)
      ..addListener(() {})
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          controller.reverse();
        } else if (status == AnimationStatus.dismissed) {
          controller.forward();
        }
      });

    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: CustomPaint(
              painter:
                  ShapePainter(rediusAnimation.value, _side, animation.value),
              child: Container(),
            ),
          ),
          Text(
            'sides ' + _side.toString(),
            style: TextStyle(color: Colors.white),
          ),
          Slider(
            value: _side.toDouble(),
            max: 10,
            label: _side.toString(),
            divisions: 10,
            onChanged: (value) {
              setState(() {
                _side = value.toInt();
              });
            },
          ),
          Text(
            'redius ' + rediusAnimation.value.toString(),
            style: TextStyle(color: Colors.white),
          ),
          Slider(
            value: _redius,
            max: 250,
            onChanged: (value) {
              setState(() {
                _redius = value;
              });
            },
          ),
          Text(
            'Rotation' + animation.value.toString(),
            style: TextStyle(color: Colors.white),
          ),
        ],
      ),
    );
  }
}

class ShapePainter extends CustomPainter {
  final double redius;
  final int side;
  final double rotation;
  ShapePainter(this.redius, this.side, this.rotation);
  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint()
      ..color = Colors.teal
      ..strokeWidth = 2
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    var path = Path();
    var angle = (math.pi * 2) / side;
    Offset center = Offset(size.width / 2, size.height / 2);

    Offset startPoint =
        Offset(redius * math.cos(rotation), redius * math.sin(rotation));

    path.moveTo(startPoint.dx + center.dx, startPoint.dy + center.dy);

    for (int i = 1; i <= side; i++) {
      double dx = redius * math.cos(angle * i + rotation) + center.dx;
      double dy = redius * math.sin(angle * i + rotation) + center.dy;
      path.lineTo(dx, dy);
    }
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDeleget) {
    return false;
  }
}

//class ShapePainter extends CustomPainter{
//  @override
//  void paint(Canvas canvas,Size size){
//
//  }
//
//  @override
//  bool shouldRepaint(CustomPainter oldDeleget){
//    return null;
//  }
//}
