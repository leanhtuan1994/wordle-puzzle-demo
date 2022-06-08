import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoaderOverlayWidget extends StatelessWidget {
  const LoaderOverlayWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: SpinKitFoldingCube(
        size: 24,
        color: Colors.amber,
      ),
    );
  }
}
