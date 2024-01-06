import 'package:e_commerce/constants/asset_image.dart';
import 'package:e_commerce/constants/routes.dart';
import 'package:e_commerce/screens/auth/login.dart';
import 'package:e_commerce/screens/auth/sign_up.dart';
import 'package:e_commerce/widgets/primary_button/primary_button.dart';
import 'package:e_commerce/widgets/top_titles/top_titles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const TopTitle(
                title: "Welcome Page",
                subTitle: "Buy any item form using this app"),
            const SizedBox(
              height: 5,
            ),
            Center(
              child: Image.asset(AssetsImages.login),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CupertinoButton(
                  onPressed: () {},
                  child: const Icon(
                    Icons.facebook_rounded,
                    color: Colors.blue,
                    size: 50,
                  ),
                ),
                CupertinoButton(
                  onPressed: () {},
                  child: Image.asset(
                    AssetsImages.googleIcon,
                    height: 50,
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            PrimaryButton(
                onPressed: () {
                  Routes.instance.push(context, const Login());
                },
                textData: "Login"),
            const SizedBox(
              height: 18,
            ),
            PrimaryButton(
                onPressed: () {
                  Routes.instance.push(context, const SignUp());
                },
                textData: "Register"),
          ],
        ),
      ),
    );
  }
}
