import 'package:e_commerce/constants/constants.dart';
import 'package:e_commerce/constants/routes.dart';
import 'package:e_commerce/firebase_helper/firebaes_auth_helper.dart';
import 'package:e_commerce/screens/auth/login.dart';
import 'package:e_commerce/screens/home/home.dart';
import 'package:e_commerce/widgets/primary_button/primary_button.dart';
import 'package:e_commerce/widgets/top_titles/top_titles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  bool hidePassword = true;
  bool hideConfPassword = true;
  IconData showPasswordIcon = Icons.visibility_off_outlined;
  IconData showConfPasswordIcon = Icons.visibility_off_outlined;
  TextEditingController _name = TextEditingController();
  TextEditingController _email = TextEditingController();
  TextEditingController _password = TextEditingController();
  TextEditingController _confPassword = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.all(12.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const TopTitle(title: "Sign Up", subTitle: "Welcome back to store"),
          TextFormField(
              keyboardType: TextInputType.name,
              controller: _name,
              decoration: const InputDecoration(
                prefixIcon: Icon(Icons.person_2_outlined),
                hintText: "Name",
              )),
          SizedBox(
            height: 12,
          ),
          TextFormField(
              keyboardType: TextInputType.emailAddress,
              controller: _email,
              decoration: const InputDecoration(
                prefixIcon: Icon(Icons.email_outlined),
                hintText: "E-mail",
              )),
          SizedBox(
            height: 12,
          ),
          TextFormField(
              obscureText: hidePassword,
              controller: _password,
              // obscuringCharacter:'●' ,
              obscuringCharacter: '•',
              keyboardType: TextInputType.visiblePassword,
              style: TextStyle(
                color: Colors.grey,
                // fontSize: 25,
              ),
              decoration: InputDecoration(
                // contentPadding: EdgeInsets.all(5),
                prefixIcon: Icon(Icons.password_outlined),
                hintText: "Password",
                suffixIcon: CupertinoButton(
                  child: Icon(showPasswordIcon, color: Colors.grey),
                  onPressed: () {
                    setState(() {
                      hidePassword = !hidePassword;
                      if (hidePassword)
                        showPasswordIcon = Icons.visibility_off_outlined;
                      else
                        showPasswordIcon = Icons.visibility;
                    });
                  },
                ),
              )),
          const SizedBox(
            height: 24,
          ),
          TextFormField(
              obscureText: hideConfPassword,
              controller: _confPassword,
              // obscuringCharacter:'●' ,
              obscuringCharacter: '•',
              keyboardType: TextInputType.visiblePassword,
              style: TextStyle(
                color: Colors.grey,
                // fontSize: 25,
              ),
              decoration: InputDecoration(
                // contentPadding: EdgeInsets.all(5),
                prefixIcon: Icon(Icons.password_outlined),
                hintText: "Password",
                suffixIcon: CupertinoButton(
                  child: Icon(showConfPasswordIcon, color: Colors.grey),
                  onPressed: () {
                    setState(() {
                      hideConfPassword = !hideConfPassword;
                      if (hideConfPassword)
                        showConfPasswordIcon = Icons.visibility_off_outlined;
                      else
                        showConfPasswordIcon = Icons.visibility;
                    });
                  },
                ),
              )),
          const SizedBox(
            height: 24,
          ),
          PrimaryButton(
              onPressed: () async {
                if (validateSignUp(_name.text, _email.text, _password.text,
                    _confPassword.text)) {
                  await FirebaseAuthHelper.instance
                      .signUp(_email.text, _password.text, context).then((value) => {
                        if(value)Routes.instance.pushAndRemoveUntil(context, Home())
                      });
                }
              },
              textData: "Sign Up"),
          const SizedBox(
            height: 12,
          ),
          const Center(
            child: Text("Already have an account?"),
          ),
          Center(
              child: CupertinoButton(
                  child: const Text(
                    "Login to existing account",
                    style: TextStyle(color: Colors.red),
                  ),
                  onPressed: () {
                    Routes.instance.pushReplacement(context, const Login());
                  }))
        ],
      ),
    ));
  }
}
