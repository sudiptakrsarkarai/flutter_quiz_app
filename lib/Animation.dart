import 'package:flutter/material.dart';
import 'dart:async';

class AnimationFade extends StatefulWidget {
  const AnimationFade({super.key});
  @override
  State<AnimationFade> createState() {
    return _AnimationFade();
  }
}

class _AnimationFade extends State<AnimationFade> {
  bool isFirst = true;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(Duration(seconds: 2), () {
      reload();
    });
  }

  void reload() {
    setState(() {
      if (isFirst) {
        isFirst = false;
      } else {
        isFirst = true;
      }
    });
  }

  @override
  Widget build(context) {
    return AnimatedCrossFade(
      duration: const Duration(seconds: 2),
      firstChild: Image.asset(
        'lib/quiz-logo.png',
        color: Color(0xff008dff),
      ),
      secondChild: Image.asset(
        'lib/quiz-logo.png',
        color: Color(0xffffffff),
      ),
      crossFadeState:
          isFirst ? CrossFadeState.showFirst : CrossFadeState.showSecond,
    );
  }
}

class textAnimated extends StatefulWidget {
  const textAnimated({super.key});
  @override
  State<textAnimated> createState() {
    return _textAnimatedState();
  }
}

class _textAnimatedState extends State<textAnimated> {
  bool isSelected = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(Duration(seconds: 2), () {
      restart();
    });
  }

  void restart() {
    setState(() {
      if (isSelected) {
        isSelected = false;
      } else {
        isSelected = true;
      }
    });
  }

  Widget build(context) {
    return AnimatedDefaultTextStyle(
      style: isSelected
          ? const TextStyle(
              fontSize: 28, color: Colors.white, fontWeight: FontWeight.bold)
          : const TextStyle(
              fontSize: 14.0, color: Colors.black, fontWeight: FontWeight.w100),
      duration: const Duration(milliseconds: 2000),
      child: const Text("Animate me!"),
    );
  }
}
