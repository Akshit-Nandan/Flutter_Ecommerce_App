import 'package:e_commerce/constants/constants.dart';
import 'package:e_commerce/firebase_helper/firebaes_auth_helper.dart';
import 'package:e_commerce/firebase_helper/firebase_firestore_helper.dart';
import 'package:e_commerce/models/category_model.dart';
import 'package:e_commerce/models/product_model.dart';
import 'package:e_commerce/widgets/primary_button/primary_button.dart';
import 'package:e_commerce/widgets/top_titles/top_titles.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool isLoading = true;
  List<CategoryModel> categoriesList = [];
  @override
  void initState() {
    getCategories();
    super.initState();
  }

  void getCategories() async {
    setState(() {
      isLoading = true;
    });

    categoriesList = await FirebaseFirestoreHelper.instance.getCategories();

    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: isLoading
            ? showLoaderDialog(context)
            : SingleChildScrollView(
                child: Column(
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
                              (category) => Column(
                                children: [
                                  Card(
                                    margin: EdgeInsets.all(8),
                                    elevation: 8,
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    // padding: EdgeInsets.all(8),
                                    child: SizedBox(
                                      height: 100,
                                      width: 100,
                                      child: Image.network(
                                        category.image,
                                        fit: BoxFit.fill,
                                      ),
                                    ),
                                  ),
                                  Text(category.name)
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(12),
                      child: GridView.count(

                          // itemCount: bestProduct.length,
                          crossAxisCount: 2,
                          // shrinkWrap: true,
                          shrinkWrap: true,
                          physics:
                              const NeverScrollableScrollPhysics(), // or primay:false,
                          // gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                          mainAxisSpacing: 20,
                          crossAxisSpacing: 20,
                          childAspectRatio: 0.75,
                          //     crossAxisCount: 2, mainAxisSpacing: 20,crossAxisSpacing: 20),
                          children: [
                            for (ProdutModel curModel in bestProduct)

                              // ProdutModel curModel = bestProduct[index];
                              Container(
                                decoration: BoxDecoration(
                                    color: Colors.red.withOpacity(0.6),
                                    borderRadius: BorderRadius.circular(12)),
                                padding: const EdgeInsets.all(5),
                                child: Column(
                                  children: [
                                    Center(
                                      child: Card(
                                        margin: const EdgeInsets.all(8),
                                        elevation: 8,

                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(10)),
                                        // padding: EdgeInsets.all(8),
                                        child: SizedBox(
                                          height: 100,
                                          width: 100,
                                          child: Image.network(
                                            curModel.image,
                                            fit: BoxFit.fill,
                                          ),
                                        ),
                                      ),
                                    ),
                                    // Image.network(curModel.image),
                                    SizedBox(height: 12),
                                    Text(
                                      curModel.name,
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    SizedBox(height: 4),
                                    Text(
                                      "₹ " + curModel.price.toString(),
                                      style: TextStyle(fontSize: 10),
                                    ),
                                    SizedBox(height: 4),
                                    PrimaryButton(
                                        onPressed: () {}, textData: "Buy"),
                                  ],
                                ),
                              ),
                          ]),
                    ),
                  ],
                ),
              ));
  }
}

// List<List<String>> categoriesList = [
//   [
//     "Electronic",
//     "https://th.bing.com/th/id/OIP.vR7KyNt_xNId0gbsSFSF5wHaE7?w=264&h=181&c=7&r=0&o=5&dpr=1.3&pid=1.7",
//   ],
//   [
//     "Grocery",
//     "https://static.vecteezy.com/system/resources/previews/000/251/695/original/grocery-shopping-bag-vector-illustration.jpg"
//   ],
//   [
//     "Toys",
//     "https://static.vecteezy.com/system/resources/previews/000/108/285/large_2x/fun-kid-toys-vector.jpg"
//   ],
//   [
//     "Electronic",
//     "https://th.bing.com/th/id/OIP.vR7KyNt_xNId0gbsSFSF5wHaE7?w=264&h=181&c=7&r=0&o=5&dpr=1.3&pid=1.7",
//   ],
//   [
//     "Grocery",
//     "https://static.vecteezy.com/system/resources/previews/000/251/695/original/grocery-shopping-bag-vector-illustration.jpg"
//   ],
//   [
//     "Toys",
//     "https://static.vecteezy.com/system/resources/previews/000/108/285/large_2x/fun-kid-toys-vector.jpg"
//   ],
//   [
//     "Electronic",
//     "https://th.bing.com/th/id/OIP.vR7KyNt_xNId0gbsSFSF5wHaE7?w=264&h=181&c=7&r=0&o=5&dpr=1.3&pid=1.7",
//   ],
//   [
//     "Grocery",
//     "https://static.vecteezy.com/system/resources/previews/000/251/695/original/grocery-shopping-bag-vector-illustration.jpg"
//   ],
//   [
//     "Toys",
//     "https://static.vecteezy.com/system/resources/previews/000/108/285/large_2x/fun-kid-toys-vector.jpg"
//   ],
// ];

