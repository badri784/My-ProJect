import 'package:flutter/material.dart';

class SnackbarWidget extends StatelessWidget {
  final Widget content;
  final double? elevation;
  final DismissDirection? dismissDirection;
  final EdgeInsetsGeometry? margin;
  final SnackBarBehavior behavior;
  final bool? showCloseIcon;
  final SnackBarAction? action;

  const SnackbarWidget({
    super.key,
    required this.content,
    this.showCloseIcon,
    this.action,
    this.dismissDirection,
    this.elevation,
    this.margin,
    this.behavior = SnackBarBehavior.fixed,
  });

  @override
  Widget build(BuildContext context) {
    return SnackBar(
      content: content,
      dismissDirection: dismissDirection,
      elevation: elevation,
      margin: margin,
      behavior: behavior,
      showCloseIcon: showCloseIcon,
      action: action,
    );
  }
}
