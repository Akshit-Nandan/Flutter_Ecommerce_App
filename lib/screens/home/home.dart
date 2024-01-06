import 'package:e_commerce/firebase_helper/firebaes_auth_helper.dart';
import 'package:e_commerce/widgets/primary_button/primary_button.dart';
import 'package:e_commerce/widgets/top_titles/top_titles.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
      children: [
        Padding(
          padding: EdgeInsets.all(12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TopTitle(title: "E Commerce", subTitle: ""),
              TextField(),
            ],
          ),
        ),
        Text(
          "Categories",
          style: TextStyle(fontSize: 16),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: List<Widget>.of(
                categoriesList.map(
                  (List<String> ls) => Column(
                    children: [
                      Card(
                        margin: EdgeInsets.all(8),
                        elevation: 8,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)
                        ),
                        // padding: EdgeInsets.all(8),
                        child: SizedBox(
                          height: 100,
                          width: 100,
                        child:Image.network(ls[1],fit: BoxFit.fill, ),
                        )
                      ),
                      Text(ls[0])
                    ],
                  ),
                ),
              ),
            ),
          ),
        )
      ],
    )

        // children: [
        //   const SizedBox(
        //     height: 18,
        //   ),
        //   const Text("Welcome to home screen"),
        //   const SizedBox(
        //     height: 20,
        //   ),
        //   PrimaryButton(
        //       onPressed: () async {
        //         await FirebaseAuthHelper.instance.logut();
        //       },
        //       textData: "Logout")
        // ],
        );
  }
}

List<List<String>> categoriesList = [
  [
    "Electronic",
    "https://png.pngtree.com/png-vector/20190120/ourlarge/pngtree-isometric-electronic-devices-collection-png-image_324124.jpg"
  ],
  [
    "Grocery",
    "https://static.vecteezy.com/system/resources/previews/000/251/695/original/grocery-shopping-bag-vector-illustration.jpg"
  ],
  [
    "Toys",
    "https://static.vecteezy.com/system/resources/previews/000/108/285/large_2x/fun-kid-toys-vector.jpg"
  ],
  [
    "Electronic",
    "https://png.pngtree.com/png-vector/20190120/ourlarge/pngtree-isometric-electronic-devices-collection-png-image_324124.jpg"
  ],
  [
    "Grocery",
    "https://static.vecteezy.com/system/resources/previews/000/251/695/original/grocery-shopping-bag-vector-illustration.jpg"
  ],
  [
    "Toys",
    "https://static.vecteezy.com/system/resources/previews/000/108/285/large_2x/fun-kid-toys-vector.jpg"
  ],
  [
    "Electronic",
    "https://png.pngtree.com/png-vector/20190120/ourlarge/pngtree-isometric-electronic-devices-collection-png-image_324124.jpg"
  ],
  [
    "Grocery",
    "https://static.vecteezy.com/system/resources/previews/000/251/695/original/grocery-shopping-bag-vector-illustration.jpg"
  ],
  [
    "Toys",
    "https://static.vecteezy.com/system/resources/previews/000/108/285/large_2x/fun-kid-toys-vector.jpg"
  ],
];
