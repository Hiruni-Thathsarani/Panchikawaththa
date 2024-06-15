import 'package:flutter/material.dart';

class AnimatedDigitDisplay extends StatefulWidget {
  final int count;

  const AnimatedDigitDisplay({Key? key, required this.count}) : super(key: key);

  @override
  _AnimatedDigitDisplayState createState() => _AnimatedDigitDisplayState();
}

class _AnimatedDigitDisplayState extends State<AnimatedDigitDisplay>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<int> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 3),
    );

    _animation = IntTween(begin: 0, end: widget.count).animate(_controller)
      ..addListener(() {
        setState(() {});
      });

    _controller.forward(from: 0);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            _animation.value.toString(),
            style: TextStyle(
              fontSize: 100,
              fontWeight: FontWeight.bold,
              foreground: Paint()
                ..shader = LinearGradient(
                  colors: <Color>[Colors.orange, Colors.deepOrange],
                ).createShader(Rect.fromLTWH(0.0, 0.0, 200.0, 70.0)),
            ),
          ),
          SizedBox(height: 5),
          Text(
            '${_getMonthName(DateTime.now().subtract(Duration(hours: 2)).month)}, '
            '${_getMonthName(DateTime.now().subtract(Duration(hours: 1)).month)}, '
            '${_getMonthName(DateTime.now().month)}',
            style: TextStyle(fontSize: 16),
          ),
        ],
      ),
    );
  }

  String _getMonthName(int month) {
    switch (month) {
      case 1:
        return 'January';
      case 2:
        return 'February';
      case 3:
        return 'March';
      case 4:
        return 'April';
      case 5:
        return 'May';
      case 6:
        return 'June';
      case 7:
        return 'July';
      case 8:
        return 'August';
      case 9:
        return 'September';
      case 10:
        return 'October';
      case 11:
        return 'November';
      case 12:
        return 'December';
      default:
        return '';
    }
  }
}
