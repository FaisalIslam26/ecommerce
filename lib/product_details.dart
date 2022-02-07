import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class ProductDetails extends StatefulWidget {
  var _products;

  ProductDetails(this._products);

  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  int activeIndex = 0;
  // final slideImage = [
  //   "assets/images/w1.jpg",
  //   "assets/images/w2.jpg",
  //   "assets/images/w3.png",
  // ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: CircleAvatar(
            backgroundColor: Colors.redAccent,
            child: IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.arrow_back,
              ),
            ),
          ),
        ),
        elevation: 0,
        actions: [
          CircleAvatar(
            backgroundColor: Colors.redAccent,
            child: IconButton(
              onPressed: () {},
              icon: Icon(Icons.favorite_outline),
            ),
          ),
        ],
      ),

      // body: SafeArea(
      //     child: Column(
      //   children: [Text(widget._products['product-name'])],
      // )),

      body: Column(
        children: [
          SizedBox(
            height: 10,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CarouselSlider.builder(
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
                itemCount: widget._products.length,
                itemBuilder: (context, index, realIndex) {
                  final img = widget._products['product-Image'];
                  return buildImage(img, index);
                },
              ),
              builIndicator(),
            ],
          ),
          SizedBox(
            height: 30,
          ),
          Text(
            widget._products['product-name'],
            style: TextStyle(
              color: Colors.black,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(widget._products["product-price"]),
          Text(
            widget._products["product-description"],
            textAlign: TextAlign.justify,
            style: TextStyle(),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: ElevatedButton(
              onPressed: () {},
              child: Text(
                "ADD To Cart",
                style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.w500,
                  color: Colors.white,
                ),
              ),
              style: ElevatedButton.styleFrom(
                primary: Colors.redAccent,
                minimumSize: Size(double.infinity, 67),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(0),
                ),
              ),
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
        count: widget._products.length,
      );
}
