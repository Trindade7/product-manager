import 'package:flutter/material.dart';
import 'package:product_manager/ui/styles.dart';
import 'package:product_manager/ui/theme.dart';
import 'package:provider/provider.dart';

class SquareIconButton extends StatelessWidget {
  final bool selected;
  final Function? onPressedCallback;
  final double iconSize;
  final double padding;
  final Color? backgroundColor;
  final Icon icon;
  const SquareIconButton({
    required this.icon,
    this.backgroundColor,
    this.onPressedCallback,
    this.selected = false,
    this.iconSize = IconSizes.md,
    this.padding = Insets.sm,
  });

  @override
  Widget build(BuildContext context) {
    AppTheme theme = context.watch();
    return TextButton(
      onPressed: (onPressedCallback != null)
          ? () => onPressedCallback
          : null, // quando não tem callback disabilita o botão
      child: icon,
      style: TextButton.styleFrom(
        backgroundColor: backgroundColor ?? theme.surface2,
        padding: EdgeInsets.all(padding),
        minimumSize: Size(42, 42),
        shape: RoundedRectangleBorder(borderRadius: Corners.lgBorder),
      ),
    );
  }
}
