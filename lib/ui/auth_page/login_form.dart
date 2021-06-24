import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:product_manager/ui/styles.dart';
import 'package:product_manager/ui/theme.dart';
import 'package:product_manager/ui/auth_page/cubit/login_cubit.dart';
import 'package:product_manager/ui/widgets/separator_box.dart';
import 'package:formz/formz.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({
    Key? key,
    required this.theme,
  }) : super(key: key);

  final AppTheme theme;

  @override
  Widget build(BuildContext context) {
    return Form(
        child: Column(
      children: [
        _NameInput(),
        SeparatorBox.large(),
        _PasswordInput(),
        SeparatorBox.large(),
        SizedBox(
          width: double.infinity,
          child: _LoginButton(),
        ),
      ],
    ));
  }
}

class _NameInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginCubit, LoginState>(
      buildWhen: (previous, current) => previous.name != current.name,
      builder: (context, state) {
        return TextField(
          key: const Key('loginForm_nameInput_textField'),
          onChanged: (name) => context.read<LoginCubit>().nameChanged(name),
          enabled: !state.status.isSubmissionInProgress,
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: Corners.mdBorder,
            ),
            hintText: "Login...",
            errorText: state.name.invalid
                ? 'Login tem que ter pelo menos 2 carácteres e no máximo 100'
                : null,
            contentPadding: EdgeInsets.all(Insets.lg),
          ),
        );
      },
    );
  }
}

class _PasswordInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginCubit, LoginState>(
      buildWhen: (previous, current) => previous.password != current.password,
      builder: (context, state) {
        return TextField(
          key: const Key('loginForm_passwordInput_textField'),
          onChanged: (password) =>
              context.read<LoginCubit>().passwordChanged(password),
          obscureText: true,
          enabled: !state.status.isSubmissionInProgress,
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: Corners.mdBorder,
            ),
            hintText: "Senha...",
            errorText: state.password.invalid
                ? 'A senha tem que ter pelo menos 6 carácteres e no máximo 100'
                : null,
            contentPadding: EdgeInsets.all(Insets.lg),
          ),
        );
      },
    );
  }
}

class _LoginButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginCubit, LoginState>(
      buildWhen: (previous, current) => previous.status != current.status,
      builder: (context, state) {
        return TextButton(
          onPressed: state.status.isValid
              ? () => context.read<LoginCubit>().login()
              : null,
          child: !state.status.isSubmissionInProgress
              ? Padding(
                  padding: const EdgeInsets.all(Insets.sm),
                  child: Text(
                    'LOGIN',
                    style: TextStyles.title1.copyWith(
                      color:
                          state.status.isValid ? Colors.white : Colors.white54,
                    ),
                  ),
                )
              : CircularProgressIndicator(backgroundColor: Colors.white),
          style: TextButton.styleFrom(
              backgroundColor: Theme.of(context).primaryColor,
              shape: RoundedRectangleBorder(
                borderRadius: Corners.mdBorder,
              ),
              minimumSize: Size.square(Insets.lg)),
        );
      },
    );
  }
}
