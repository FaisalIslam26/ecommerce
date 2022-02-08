import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce/bottom_nav_pages/cart.dart';
import 'package:ecommerce/bottom_nav_pages/search.dart';
import 'package:ecommerce/product_details.dart';

import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int activeIndex = 0;
  List<String> _slideImage = [];
  List _products = [];

  TextEditingController _searchController = TextEditingController();

  fetchCarouselImages() async {
    var _firestoreInstance = FirebaseFirestore.instance;
    QuerySnapshot qn =
        await _firestoreInstance.collection("carousel-slider").get();

    for (int i = 0; i < qn.docs.length; i++) {
      _slideImage.add(qn.docs[i]["path"]);
      print(qn.docs[i]["path"]);
    }

    setState(() {});
  }

  fetchProducts() async {
    var _firestoreInstance = FirebaseFirestore.instance;
    QuerySnapshot qn = await _firestoreInstance.collection("products").get();

    for (int i = 0; i < qn.docs.length; i++) {
      _products.add({
        "product-name": qn.docs[i]["product-name"],
        "product-description": qn.docs[i]["product-description"],
        "product-price": qn.docs[i]["product-price"],
        "product-Image": qn.docs[i]["product-Image"],
      });

      // print(qn.docs[i]["path"]);
    }

    setState(() {});
  }

  @override
  void initState() {
    fetchCarouselImages();
    fetchProducts();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Column(
        children: [
          Text(
            "Ecommerce",
            style: TextStyle(
                color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              children: [
                Expanded(
                  child: SizedBox(
                    height: 60,
                    width: 60,
                    child: TextFormField(
                      readOnly: true,
                      decoration: InputDecoration(
                          fillColor: Colors.white,
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(0)),
                            borderSide: BorderSide(
                              color: Colors.blue,
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(0)),
                            borderSide: BorderSide(
                              color: Colors.blue,
                            ),
                          ),
                          hintText: "Search Products Here"),
                      onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SearchScreen())),
                    ),
                  ),
                ),
                GestureDetector(
                  child: Container(
                    height: 60,
                    width: 60,
                    decoration: BoxDecoration(color: Colors.redAccent),
                    child: Center(
                      child: Icon(
                        Icons.search,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  onTap: () {},
                ),
              ],
            ),
          ),
          Builder(builder: (context) {
            return _slideImage.length > 0
                ? CarouselSlider.builder(
                    options: CarouselOptions(
                      // viewportFraction: 1,
                      // enlargeCenterPage: true,
                      // enlargeStrategy: CenterPageEnlargeStrategy.height,
                      height: 300,
                      // pageSnapping: false,
                      // autoPlay: true,
                      // reverse: true,
                      autoPlayInterval: Duration(seconds: 2),
                      onPageChanged: (index, reason) =>
                          setState(() => activeIndex = index),
                    ),
                    itemCount: _slideImage.length,
                    itemBuilder: (context, index, realIndex) {
                      final img = _slideImage[index];
                      return Image.network(img);
                    },
                  )
                : CircularProgressIndicator();
          }),
          builIndicator(),
          SizedBox(
            height: 10,
          ),
          Expanded(
            child: GridView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: _products.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 1, mainAxisExtent: 190, childAspectRatio: 1),
              itemBuilder: (BuildContext, index) {
                return GestureDetector(
                  onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              ProductDetails(_products[index]))),
                  child: Card(
                    elevation: 3,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AspectRatio(
                          aspectRatio: 2,
                          child: Image.network(
                            _products[index]["product-Image"],
                            fit: BoxFit.cover,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "${_products[index]["product-name"]},",
                                style: TextStyle(fontSize: 15),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Text(
                                "${_products[index]["product-price"].toString()}",
                                style: TextStyle(fontSize: 10),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );

                //  Container(
                //   color: Colors.blue,
                //   child: Column(
                //     children: [
                //       AspectRatio(
                //         aspectRatio: 2,
                //         child: Image.network(_products[index]["product-Image"]),
                //       ),
                //       Text("${_products[index]["product-name"]}"),
                //       Text("${_products[index]["product-price"].toString()}"),
                //     ],
                //   ),
                // );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget buildImage(String img, int index) => Container(
        margin: EdgeInsets.symmetric(horizontal: 24),
        color: Colors.grey,
        child: Image.network(
          img,
          fit: BoxFit.cover,
        ),
      );
  Widget builIndicator() => AnimatedSmoothIndicator(
        effect: ScrollingDotsEffect(
            dotHeight: 10,
            dotWidth: 10,
            activeDotColor: Colors.redAccent,
            dotColor: Colors.grey),
        activeIndex: activeIndex,
        count: _slideImage.length,
      );
}
