import 'package:flutter/material.dart';

class UserdataScreen extends StatelessWidget {
  static const String path = "UserdataScreen";
  const UserdataScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 25),
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
                    decoration: InputDecoration(
                      hintText: "Date of Birth",
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
                    decoration: InputDecoration(
                      hintText: "Gender",
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
                    decoration: InputDecoration(
                      hintText: "Age",
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
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 100),
                    child: ElevatedButton(
                      onPressed: () {},
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
    );
  }
}
