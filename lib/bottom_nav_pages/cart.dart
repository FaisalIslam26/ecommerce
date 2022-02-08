import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.redAccent,
        centerTitle: true,
        title: Text(
          "Added to cart",
          style: TextStyle(
              color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
        ),
      ),
      body: SafeArea(
        child: StreamBuilder(
            stream: FirebaseFirestore.instance
                .collection("users-cart-item")
                .doc(FirebaseAuth.instance.currentUser!.email)
                .collection("items")
                .snapshots(),
            builder:
                (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (snapshot.hasError) {
                return Center(
                  child: Text("Something is wrong"),
                );
              }
              return ListView.builder(
                  itemCount:
                      snapshot.data == null ? 0 : snapshot.data!.docs.length,
                  itemBuilder: (context, index) {
                    DocumentSnapshot _documentSnapshot =
                        snapshot.data!.docs[index];
                    return ListTile(
                      leading: Text(_documentSnapshot['name']),
                      title: Text("\$ ${_documentSnapshot['price']}"),
                      trailing: GestureDetector(
                        child: CircleAvatar(
                          backgroundColor: Colors.redAccent,
                          child: Icon(
                            Icons.remove_circle,
                            color: Colors.white,
                          ),
                        ),
                        onTap: () {
                          FirebaseFirestore.instance
                              .collection("users-cart-item")
                              .doc(FirebaseAuth.instance.currentUser!.email)
                              .collection("items")
                              .doc(_documentSnapshot.id)
                              .delete();
                        },
                      ),
                    );
                  });
            }),
      ),
    );
  }
}
