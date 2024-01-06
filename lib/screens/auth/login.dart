import 'package:e_commerce/constants/constants.dart';
import 'package:e_commerce/constants/routes.dart';
import 'package:e_commerce/firebase_helper/firebaes_auth_helper.dart';
import 'package:e_commerce/screens/auth/sign_up.dart';
import 'package:e_commerce/screens/home/home.dart';
import 'package:e_commerce/widgets/primary_button/primary_button.dart';
import 'package:e_commerce/widgets/top_titles/top_titles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController _email = TextEditingController();
  TextEditingController _password = TextEditingController();
  bool hidePassword = true;
  IconData showPasswordIcon = Icons.visibility_off_outlined;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.all(12.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const TopTitle(title: "Login", subTitle: "Welcome back to store"),
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
              controller: _password,
              obscureText: hidePassword,
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
          PrimaryButton(
              onPressed: () async {
                if (validateLogin(_email.text, _password.text)) {
                  await FirebaseAuthHelper.instance
                      .login(_email.text, _password.text, context)
                      .then((value) => {
                        
                      if(value)Routes.instance.pushAndRemoveUntil(context, const Home())
                  
                });
                
                }
              },
              textData: "Login"),
          const SizedBox(
            height: 12,
          ),
          const Center(
            child: Text("Don't have an account?"),
          ),
          Center(
              child: CupertinoButton(
                  child: const Text(
                    "Create a new account",
                    style: TextStyle(color: Colors.red),
                  ),
                  onPressed: () {
                    Routes.instance.pushReplacement(context, const SignUp());
                  }))
        ],
      ),
    ));
  }
}
