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

    var path = Path();
    path.moveTo(0, size.height / 2);
    path.lineTo(size.width, size.height / 2);
    canvas.drawPath(path, paint);

    //canvas.drawLine(startingpoint, endPoint, paint);
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
