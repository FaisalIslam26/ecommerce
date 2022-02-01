import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class ItemScreen extends StatefulWidget {
  const ItemScreen({Key? key}) : super(key: key);

  @override
  State<ItemScreen> createState() => _ItemScreenState();
}

class _ItemScreenState extends State<ItemScreen> {
  int activeIndex = 0;
  final slideImage = [
    "assets/images/w1.jpg",
    "assets/images/w2.jpg",
    "assets/images/w3.png",
  ];

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
                itemCount: slideImage.length,
                itemBuilder: (context, index, realIndex) {
                  final img = slideImage[index];
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
            "Leather Shoes",
            style: TextStyle(
              color: Colors.black,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text("\$149.99"),
          Text(
            """ 
          Shoes can a have a leather lining inside. It is not the leather where
          the foot rests but the part which is in contact with upper part of the foot
          """,
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
        child: Image.asset(
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
        count: slideImage.length,
      );
}
