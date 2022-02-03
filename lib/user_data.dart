import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce/home.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class UserdataScreen extends StatefulWidget {
  static const String path = "UserdataScreen";
  const UserdataScreen({Key? key}) : super(key: key);

  @override
  State<UserdataScreen> createState() => _UserdataScreenState();
}

class _UserdataScreenState extends State<UserdataScreen> {
  TextEditingController _nameController = TextEditingController();
  TextEditingController _phoneController = TextEditingController();
  TextEditingController _dobController = TextEditingController();
  TextEditingController _genderController = TextEditingController();
  TextEditingController _ageController = TextEditingController();

  List<String> gender = ["Male", "Female", "Other"];

  Future<void> _selectDateFromPicker(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: DateTime(DateTime.now().year - 20),
        firstDate: DateTime(DateTime.now().year - 30),
        lastDate: DateTime(DateTime.now().year));
    if (picked != null)
      setState(() {
        _dobController.text = "${picked.day}/ ${picked.month}/ ${picked.year}";
      });
  }

  sendUserDataToDB() async {
    final FirebaseAuth _auth = FirebaseAuth.instance;
    var currentUser = _auth.currentUser;
    CollectionReference _collectionRef =
        FirebaseFirestore.instance.collection("users-form-data");
    return _collectionRef.doc(currentUser!.email).set({
      "name": _nameController.text,
      "phone": _phoneController.text,
      "dob": _dobController.text,
      "gender": _genderController.text,
      "age": _ageController.text,
    })
      ..then((value) => Navigator.push(
              context, MaterialPageRoute(builder: (_) => HomeScreen())))
          .catchError((error) => print("something is wrong. $error"));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Submit the Form and Continue",
                style: TextStyle(
                  color: Colors.redAccent,
                  fontSize: 20,
                ),
              ),
              Text(
                "We will not share your information to anyone",
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 14,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: Column(
                  children: [
                    TextFormField(
                      controller: _nameController,
                      decoration: InputDecoration(
                        hintText: "Full Name",
                        hintStyle: TextStyle(
                          color: Colors.grey,
                        ),
                        border: InputBorder.none,
                        disabledBorder: InputBorder.none,
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0xfff7C7C7C),
                          ),
                        ),
                      ),
                    ),
                    TextFormField(
                      controller: _phoneController,
                      decoration: InputDecoration(
                        hintText: "Phone Number",
                        hintStyle: TextStyle(
                          color: Colors.grey,
                        ),
                        border: InputBorder.none,
                        disabledBorder: InputBorder.none,
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0xfff7C7C7C),
                          ),
                        ),
                      ),
                    ),
                    TextFormField(
                      controller: _dobController,
                      readOnly: true,
                      decoration: InputDecoration(
                        hintText: "Date of Birth",
                        hintStyle: TextStyle(
                          color: Colors.grey,
                        ),
                        suffixIcon: IconButton(
                          onPressed: () => _selectDateFromPicker(context),
                          icon: Icon(Icons.calendar_today_outlined),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0xfff7C7C7C),
                          ),
                        ),
                      ),
                    ),
                    TextFormField(
                      controller: _genderController,
                      decoration: InputDecoration(
                        hintText: "Choose your Gender",
                        hintStyle: TextStyle(
                          color: Colors.grey,
                        ),
                        prefixIcon: DropdownButton<String>(
                          items: gender.map((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: new Text(value),
                              onTap: () {
                                setState(() {
                                  _genderController.text = value;
                                });
                              },
                            );
                          }).toList(),
                          onChanged: (_) {},
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0xfff7C7C7C),
                          ),
                        ),
                      ),
                    ),
                    TextFormField(
                      controller: _ageController,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        hintText: "Age",
                        hintStyle: TextStyle(
                          color: Colors.grey,
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0xfff7C7C7C),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 80),
                      child: ElevatedButton(
                        onPressed: () {
                          sendUserDataToDB();
                        },
                        child: Text(
                          "Submit",
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}
