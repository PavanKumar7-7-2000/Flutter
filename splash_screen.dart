
import 'package:flutter/material.dart';

import '../utils/colors.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  late Animation<double> animation;
  late AnimationController animationController;

  @override
  void initState() {
    animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 2))
          ..forward();
    animation =
        CurvedAnimation(parent: animationController, curve: Curves.linear);
    
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (_, constraints) {
        final maxWidth = constraints.maxWidth * 0.7;
        if (constraints.maxWidth < 600) {
          return Scaffold(
            backgroundColor: AppColor.colorLight,
            body: Center(
                child: ScaleTransition(
              scale: animation,
              child: Container(
                  decoration: BoxDecoration(
                      color: AppColor.colorLight,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.blueGrey.shade100,
                          blurRadius: 15.0,
                          spreadRadius: 1.0,
                          offset: const Offset(4.0, 4.0),
                        ),
                        const BoxShadow(
                          color: Colors.white,
                          blurRadius: 15.0,
                          spreadRadius: 1.0,
                          offset: Offset(-4.0, -4.0),
                        )
                      ]),
                  child: Icon(
                    Icons.shopping_cart,
                    size: maxWidth,
                    color: Colors.black,
                  )),
            )),
          );
        } else {
          return Container(
            color: AppColor.colorLight,
          );
        }
      },
    );
  }
}
