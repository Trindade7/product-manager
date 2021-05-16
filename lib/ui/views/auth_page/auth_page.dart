import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:product_manager/ui/styles.dart';
import 'package:product_manager/ui/theme.dart';
import 'package:product_manager/ui/views/dumb_widgets/separator_box.dart';
import 'package:provider/provider.dart';

class AuthPage extends StatefulWidget {
  AuthPage({Key? key}) : super(key: key);

  @override
  _AuthPageState createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  @override
  Widget build(BuildContext context) {
    AppTheme theme = context.watch();
    // create dynamic change capability??
    const bannerIcon = 'assets/images/project_manager_icon_p.svg';
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              bannerIcon,
              width: 150,
            ),
            SeparatorBox.offset(),
            Padding(
              padding: const EdgeInsets.all(Insets.lg),
              child: Form(
                  child: Column(
                children: [
                  Container(
                    child: TextField(
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Login',
                      ),
                      style: Theme.of(context)
                          .textTheme
                          .subtitle1
                          ?.copyWith(color: theme.accent1),
                    ),
                    decoration: BoxDecoration(
                      boxShadow: Shadows.universal,
                      color: Theme.of(context).cardColor,
                      borderRadius: Corners.mdBorder,
                    ),
                    padding: EdgeInsets.symmetric(horizontal: Insets.lg),
                  ),
                  SeparatorBox.large(),
                ],
              )),
            )
          ],
        ),
      ),
    );
  }
}