List<ProdutModel> bestProduct = [
  ProdutModel(
      id: '1',
      name: "Apple",
      image:
          "https://th.bing.com/th/id/R.b4bff991869ae63db90f2377eab29559?rik=D3Ijv6yrOMvQLA&riu=http%3a%2f%2fwww.freepngimg.com%2fdownload%2fapple%2f16-red-apple-png-image.png&ehk=w6kY7gZO7B4tysMq1Ga86cmzgqeS4NxswdcSuXEnMRE%3d&risl=&pid=ImgRaw&r=0",
      price: 500,
      description: "Apple is a very nutritius fruit.",
      status: true,
      isFav: true),
  ProdutModel(
      id: '2',
      name: "Laptop",
      image:
          "https://th.bing.com/th/id/R.b1ec5bc05f529d4a6c1696b21a515450?rik=F9qc43QVqXXHlQ&riu=http%3a%2f%2fwww.pngall.com%2fwp-content%2fuploads%2f2016%2f05%2fLaptop-PNG.png&ehk=XZH0Y69sWL2EL80oXAA%2fZ0HnEWh%2b1LMRt5tfn5f20R4%3d&risl=&pid=ImgRaw&r=0",
      price: 2500,
      description: "This is a high performance laptop.",
      status: true,
      isFav: true),
  ProdutModel(
      id: '3',
      name: "Apple",
      image:
          "https://th.bing.com/th/id/R.b4bff991869ae63db90f2377eab29559?rik=D3Ijv6yrOMvQLA&riu=http%3a%2f%2fwww.freepngimg.com%2fdownload%2fapple%2f16-red-apple-png-image.png&ehk=w6kY7gZO7B4tysMq1Ga86cmzgqeS4NxswdcSuXEnMRE%3d&risl=&pid=ImgRaw&r=0",
      price: 500,
      description: "Apple is a very nutritius fruit.",
      status: true,
      isFav: true),
  ProdutModel(
      id: '4',
      name: "Laptop",
      image:
          "https://th.bing.com/th/id/R.b1ec5bc05f529d4a6c1696b21a515450?rik=F9qc43QVqXXHlQ&riu=http%3a%2f%2fwww.pngall.com%2fwp-content%2fuploads%2f2016%2f05%2fLaptop-PNG.png&ehk=XZH0Y69sWL2EL80oXAA%2fZ0HnEWh%2b1LMRt5tfn5f20R4%3d&risl=&pid=ImgRaw&r=0",
      price: 2500,
      description: "This is a high performance laptop.",
      status: true,
      isFav: true),
  ProdutModel(
      id: '5',
      name: "Apple",
      image:
          "https://th.bing.com/th/id/R.b4bff991869ae63db90f2377eab29559?rik=D3Ijv6yrOMvQLA&riu=http%3a%2f%2fwww.freepngimg.com%2fdownload%2fapple%2f16-red-apple-png-image.png&ehk=w6kY7gZO7B4tysMq1Ga86cmzgqeS4NxswdcSuXEnMRE%3d&risl=&pid=ImgRaw&r=0",
      price: 500,
      description: "Apple is a very nutritius fruit.",
      status: true,
      isFav: true),
  ProdutModel(
      id: '6',
      name: "Laptop",
      image:
          "https://th.bing.com/th/id/R.b1ec5bc05f529d4a6c1696b21a515450?rik=F9qc43QVqXXHlQ&riu=http%3a%2f%2fwww.pngall.com%2fwp-content%2fuploads%2f2016%2f05%2fLaptop-PNG.png&ehk=XZH0Y69sWL2EL80oXAA%2fZ0HnEWh%2b1LMRt5tfn5f20R4%3d&risl=&pid=ImgRaw&r=0",
      price: 2500,
      description: "This is a high performance laptop.",
      status: true,
      isFav: true),
  ProdutModel(
      id: '7',
      name: "Apple",
      image:
          "https://th.bing.com/th/id/R.b4bff991869ae63db90f2377eab29559?rik=D3Ijv6yrOMvQLA&riu=http%3a%2f%2fwww.freepngimg.com%2fdownload%2fapple%2f16-red-apple-png-image.png&ehk=w6kY7gZO7B4tysMq1Ga86cmzgqeS4NxswdcSuXEnMRE%3d&risl=&pid=ImgRaw&r=0",
      price: 500,
      description: "Apple is a very nutritius fruit.",
      status: true,
      isFav: true),
  ProdutModel(
      id: '8',
      name: "Laptop",
      image:
          "https://th.bing.com/th/id/R.b1ec5bc05f529d4a6c1696b21a515450?rik=F9qc43QVqXXHlQ&riu=http%3a%2f%2fwww.pngall.com%2fwp-content%2fuploads%2f2016%2f05%2fLaptop-PNG.png&ehk=XZH0Y69sWL2EL80oXAA%2fZ0HnEWh%2b1LMRt5tfn5f20R4%3d&risl=&pid=ImgRaw&r=0",
      price: 2500,
      description: "This is a high performance laptop.",
      status: true,
      isFav: true),
];
