import 'package:animated_toggle_switch/animated_toggle_switch.dart';
import 'package:evently/l10n/app_localizations.dart';
import 'package:evently/ui/provider/language_provider.dart';
import 'package:evently/ui/provider/theme_provider.dart';
import 'package:evently/ui/utills/appassets.dart';
import 'package:evently/ui/utills/appcolor.dart';
import 'package:evently/ui/utills/approuts.dart';
import 'package:evently/ui/utills/dialog_utilites.dart';
import 'package:evently/ui/widgets/custom_botton.dart';
import 'package:evently/ui/widgets/custom_text_field.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  late AppLocalizations l10n;
  TextEditingController emailControler = TextEditingController();
  TextEditingController passwordControler = TextEditingController();
  @override
  Widget build(BuildContext context) {
    l10n = AppLocalizations.of(context)!;
    languageProvider = Provider.of(context);
    themeProvider = Provider.of(context);
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
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
              SizedBox(height: 24.64),
              buildthemeToggle(),
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
    child: CustomTextField(
      hint: l10n.email,
      prefixicon: Appassets.icEmail,
      controller: emailControler,
    ),
  );

  Widget buildPasswordTextField() => Container(
    child: CustomTextField(
      hint: l10n.password,
      prefixicon: Appassets.icpassword,
      isPassword: true,
      controller: passwordControler,
    ),
  );

  Widget buildForgetPasswordText(BuildContext context) => InkWell(
    onTap: () {
      Navigator.push(context, Approuts.resetPassword);
    },
    child: Container(
      width: double.infinity,
      child: Text(
        l10n.forgetPassword,
        textAlign: TextAlign.end,
        style: Theme.of(context).textTheme.labelMedium!.copyWith(
          fontStyle: FontStyle.italic,
          decoration: TextDecoration.underline,
        ),
      ),
    ),
  );

  Widget buildLoginbutton() => CustomBotton(
    text: l10n.login,
    onClick: () async {
      showLoading(context);
      try {
        await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: emailControler.text,
          password: passwordControler.text,
        );
        Navigator.pop(context);
        Navigator.push(context, Approuts.home);
      } on FirebaseAuthException catch (e) {
        var message = e.message ?? "Error";
        Navigator.pop(context);
        showMessege(
          context,
          title: "Error",
          content: message,
          posButtonTitle: "ok",
        );
      }
    },
  );

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
    onClick: () async {},
    icon: Image.asset(Appassets.icgoogle),
    backGroundcolor: Appcolor.white,
    textColor: Appcolor.blue,
  );
  late LanguageProvider languageProvider;
  Widget buildLanguageToggle() {
    return AnimatedToggleSwitch<String>.dual(
      iconBuilder: (language) =>
          Image.asset(language == "en" ? Appassets.usaflag : Appassets.egFlag),
      current: languageProvider.currentlanguage,
      first: "ar",
      second: "en",
      onChanged: (language) {
        languageProvider.changelanguage(language);
      },
    );
  }

  late ThemeProvider themeProvider;
  Widget buildthemeToggle() {
    return AnimatedToggleSwitch<ThemeMode>.dual(
      current: themeProvider.themeMode,
      iconBuilder: (mode) =>
          Icon(mode == ThemeMode.dark ? Icons.dark_mode : Icons.light_mode),
      first: ThemeMode.light,
      second: ThemeMode.dark,
      onChanged: (mode) {
        themeProvider.changeMood(mode);
      },
    );
  }
}
