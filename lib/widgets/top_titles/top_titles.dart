import 'package:flutter/material.dart';

class TopTitle extends StatelessWidget {
  final String title, subTitle;
  const TopTitle({super.key, required this.title, required this.subTitle});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: kToolbarHeight + 12,
          child: (title == "Login" || title == "Sign Up")
              ? GestureDetector(
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                  child: const Icon(Icons.arrow_back_ios),
                )
              : null,
        ),
        Text(title,
            style: const TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.bold,
            )),
        const SizedBox(
          height: 12,
        ),
        Text(subTitle),
        const SizedBox(
          height: 12,
        ),
      ],
    );
  }
}
