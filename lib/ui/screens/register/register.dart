import 'package:evently/ui/screens/home/home.dart';
import 'package:evently/ui/screens/home/tabs/home/Home_tab.dart';
import 'package:evently/ui/utills/appassets.dart';
import 'package:evently/ui/utills/appcolor.dart';
import 'package:evently/ui/utills/approuts.dart';
import 'package:evently/ui/utills/dialog_utilites.dart';
import 'package:evently/ui/widgets/custom_botton.dart';
import 'package:evently/ui/widgets/custom_text_field.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  TextEditingController userNameControler = TextEditingController();
  TextEditingController emailControler = TextEditingController();
  TextEditingController passwordControler = TextEditingController();
  TextEditingController rePasswordControler = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        titleTextStyle: Theme.of(context).textTheme.titleMedium,
        centerTitle: true,
        backgroundColor: Colors.transparent,
        title: Text("Register"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            buildapplogo(),
            SizedBox(height: 24),
            buildName(),
            SizedBox(height: 16),
            buildEmail(),
            SizedBox(height: 16),
            buildPassword(),
            SizedBox(height: 16),
            buildConfirmPassword(),
            SizedBox(height: 16),
            buildCreatAccount(),
            SizedBox(height: 16),
            builldLogin(),
            SizedBox(height: 24),
            buildLanguageToggle(),
          ],
        ),
      ),
    );
  }

  buildapplogo() => Image.asset(
    Appassets.appVerticalLogo,
    height: MediaQuery.of(context).size.height * 0.2,
  );

  buildName() => CustomTextField(
    hint: "Name",
    prefixicon: Appassets.icName,
    controller: userNameControler,
  );

  buildEmail() => CustomTextField(
    hint: "Email",
    prefixicon: Appassets.icEmail,
    controller: emailControler,
  );

  buildPassword() => CustomTextField(
    hint: "Password",
    prefixicon: Appassets.icpassword,
    isPassword: true,
    controller: passwordControler,
  );

  buildConfirmPassword() => CustomTextField(
    hint: "Confim Password",
    prefixicon: Appassets.icpassword,
    isPassword: true,
    controller: rePasswordControler,
  );

  buildCreatAccount() => CustomBotton(
    text: "Creat Account",
    onClick: () async {
      showLoading(context);
      try {
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: emailControler.text,
          password: passwordControler.text,
        );
        Navigator.pop(context);
        Navigator.push(context, Approuts.home);
      } on FirebaseAuthException catch (e) {
        var message = ' something went wrong, please try again';
        if (e.code == 'weak-password') {
          message = 'The password provided is too weak.';
        } else if (e.code == 'email-already-in-use') {
          message = 'The account already exists for that email.';
        }
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

  builldLogin() => Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Text(
        "Dont have an account?",
        style: Theme.of(context).textTheme.labelSmall,
      ),

      Text(
        "Login",
        style: Theme.of(context).textTheme.labelMedium!.copyWith(
          fontStyle: FontStyle.italic,
          decoration: TextDecoration.underline,
        ),
      ),
    ],
  );

  buildLanguageToggle() => Container(
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
  );
}
