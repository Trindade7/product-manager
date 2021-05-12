import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:product_manager/ui/styles.dart';
import 'package:product_manager/ui/theme.dart';

class SplashPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    AppTheme theme = context.watch();
    return Scaffold(
      backgroundColor: theme.accent1,
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.inventory, // TODO: REPLACE WITH LOGO
            color: theme.greyWeak,
            size: 150.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding:
                    const EdgeInsets.fromLTRB(Insets.lg * 2, 0, Insets.md, 0),
                child: Text(
                  'Project'.toUpperCase(),
                  style: TextStyles.h2.copyWith(color: theme.greyWeak),
                ),
              ),
              Container(
                padding: EdgeInsets.all(Insets.md),
                decoration: BoxDecoration(
                    color: theme.shift(theme.accent1, -0.1),
                    borderRadius: BorderRadius.all(Corners.medRadius)),
                child: Text(
                  'Manager'.toUpperCase(),
                  style: TextStyles.h2.copyWith(color: theme.greyWeak),
                ),
              )
            ],
          ),
          SizedBox(
            height: Insets.offset,
          ),
          LoadingAppAnimation(theme.greyWeak),
        ],
      )),
    );
  }
}

class LoadingAppAnimation extends StatefulWidget {
  final Color _color;
  const LoadingAppAnimation(
    this._color, {
    Key? key,
  }) : super(key: key);

  @override
  _LoadingAppAnimationState createState() => _LoadingAppAnimationState();
}

class _LoadingAppAnimationState extends State<LoadingAppAnimation>
    with TickerProviderStateMixin {
  late final _controller = AnimationController(
    vsync: this,
    duration: const Duration(seconds: 2),
  )..repeat();

  late final Animation<double> _animation = CurvedAnimation(
    parent: _controller,
    curve: Curves.linear,
  );

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return RotationTransition(
      turns: _animation,
      child: Icon(
        Icons.settings,
        color: widget._color,
        size: IconSizes.lg,
      ),
    );
  }
}
