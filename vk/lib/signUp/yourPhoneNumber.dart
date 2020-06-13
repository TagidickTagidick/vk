import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:vk/main.dart';

class AuthService {

  signOut() {
    FirebaseAuth.instance.signOut();
  }

  signIn(AuthCredential authCreds) {
    FirebaseAuth.instance.signInWithCredential(authCreds);
  }

  signInWithOTP(smsCode, verId) {
    AuthCredential authCreds = PhoneAuthProvider.getCredential(
        verificationId: verId, smsCode: smsCode);
    signIn(authCreds);
  }
}

class YourPhoneNumber extends StatefulWidget {
  @override
  _YourPhoneNumberState createState() => _YourPhoneNumberState();
}

class _YourPhoneNumberState extends State<YourPhoneNumber> {

  static final _formKey = new GlobalKey<FormState>();

  String phoneNo, verificationId, smsCode;

  bool codeSent = false;

  final TextEditingController phoneNumber =  TextEditingController();
  final TextEditingController region =  TextEditingController();
  bool isNumber = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: themeColor ? Colors.white : Colors.black,
        body: Form(
          key: _formKey,
          child: Column(
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
              Center(
                  child: Text(
                      language ? "Введите номер" : "Your Phone Number",
                      style: TextStyle(
                          fontSize: 40,
                          color: themeColor ? Colors.black : Colors.white,
                          fontWeight: FontWeight.bold
                      )
                  )
              ),
              Center(
                  child: Text(
                      language ? "Номер вашего телефона будет" : "Your phone number will be used to log in",
                      style: TextStyle(
                          fontSize: 20,
                          color: themeColor ? Colors.black : Colors.grey
                      )
                  )
              ),
              Center(
                  child: Text(
                      "использоваться для авторизации",
                      style: TextStyle(
                          fontSize: 20
                      )
                  )
              ),
              SizedBox(height: 20),
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
                      SizedBox(width: 20),
                      GestureDetector(
                          onTap: () {
                            openBottomSheet();
                          },
                          child: Text(
                              "+7",
                              style: TextStyle(
                                  color: themeColor ? Colors.black : Colors.white
                              )
                          )
                      ),
                      SizedBox(width: 20),
                      Text(
                          "|",
                          style: TextStyle(
                              color: Colors.grey
                          )
                      ),
                      SizedBox(width: 10),
                      Container(
                          width: 250,
                          child: TextField(
                              autofocus: true,
                              controller: phoneNumber,
                              keyboardType: TextInputType.number,
                              style: TextStyle(
                                color: themeColor ? Colors.black : Colors.white
                              ),
                              decoration: InputDecoration(
                                  hintText: language ? "Номер телефона" : "Phone number",
                                  fillColor: Colors.grey
                              ),
                              onChanged: (val) {
                                setState(() {
                                  this.phoneNo = val;
                                  if (phoneNumber.text.length > 0)
                                    isNumber = true;
                                  else isNumber = false;
                                });
                              }
                          )
                      ),
                      isNumber ? IconButton(
                          icon: Icon(Icons.close),
                          color: Colors.grey,
                          onPressed: () {
                            setState(() {
                              phoneNumber.text = "";
                              isNumber = false;
                            });
                          }
                      ) : Container()
                    ],
                  )
              ),
              SizedBox(height: 100),
              Container(
                  width: 380,
                  child: RaisedButton(
                    color: themeColor ? (isNumber ? Color(0xff4c75a3) : Color(0xffa8bbcd)) : (isNumber ? Colors.white : Colors.grey),
                    textColor: themeColor ? (isNumber ? Colors.white : Colors.grey) : (isNumber? Colors.black : Color(0xff424242)),
                    onPressed: () {
                      verifyPhone(phoneNo);
                    },
                    child: Text(language ? "Получить код" : "Get Code"),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)
                    ),
                  )
              ),
              Center(
                  child: Text(
                      language ? "Нажимая «Получить код», Вы принимаете" : "By pressing Get Code, you agree to the service's",
                      style: TextStyle(
                          color: Color(0xff424242),
                          fontSize: 15
                      )
                  )
              ),
              Row(
                  children: <Widget>[
                    SizedBox(width: language ? 60 : 100),
                    GestureDetector(
                        onTap: _launchURL1,
                        child: Text(
                            language ? "пользовательское соглашение" : "Terms of Service",
                            style: TextStyle(
                                color: Color(0xff424242),
                                decoration: TextDecoration.underline
                            )
                        )
                    ),
                    SizedBox(width: 3),
                    Text(
                        language ? "и" : "and",
                        style: TextStyle(
                            color: Color(0xff424242)
                        )
                    ),
                    SizedBox(width: 3),
                    GestureDetector(
                        onTap: _launchURL2,
                        child: Text(
                            language ? "политику" : "Privacy Policy",
                            style: TextStyle(
                                color: Color(0xff424242),
                                decoration: TextDecoration.underline
                            )
                        )
                    )
                  ]
              ),
              Row(
                  children: <Widget>[
                    SizedBox(width: 110),
                    GestureDetector(
                        onTap: _launchURL2,
                        child: Text(
                            "конфиденциальности",
                            style: TextStyle(
                                decoration: TextDecoration.underline
                            )
                        )
                    ),
                    SizedBox(width: 3),
                    Text("сервиса")
                  ]
              )
            ],
          ),
        )
    );
  }

  Future<void> verifyPhone(phoneNo) async {
    final PhoneVerificationCompleted verified = (AuthCredential authResult) {
      AuthService().signIn(authResult);
    };

    final PhoneVerificationFailed verificationfailed =
        (AuthException authException) {
      print('${authException.message}');
    };

    final PhoneCodeSent smsSent = (String verId, [int forceResend]) {
      this.verificationId = verId;
      setState(() {
        this.codeSent = true;
      });
    };

    final PhoneCodeAutoRetrievalTimeout autoTimeout = (String verId) {
      this.verificationId = verId;
    };

    await FirebaseAuth.instance.verifyPhoneNumber(
        phoneNumber: phoneNo,
        timeout: const Duration(seconds: 5),
        verificationCompleted: verified,
        verificationFailed: verificationfailed,
        codeSent: smsSent,
        codeAutoRetrievalTimeout: autoTimeout);
  }

  _launchURL1() async {
    const url1 = 'https://vk.com/terms';
    if (await canLaunch(url1)) {
      await launch(url1);
    } else {
      throw 'Could not launch $url1';
    }
  }

  _launchURL2() async {
    const url2 = 'https://vk.com/privacy';
    if (await canLaunch(url2)) {
      await launch(url2);
    } else {
      throw 'Could not launch $url2';
    }
  }

  void openBottomSheet() {
    showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        backgroundColor: Colors.transparent,
        builder: (BuildContext bc) {
          return Container(
              height: 650,
              decoration: BoxDecoration(
                  color: themeColor ? Colors.white : Colors.black,
                  borderRadius: BorderRadius.circular(10)
              ),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget> [
                    Row(
                      children: <Widget>[
                        SizedBox(width: 180),
                        Text(language ? "Регион" : "Region"),
                        SizedBox(width: 120),
                        IconButton(
                            icon: Icon(Icons.close),
                            color: themeColor ? Color(0xff4c75a3) : Colors.white,
                            onPressed: () {
                              Navigator.pop(context);
                            }
                        ),
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        SizedBox(width: 20),
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
                                  Icon(
                                      Icons.search,
                                      color: themeColor ? Color(0xff424242) : Colors.grey
                                  ),
                                  SizedBox(width: 10),
                                  Container(
                                      width: 300,
                                      child: TextField(
                                          controller: region,
                                          keyboardType: TextInputType.text,
                                          style: TextStyle(
                                              color: themeColor ? Colors.black : Colors.white
                                          ),
                                          decoration: InputDecoration(
                                              hintText: language ? "Поиск" : "Search",
                                              fillColor: themeColor ? Color(0xff424242) : Colors.grey,
                                              hintStyle: TextStyle(
                                                  color: themeColor ? Color(0xff424242) : Colors.grey
                                              )
                                          ),
                                      )
                                  )
                                ]
                            )
                        )
                      ],
                    )
                  ]
              )
          );
        });
  }
}