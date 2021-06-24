import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:product_manager/core/auth/auth_repository.dart';
import 'package:product_manager/ui/styles.dart';
import 'package:product_manager/ui/theme.dart';
import 'package:product_manager/ui/auth_page/cubit/login_cubit.dart';
import 'package:product_manager/ui/auth_page/login_form.dart';
import 'package:product_manager/ui/widgets/separator_box.dart';
import 'package:provider/provider.dart';

class AuthPage extends StatefulWidget {
  static const path = '/auth';

  AuthPage({Key? key}) : super(key: key);

  @override
  _AuthPageState createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  @override
  Widget build(BuildContext context) {
    AppTheme theme = context.watch();
    const bannerIcon = 'assets/images/project_manager_icon_p.svg';
    return Scaffold(
      backgroundColor: Theme.of(context).cardColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              bannerIcon,
              width: 150,
            ),
            SeparatorBox.large(),
            Text(
              'Bem vindo ao seu gestor de inventório',
              style: Theme.of(context).textTheme.subtitle1,
              textAlign: TextAlign.center,
            ),
            SeparatorBox.offset(),
            Padding(
              padding: const EdgeInsets.all(Insets.lg),
              // Substituir por signup form quando new user
              child: BlocProvider(
                create: (_) => LoginCubit(context.read<AuthRepository>()),
                child: LoginForm(theme: theme),
              ),
            )
          ],
        ),
      ),
    );
  }
}
