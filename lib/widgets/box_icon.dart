import 'package:flutter/material.dart';
import '../utils/constants.dart';

class BoxIcon extends StatelessWidget {
  final Widget child;
  final EdgeInsets? padding;
  final double? height, width;
  const BoxIcon(
      {Key? key, required this.child, this.padding, this.height, this.width})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
          color: colorWhite,
          borderRadius: const BorderRadius.all(Radius.circular(15)),
          border: Border.all(color: colorGrey.withAlpha(40), width: 2)),
      padding: padding ?? const EdgeInsets.all(8),
      child: Center(child: child),
    );
  }
}
