import 'package:flutter/material.dart';

import 'AppbarPainter.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Widget child;
  final double height;

  CustomAppBar({
    required this.child,
    this.height = kToolbarHeight,
  });

  @override
  Size get preferredSize => Size.fromHeight(height);

  @override
  Widget build(BuildContext context) {

    return Container(
      height: preferredSize.height,
      color: Colors.deepPurple[400],
      alignment: Alignment.center,
      child:child,
    );
  }
}
