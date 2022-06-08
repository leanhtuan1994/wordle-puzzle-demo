import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class Skeleton extends StatefulWidget {
  const Skeleton({
    Key? key,
    this.height,
    this.width,
    this.borderRadius,
    this.child,
  }) : super(key: key);

  final double? height;
  final double? width;
  final double? borderRadius;
  final Widget? child;

  @override
  _SkeletonState createState() => _SkeletonState();
}

class _SkeletonState extends State<Skeleton> {
  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      child: widget.child != null
          ? widget.child!
          : Container(
              width: widget.width,
              height: widget.height,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(widget.borderRadius ?? 16),
                color: Colors.grey[200],
              ),
            ),
      baseColor: Colors.grey[200]!,
      highlightColor: Colors.grey[50]!,
    );
  }
}
