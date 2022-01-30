import 'package:ecommerce/signin.dart';
import 'package:ecommerce/user_data.dart';
import 'package:flutter/material.dart';

class SignUpScreen extends StatefulWidget {
  static const String path = "SignUpScreen";
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  bool istap = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.redAccent,
        title: Text("Sign Up"),
      ),
      body: Container(
        decoration: BoxDecoration(
          color: Colors.redAccent,
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 30),
          child: Expanded(
            child: Container(
              width: double.infinity,
              height: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(40),
                ),
              ),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 40, horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Welcome Buddy!",
                      style: TextStyle(
                          color: Colors.redAccent,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      "Glad to see you my buddy",
                      style: TextStyle(color: Colors.grey, fontSize: 15),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 20),
                      child: Column(
                        children: [
                          TextFormField(
                            decoration: InputDecoration(
                              prefixIcon: Padding(
                                padding: const EdgeInsets.only(right: 10),
                                child: Container(
                                  decoration: BoxDecoration(
                                      color: Colors.redAccent,
                                      borderRadius: BorderRadius.circular(10)),
                                  child: Icon(
                                    Icons.mail_outline,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                              labelText: "Email",
                              labelStyle: TextStyle(color: Colors.redAccent),
                              hintText: "xyz@gmail.com",
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
                            obscureText: !istap,
                            decoration: InputDecoration(
                              prefixIcon: Padding(
                                padding: const EdgeInsets.only(right: 10),
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: Colors.redAccent,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Icon(
                                    Icons.lock,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                              labelText: "Password",
                              labelStyle: TextStyle(color: Colors.redAccent),
                              suffixIcon: InkWell(
                                onTap: _togglePasswordView,
                                child: Icon(istap
                                    ? Icons.visibility
                                    : Icons.visibility_off),
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
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 50,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.pushNamed(context, UserdataScreen.path);
                      },
                      child: Text(
                        "Continue",
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
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Do you have an account?",
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 14,
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.pushNamed(context, SignInScreen.path);
                          },
                          child: Text(
                            "Sign In",
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.redAccent,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _togglePasswordView() {
    setState(() {
      istap = !istap;
    });
  }
}
