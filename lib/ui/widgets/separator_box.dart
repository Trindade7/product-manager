import 'package:flutter/material.dart';
import 'package:product_manager/ui/styles.dart';

/// Usado para separa elementos
class SeparatorBox extends StatelessWidget {
  const SeparatorBox(this._size, this._scale, {Key? key}) : super(key: key);
  final double _size;
  final double _scale;

  const SeparatorBox.xSmall({double scale = 1})
      : this._size = Insets.xs,
        this._scale = scale;
  const SeparatorBox.small({double scale = 1})
      : this._size = Insets.sm,
        this._scale = scale;
  const SeparatorBox.medium({double scale = 1})
      : this._size = Insets.md,
        this._scale = scale;
  const SeparatorBox.large({double scale = 1})
      : this._size = Insets.lg,
        this._scale = scale;
  const SeparatorBox.xLarge({double scale = 1})
      : this._size = Insets.xl,
        this._scale = scale;
  const SeparatorBox.offset({double scale = 1})
      : this._size = Insets.offset,
        this._scale = scale;

  @override
  Widget build(BuildContext context) {
    return SizedBox.fromSize(
      size: Size(_size * this._scale, _size * this._scale),
    );
  }
}
