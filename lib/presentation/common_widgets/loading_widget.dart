// Flutter imports:
import 'package:flutter/material.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      child: SizedBox.expand(
        child: Image.asset('assets/images/splash_image.jpg',fit: BoxFit.fitHeight),
      ),
    );
  }
}
