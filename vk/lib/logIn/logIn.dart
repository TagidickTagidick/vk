import 'package:flutter/material.dart';
import 'package:vk/main.dart';
import 'package:vk/bottomNavigationBar.dart';
import 'package:vk/logIn/restore1.dart';

class LogIn extends StatefulWidget {
  @override
  _LogInState createState() => _LogInState();
}

class _LogInState extends State<LogIn> {

  final TextEditingController emailOrPhone =  TextEditingController();
  final TextEditingController password =  TextEditingController();
  bool isEmailOrPhone = false;
  bool isPassword = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: themeColor ? Colors.white : Colors.black,
        body: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              SizedBox(height: 20),
              Row(
                  children: <Widget>[
                    IconButton(
                        icon: Icon(Icons.close),
                        color: themeColor ? Color(0xff4c75a3) : Colors.white,
                        onPressed: () {
                          Navigator.pop(context);
                        }
                    ),
                    SizedBox(width: 120),
                    Image.asset(
                        "assets/vkGrey.png",
                        height: 15,
                        width: 15
                    ),
                    SizedBox(width: 10),
                    Text(
                        "connect",
                        style: TextStyle(
                            color: Colors.grey
                        )
                    )
                  ]
              ),
              SizedBox(height: 50),
              Image.asset(
                  themeColor ? "assets/vkLogo.png" : "assets/vkLogoDark.png",
                  height: 100,
                  width: 100
              ),
              SizedBox(height: 50),
              Container(
                  width: 380,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        color: Colors.grey,
                      )
                  ),
                  child: Column(
                    children: <Widget>[
                      Row(
                          children: <Widget>[
                            SizedBox(width: 10),
                            Container(
                                width: 300,
                                child: TextField(
                                    controller: emailOrPhone,
                                    keyboardType: TextInputType.text,
                                    style: TextStyle(
                                        color: themeColor ? Colors.black : Colors.white
                                    ),
                                    decoration: InputDecoration(
                                        hintText: language ? "Email или телефон" : "Email or phone",
                                        fillColor: Colors.grey,
                                        hintStyle: TextStyle(
                                            color: Colors.grey
                                        )
                                    ),
                                    onChanged: (val) {
                                      setState(() {
                                        if (emailOrPhone.text.length > 0)
                                          isEmailOrPhone = true;
                                        else isEmailOrPhone = false;
                                      });
                                    }
                                )
                            ),
                            isEmailOrPhone ? IconButton(
                                icon: Icon(Icons.close),
                                color: Colors.grey,
                                onPressed: () {
                                  setState(() {
                                    emailOrPhone.text = "";
                                    isEmailOrPhone = false;
                                  });
                                }
                            ) : Container()
                          ]
                      ),
                      Row(
                        children: <Widget>[
                          SizedBox(width: 10),
                          Container(
                              width: 300,
                              child: TextField(
                                  obscureText: true,
                                  controller: password,
                                  keyboardType: TextInputType.text,
                                  style: TextStyle(
                                      color: themeColor ? Colors.black : Colors.white
                                  ),
                                  decoration: InputDecoration(
                                      hintText: language ? "Пароль" : "Password",
                                      fillColor: Colors.grey,
                                      hintStyle: TextStyle(
                                          color: Colors.grey
                                      )
                                  ),
                                  onChanged: (val) {
                                    setState(() {
                                      if (password.text.length > 0)
                                        isPassword = true;
                                      else isPassword = false;
                                    });
                                  }
                              )
                          ),
                          IconButton(
                              icon: Icon(Icons.question_answer),
                              color: Colors.grey,
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => Restore1()),
                                );
                              }
                          )
                        ],
                      )
                    ]
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
                      MaterialPageRoute(builder: (context) => VkBottomNavigationBar()),
                    );
                  },
                  color: themeColor ? Color(0xff4c75a3) : Colors.white,
                  textColor: themeColor ? Colors.white : Colors.black,
                  child: Text(language ? "Войти" : "Log In"),
                ),
              ),
            ]
        )
    );
  }
}