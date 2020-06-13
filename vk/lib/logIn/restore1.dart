import 'package:flutter/material.dart';
import 'package:vk/main.dart';
import 'package:vk/logIn/restore2.dart';

class Restore1 extends StatefulWidget {
  @override
  _Restore1State createState() => _Restore1State();
}

class _Restore1State extends State<Restore1> {

  final TextEditingController emailOrPhone =  TextEditingController();
  bool isEmailOrPhone = false;

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
                    SizedBox(width: 20),
                    GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Text(
                          language ? "Отмена" : "Cancel",
                          style: TextStyle(
                            color: themeColor ? Color(0xff4c75a3) : Colors.white,
                          ),
                        )
                    ),
                    SizedBox(width: language ? 100 : 120),
                    Text(
                        language ? "Восстановление" : "Restore",
                        style: TextStyle(
                            color: themeColor ? Colors.black : Colors.white
                        )
                    ),
                    SizedBox(width: 50),
                    isEmailOrPhone ? GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Text(
                          language ? "Далее" : "Cancel",
                          style: TextStyle(
                              color: themeColor ? Colors.black : Colors.white
                          ),
                        )
                    ) : Container(),
                  ]
              ),
              SizedBox(height: 20),
              Row(
                children: <Widget>[
                  SizedBox(width: 20),
                  Text(
                      language ? "Пожалуйста, укажите email или телефон, который" : "Please enter the email or phone number that you used to sign in",
                      style: TextStyle(
                          color: Colors.grey
                      )
                  ),
                ],
              ),
              Row(
                children: <Widget>[
                  SizedBox(width: 20),
                  Text(
                      language ? "Email или телефон" : "Email or phone number",
                      style: TextStyle(
                          color: Colors.grey
                      )
                  ),
                ],
              ),
              SizedBox(height: 10),
              Container(
                width: 380,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: Colors.grey,
                    )
                ),
                child: Row(
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
                                  hintText: language ? "Ссылка на страницу" : "Email or phone number",
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
                      )
                    ]
                )
              ),
              SizedBox(height: 10),
              Row(
                children: <Widget>[
                  SizedBox(width: 20),
                  GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Restore2()),
                        );
                      },
                      child: Text(
                        language ? "Я не могу указать эти данные" : "I don't remember",
                        style: TextStyle(
                          color: Color(0xff4c75a3),
                        )
                      )
                  )
                ]
              )
            ]
        )
    );
  }
}