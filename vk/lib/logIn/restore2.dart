import 'package:flutter/material.dart';
import 'package:vk/main.dart';

class Restore2 extends StatefulWidget {
  @override
  _Restore2State createState() => _Restore2State();
}

class _Restore2State extends State<Restore2> {

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
                    SizedBox(width: 10),
                    IconButton(
                        icon: Icon(Icons.arrow_back_ios),
                        color: themeColor ? Color(0xff4c75a3) : Colors.white,
                        onPressed: () {
                          Navigator.pop(context);
                        }
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
                      language ? "Укажите ссылку на Вашу страницу" : "",
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
                                    hintText: language ? "Ссылка на страницу" : "",
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
                        language ? "Я не могу вспомнить адрес страницы" : "I don't remember",
                        style: TextStyle(
                          color: Color(0xff4c75a3),
                        ),
                      )
                  ),
                ],
              ),
            ]
        )
    );
  }
}