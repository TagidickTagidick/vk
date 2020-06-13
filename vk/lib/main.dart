import 'package:flutter/material.dart';
import 'package:vk/signUp/yourPhoneNumber.dart';
import 'package:vk/logIn/logIn.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

bool language = true;
bool themeColor = true;

class MyHomePage extends StatefulWidget {

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: themeColor ? Colors.white : Colors.black,
        body: Center(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  SizedBox(height: 200),
                  Image.asset(
                      themeColor ? "assets/vkLogo.png" : "assets/vkLogoDark.png",
                      height: 100,
                      width: 100
                  ),
                  SizedBox(height: 100),
                  Container(
                    width: 380,
                    child: RaisedButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => YourPhoneNumber()),
                        );
                      },
                      color: Colors.green,
                      textColor: Colors.white,
                      child: Text(language ? "Зарегистрироваться" : "Sign Up"),
                    ),
                  ),
                  SizedBox(height: 140),
                  Text(
                      language ? "Уже есть аккаунт?" : "Already have an account?",
                      style: TextStyle(
                          color: themeColor ? Colors.black : Colors.grey
                      )
                  ),
                  SizedBox(height: 10),
                  Container(
                    width: 380,
                    child: RaisedButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => LogIn()),
                        );
                      },
                      color: themeColor ? Color(0xff4c75a3) : Colors.white,
                      textColor: themeColor ? Colors.white : Colors.black,
                      child: Text(language ? "Войти" : "Log In"),
                    ),
                  ),
                ]
            )
        )
    );
  }
}
