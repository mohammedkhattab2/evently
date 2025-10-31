import 'package:evently/l10n/app_localizations.dart';
import 'package:evently/ui/utills/appassets.dart';
import 'package:evently/ui/utills/appcolor.dart';
import 'package:evently/ui/utills/approuts.dart';
import 'package:evently/ui/widgets/custom_botton.dart';
import 'package:evently/ui/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  late AppLocalizations l10n;
  @override
  Widget build(BuildContext context) {
    l10n = AppLocalizations.of(context)!;
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(height: 20),
              buildapplogo(context),
              SizedBox(height: 20),
              buildEmailTextField(),
              SizedBox(height: 16),
              buildPasswordTextField(),
              SizedBox(height: 16),
              buildForgetPasswordText(context),
              SizedBox(height: 24),
              buildLoginbutton(),
              SizedBox(height: 24),
              buildSignupText(),
              SizedBox(height: 24),
              builldOrRow(),
              SizedBox(height: 24),
              buildGoogleLogin(),
              SizedBox(height: 24.64),
              buildLanguageToggle(),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildapplogo(BuildContext context) => Image.asset(
    Appassets.appVerticalLogo,
    height: MediaQuery.of(context).size.height * 0.2,
  );

  Widget buildEmailTextField() => Container(
    child: CustomTextField(hint: l10n.email, prefixicon: Appassets.icEmail),
  );

  Widget buildPasswordTextField() => Container(
    child: CustomTextField(
      hint: l10n.password,
      prefixicon: Appassets.icpassword,
      isPassword: true,
    ),
  );

  Widget buildForgetPasswordText(BuildContext context) => InkWell(
    onTap: () {
      Navigator.push(context, Approuts.resetPassword);
    },
    child: Text(
      l10n.forgetPassword,
      textAlign: TextAlign.end,
      style: Theme.of(context).textTheme.labelMedium!.copyWith(
        fontStyle: FontStyle.italic,
        decoration: TextDecoration.underline,
      ),
    ),
  );

  Widget buildLoginbutton() => CustomBotton(text: l10n.login, onClick: () {});

  Widget buildSignupText() => Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Text(
        AppLocalizations.of(context)!.dontHaveAccount,
        style: Theme.of(context).textTheme.labelSmall,
      ),
      InkWell(
        onTap: () => Navigator.push(context, Approuts.register),
        child: Text(
          AppLocalizations.of(context)!.createAccount,

          style: Theme.of(context).textTheme.labelMedium!.copyWith(
            fontStyle: FontStyle.italic,
            decoration: TextDecoration.underline,
          ),
        ),
      ),
    ],
  );

  Widget builldOrRow() => Row(
    children: [
      Expanded(child: Divider(indent: 24, endIndent: 24)),
      Text(l10n.or, style: Theme.of(context).textTheme.labelMedium),
      Expanded(child: Divider(indent: 24, endIndent: 24)),
    ],
  );

  Widget buildGoogleLogin() => CustomBotton(
    text: l10n.loginWithGoogle,
    onClick: () {},
    icon: Image.asset(Appassets.icgoogle),
    backGroundcolor: Appcolor.white,
    textColor: Appcolor.blue,
  );

  Widget buildLanguageToggle() => Center(
    child: Container(
      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: Appcolor.white,
        borderRadius: BorderRadius.circular(40),
        border: Border.all(color: Appcolor.blue, width: 2),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(Appassets.usaflag),
          SizedBox(width: 20.81),
          Image.asset(Appassets.egFlag),
        ],
      ),
    ),
  );
}
