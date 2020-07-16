
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:testapp/services/api_services.dart';
import 'package:testapp/utils/colors.dart';
import 'package:testapp/utils/loaders/color_loader_4.dart';
class LoginPage extends StatefulWidget {
  LoginPage({Key key, this.title}) : super(key: key);

  final String title;
  @override
  _LoginPageState createState() => new _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final formKey = new GlobalKey<FormState>();
  bool _isHidePassword = true;

  PageController _pageController;
  String _username;
  String _password;
  TextEditingController _controlleremail =
      new TextEditingController(text: "test");
  //nazmudin@imaniprima.com
  // denny.danuwijaya@imaniprima.com
  TextEditingController _controllerpassword =
      new TextEditingController(text: "damri123");

  void _togglePasswordVisibility() {
    setState(() {
      _isHidePassword = !_isHidePassword;
    });
  }

  Color left = Colors.black;
  Color right = Colors.white;

  ApiService _apiService = new ApiService();

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: Stack(
        children: <Widget>[
          SingleChildScrollView(
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height >= 775.0
                  ? MediaQuery.of(context).size.height
                  : 760.0,
              decoration: new BoxDecoration(
                gradient: new LinearGradient(
                    colors: [
                      // HexColor("4367a3"),
                      // HexColor("69D2E7"),
                      HexColor("FFFFFF"),
                      HexColor("FFFFFF"),
                    ],
                    begin: const FractionalOffset(6.0, 0.0),
                    end: const FractionalOffset(1.0, 1.9),
                    stops: [0.0, 1.0],
                    tileMode: TileMode.clamp),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  // Padding(
                  //   padding: EdgeInsets.only(top: 100.0),
                  //   child: new Image(
                  //       width: 250.0,
                  //       height: 191.0,
                  //       fit: BoxFit.fill,
                  //       image: new AssetImage('assets/img/loginaps.png')),
                  // ),
                  Expanded(
                    flex: 2,
                    child: PageView(
                      controller: _pageController,
                      onPageChanged: (i) {
                        if (i == 0) {
                          setState(() {
                            right = Colors.white;
                            left = Colors.black;
                          });
                        } else if (i == 1) {
                          setState(() {
                            right = Colors.black;
                            left = Colors.white;
                          });
                        }
                      },
                      children: <Widget>[
                        new ConstrainedBox(
                          constraints: const BoxConstraints.expand(),
                          child: Builder(
                            builder: (BuildContext context) {
                              return new Center(
                                child: new Padding(
                                  padding: const EdgeInsets.all(20.0),
                                  child: new Form(
                                    key: formKey,
                                    child: new Column(
                                      children: <Widget>[
                                        Stack(
                                          alignment: Alignment.topCenter,
                                          overflow: Overflow.visible,
                                          children: <Widget>[
                                            Card(
                                              elevation: 2.0,
                                              color: Colors.white,
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                              ),
                                              child: Container(
                                                width: 300.0,
                                                height: 185.0,
                                                child: Column(
                                                  children: <Widget>[
                                                    Padding(
                                                      padding: EdgeInsets.only(
                                                          top: 5.0,
                                                          bottom: 10.0,
                                                          left: 25.0,
                                                          right: 25.0),
                                                      child: new TextFormField(
                                                        style: TextStyle(
                                                            color: Colors
                                                                .blueAccent,
                                                            fontSize: 13),
                                                        maxLengthEnforced:
                                                            false,
                                                        maxLines: 1,
                                                        controller:
                                                            _controlleremail,
                                                        decoration:
                                                            new InputDecoration(
                                                          labelText: 'Username',
                                                          focusColor:
                                                              Colors.black,
                                                        ),
                                                        validator: (value) {
                                                          _username = value;
                                                          if (value.isEmpty) {
                                                            return 'Please enter email';
                                                          }
                                                          if (!isEmailInvalid(
                                                              value)) {
                                                            return 'Please enter valid email';
                                                          }
                                                        },
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding: EdgeInsets.only(
                                                          top: 5.0,
                                                          bottom: 20.0,
                                                          left: 25.0,
                                                          right: 25.0),
                                                      child: TextFormField(
                                                        style: TextStyle(
                                                            color: Colors
                                                                .blueAccent,
                                                            fontSize: 13),
                                                        maxLengthEnforced:
                                                            false,
                                                        autofocus: false,
                                                        maxLines: 1,
                                                        obscureText:
                                                            _isHidePassword, // it's like input type password
                                                        controller:
                                                            _controllerpassword,
                                                        decoration:
                                                            new InputDecoration(
                                                                labelText:
                                                                    'Password',
                                                                focusColor:
                                                                    Colors
                                                                        .white,
                                                                suffix:
                                                                    GestureDetector(
                                                                  onTap: () {
                                                                    _togglePasswordVisibility();
                                                                  },
                                                                  child: Icon(
                                                                    _isHidePassword
                                                                        ? Icons
                                                                            .visibility_off
                                                                        : Icons
                                                                            .visibility,
                                                                    color: _isHidePassword
                                                                        ? Colors
                                                                            .grey
                                                                        : Colors
                                                                            .orange,
                                                                  ),
                                                                ),
                                                                isDense: true),
                                                        validator: (value) {
                                                          _password = value;
                                                          if (value.isEmpty) {
                                                            return 'Please enter password';
                                                          }
                                                        },
                                                      ),
                                                    ),
                                                    /**
                                          *  submit button press
                                          */
                                                  ],
                                                ),
                                              ),
                                            ),
                                            Container(
                                              margin:
                                                  EdgeInsets.only(top: 160.0),
                                              decoration: new BoxDecoration(
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(5.0)),
                                                boxShadow: <BoxShadow>[],
                                                gradient: new LinearGradient(
                                                    colors: [
                                                      HexColor("4367a3"),
                                                      HexColor("69D2E7"),
                                                    ],
                                                    begin:
                                                        const FractionalOffset(
                                                            0.2, 0.2),
                                                    end: const FractionalOffset(
                                                        1.0, 1.0),
                                                    stops: [1.0, 1.0],
                                                    tileMode: TileMode.clamp),
                                              ),
                                              child: MaterialButton(
                                                highlightColor:
                                                    HexColor("FCA80E"),
                                                splashColor: HexColor("FCA80E"),
                                                //shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(5.0))),
                                                child: Padding(
                                                  padding: const EdgeInsets
                                                          .symmetric(
                                                      vertical: 10.0,
                                                      horizontal: 42.0),
                                                  child: Text(
                                                    "LOGIN",
                                                    style: TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 25.0,
                                                        fontFamily:
                                                            "WorkSansBold",
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                ),
                                                onPressed: () {
                                                  _onLoading();
                                                },
                                              ),
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                 
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  void _submit(BuildContext context) {
    final form = formKey.currentState;
    if (form.validate()) {
      form.save();
      _performLogin(context);

      // Navigator.of(context)
      //     .pushReplacement(MaterialPageRoute(builder: (context) => App()));
    }
  }

  void _performLogin(BuildContext context) async {
    print("email : " + _username + _password);
    _apiService.postLogin(_username, _password, context);
  }

  bool isEmailInvalid(String email) {
    RegExp exp = new RegExp(
        r"^[_A-Za-z0-9-+]+(\.[_A-Za-z0-9-]+)*@[A-Za-z0-9-]+(\.[A-Za-z0-9]+)*(\.[A-Za-z]{2,})$");
    return exp.hasMatch(email);
  }

  void _onLoading() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return Dialog(
            backgroundColor: Colors.transparent,
            child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(7),
                  color: Colors.white,
                ),
                height: 90,
                width: 50,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[ColorLoader4(), Text("Please Wait ....")],
                )));
      },
    );
    new Future.delayed(new Duration(seconds: 3), () {
      Navigator.pop(context); //pop dialog
      _submit(context);
    });
  }
}
