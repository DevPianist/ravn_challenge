import 'package:flutter/material.dart';

class FadeIn extends StatefulWidget {
  const FadeIn({
    Key? key,
    required this.child,
    this.duration = const Duration(milliseconds: 300),
  }) : super(key: key);

  final Widget child;
  final Duration duration;

  @override
  State<FadeIn> createState() => _FadeInState();
}

class _FadeInState extends State<FadeIn> with SingleTickerProviderStateMixin {
  AnimationController? controller;
  late Animation<double> animation;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animation,
      builder: (BuildContext context, Widget? child) {
        return Opacity(
          opacity: animation.value,
          child: widget.child,
        );
      },
    );
  }

  @override
  void initState() {
    super.initState();
    controller = AnimationController(duration: widget.duration, vsync: this);
    animation = CurvedAnimation(curve: Curves.easeOut, parent: controller!);
    controller?.forward();
  }

  @override
  void dispose() {
    controller!.dispose();
    super.dispose();
  }
}
