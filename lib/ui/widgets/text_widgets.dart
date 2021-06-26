import '../shared.dart';

class Headline1Text extends StatelessWidget {
  final String text;

  const Headline1Text(this.text, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AppTheme appTheme = context.watch();
    return Text(
      text,
      style: TextStyles.h1.copyWith(color: appTheme.greyStrong),
    );
  }
}

class Headline2Text extends StatelessWidget {
  final String text;

  const Headline2Text(this.text, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AppTheme appTheme = context.watch();
    return Text(
      text,
      style: TextStyles.h2.copyWith(color: appTheme.greyStrong),
    );
  }
}

class Headline3Text extends StatelessWidget {
  final String text;

  const Headline3Text(this.text, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AppTheme appTheme = context.watch();
    return Text(
      text,
      style: TextStyles.h3.copyWith(color: appTheme.greyStrong),
    );
  }
}

class Headline4Text extends StatelessWidget {
  final String text;

  const Headline4Text(this.text, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AppTheme appTheme = context.watch();
    return Text(
      text,
      style: TextStyles.h4.copyWith(color: appTheme.greyStrong),
    );
  }
}

class ElevatedButtonText extends StatelessWidget {
  final String text;

  const ElevatedButtonText(this.text, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AppTheme appTheme = context.watch();
    return Text(
      text,
      style: TextStyles.h3.copyWith(color: appTheme.greyWeak),
    );
  }
}

class BodyText extends StatelessWidget {
  final String text;

  const BodyText(this.text, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AppTheme appTheme = context.watch();
    return Text(
      text,
      style: TextStyles.body1.copyWith(color: appTheme.greyMedium),
    );
  }
}

class CaptionText extends StatelessWidget {
  final String text;

  const CaptionText(this.text, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AppTheme appTheme = context.watch();
    return Text(
      text,
      style: TextStyles.caption.copyWith(color: appTheme.grey),
    );
  }
}
