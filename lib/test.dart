import 'package:flutter/material.dart';

class TextAnimation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
      ..color = Colors.white
      ..strokeWidth = 2
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    //Offset startingpoint = Offset(0, size.height / 2);
    //Offset endPoint = Offset(size.width - 20, size.height / 2);
    //Offset centerPoint = Offset(size.width / 2, size.height / 2);
    var path = Path();
    //path.moveTo(20, size.height / 2);
    //path.lineTo(size.width, size.height / 2);
    //canvas.drawPath(path, paint);
    path.addOval(Rect.fromCircle(
        center: Offset(size.width / 2, size.height / 2), radius: 100));
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
