import 'package:evently/ui/utills/appassets.dart';
import 'package:evently/ui/widgets/custom_botton.dart';
import 'package:flutter/material.dart';

class ResetPassword extends StatelessWidget {
  const ResetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.transparent,
        title: Text(
          "Reset Password",
          style: Theme.of(context).textTheme.titleMedium,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            buildResetPasswordImage(),
            SizedBox(height: 24),
            buildResetPasswordButton(),
          ],
        ),
      ),
    );
  }

  buildResetPasswordImage() => Image.asset(Appassets.resetPasswordImage);

  buildResetPasswordButton() {
    return CustomBotton(text: "Reset Password", onClick: () {});
  }
}
