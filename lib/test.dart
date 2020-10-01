import 'package:flutter/material.dart';

class TextAnimation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Animation'),
      ),
      body: CustomPaint(
        painter: ShapePainter(),
        child: Container(),
      ),
    );
  }
}

class ShapePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint()
      ..color = Colors.teal
      ..strokeWidth = 10
      ..strokeCap = StrokeCap.round;

    Offset startingpoint = Offset(0, size.height / 2);
    Offset endPoint = Offset(size.width - 20, size.height / 2);

    canvas.drawLine(startingpoint, endPoint, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDeleget) {
    return null;
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
