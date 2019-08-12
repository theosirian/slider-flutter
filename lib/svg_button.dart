import 'dart:ui';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SvgButton extends StatelessWidget {
  final String svgAsset;

  final Color color;
  final Color disabledColor;
  final Color highlightColor;
  final Color splashColor;

  final String tooltip;

  final double iconSize;
  final EdgeInsets padding;

  final VoidCallback onPressed;

  SvgButton(this.svgAsset,
      {this.iconSize = 24.0,
      this.padding = const EdgeInsets.all(16.0),
      this.tooltip,
      this.color,
      this.disabledColor,
      this.highlightColor,
      this.splashColor,
      @required this.onPressed});

  @override
  Widget build(BuildContext context) {
    Widget result = Semantics(
      button: true,
      enabled: onPressed != null,
      child: Padding(
        padding: padding,
        child: SizedBox(
          height: iconSize,
          width: iconSize,
          child: Center(
            child: SvgPicture.asset(
              this.svgAsset,
              height: iconSize,
              width: iconSize,
              color: color == null ? Colors.black : color,
            ),
          ),
        ),
      ),
    );

    if (tooltip != null) {
      result = Tooltip(message: tooltip, child: result);
    }

    return InkResponse(
      onTap: onPressed,
      child: result,
      highlightColor: highlightColor ?? Theme.of(context).highlightColor,
      splashColor: splashColor ?? Theme.of(context).splashColor,
      radius: max(
        Material.defaultSplashRadius,
        (iconSize + min(padding.horizontal, padding.vertical)) * 0.7,
      ),
    );
  }
}
