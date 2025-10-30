import 'package:evently/ui/utills/appassets.dart';
import 'package:evently/ui/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              SizedBox(height: 20),
              buildapplogo(),
              SizedBox(height: 20),
              buildEmailTextField(),
              SizedBox(height: 16),
              buildPasswordTextField(),
              buildForgetPasswordText(),
              buildLoginbutton(),
              buildSignupText(),
              builldOrRow(),
              buildGmailLogin(),
              buildLanguageToggle(),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildapplogo() => Image.asset(Appassets.appVerticalLogo);

  Widget buildEmailTextField() => Container(
    child: CustomTextField(hint: "Email", prefixicon: Appassets.icEmail),
  );

  Widget buildPasswordTextField() => Container(
    child: CustomTextField(
      hint: "pasword",
      prefixicon: Appassets.icpassword,
      isPassword: true,
    ),
  );

  Widget buildForgetPasswordText() => Container();

  Widget buildLoginbutton() => Container();

  Widget buildSignupText() => Container();

  Widget builldOrRow() => Container();

  Widget buildGmailLogin() => Container();

  Widget buildLanguageToggle() => Container();
}
