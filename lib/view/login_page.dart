import 'package:app1/util/colors.dart';
import 'package:app1/util/resize.dart';
import 'package:app1/util/styles.dart';
import 'package:app1/util/constants.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:app1/view/news_page.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _rememberMe = false;

  Widget _buildUserName() {
    return Container(
      alignment: Alignment.centerLeft,
      decoration: kBoxDecorationStyle,
      height: 60.0,
      child: TextField(
        keyboardType: TextInputType.name,
        style: TextStyle(
          color: Colors.black,
          fontFamily: 'OpenSans',
        ),
        decoration: InputDecoration(
          border: InputBorder.none,
          contentPadding: EdgeInsets.only(top: 14.0),
          prefixIcon: Icon(
            Icons.supervised_user_circle,
            color: Colors.black,
          ),
          hintText: 'Username',
          hintStyle: kHintTextStyle,
        ),
      ),
    );
  }

  Widget _buildPasword() {
    return Container(
      alignment: Alignment.centerLeft,
      decoration: kBoxDecorationStyle,
      height: 60.0,
      child: TextField(
        keyboardType: TextInputType.name,
        obscureText: true,
        style: TextStyle(
          color: Colors.black,
          fontFamily: 'OpenSans',
        ),
        decoration: InputDecoration(
          border: InputBorder.none,
          contentPadding: EdgeInsets.only(top: 14.0),
          prefixIcon: Icon(
            Icons.lock,
            color: Colors.black,
          ),
          hintText: 'Password',
          hintStyle: kHintTextStyle,
        ),
      ),
    );
  }

  Widget _buildForgotPasswordBtn() {
    return Container(
      alignment: Alignment.centerRight,
      child: FlatButton(
          onPressed: () {
            print('forgot pasword');
          },
          child: Text(
            'Forgot Pasword?',
            style: kLabelStyle,
          )),
    );
  }

  Widget _buildRememberMeCheckBox() {
    return Container(
      height: 20.0,
      child: Row(
        children: <Widget>[
          Theme(
            data: ThemeData(unselectedWidgetColor: Colors.black),
            child: Checkbox(
              value: _rememberMe,
              checkColor: Colors.green,
              activeColor: Colors.white,
              onChanged: (value) {
                setState(() {
                  _rememberMe = value;
                });
              },
            ),
          ),
          Text(
            'Remember Me ',
            style: kLabelStyle,
          )
        ],
      ),
    );
  }

  Widget _buildLoginBtn() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 5.0),
      width: double.infinity,
      child: RaisedButton(
        elevation: 5.0,
        onPressed: () {
          print('Login Botton pressed');
        },
        padding: EdgeInsets.all(15.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        color: Colors.white,
        child: Text(
          'LOGIN',
          style: GoogleFonts.signika(
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
      ),
    );
  }

  Widget _buildSingUpBtn() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 5.0),
      width: 300,
      child: RaisedButton(
        elevation: 5.0,
        onPressed: () {
          print('sign up Botton pressed');
        },
        padding: EdgeInsets.all(15.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
        color: Colors.white,
        child: Text(
          'SING UP',
          style: GoogleFonts.signika(
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    var _Height = MediaQuery.of(context).size.height;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          //====================imagen de background============================
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            decoration: BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.fill,
                    image: AssetImage('assets/img/backbit.png'))),
          ),
          //====================================================================
          Column(
            children: [
              //====================cuadro de login=================================
              Container(
                padding: EdgeInsets.only(
                  top: ResizerH(
                    MediaQ: _Height,
                    Size: 50,
                  ),
                  left: 25,
                  right: 25,
                ),
                height: MediaQuery.of(context).size.height * (5 / 8),
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    color: whiteLogin,
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(40),
                        bottomRight: Radius.circular(40))),
                child: Column(
                  crossAxisAlignment:
                      CrossAxisAlignment.start, //alineacion a la izquierda
                  children: [
                    //=======================Texto de welcome====================
                    Text(
                      "Welcome To: ",
                      style: GoogleFonts.signika(
                          fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                    //============================================================
                    //=======================imagen de logo=======================
                    Image.asset(
                      'assets/img/BitLogo.png',
                      width: ResizerH(MediaQ: _Height, Size: 157),
                      height: ResizerH(MediaQ: _Height, Size: 63),
                      fit: BoxFit.contain,
                    ),
                    //==============================================================
                    //=======================text login please======================
                    Text(
                      "Please login to continue",
                      style: GoogleFonts.signika(
                          fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                    //==============================================================
                    SizedBox(height: 5.0),
                    _buildUserName(),
                    SizedBox(height: 5.0),
                    _buildPasword(),
                    Row(
                      children: <Widget>[
                        _buildRememberMeCheckBox(),
                        SizedBox(width: 25.0),
                        _buildForgotPasswordBtn(),
                      ],
                    ),
                    _buildLoginBtn(),

                    //SizedBox(height: 30.0),
                  ],
                  //============================================================
                ),
              ),
              //====================================================================

              Container(
                height: MediaQuery.of(context).size.height * (3 / 8),
                width: MediaQuery.of(context).size.width,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(height: 55.0),
                    Text(
                      'OR',
                      style: GoogleFonts.signika(
                        fontWeight: FontWeight.bold,
                        fontSize: 30,
                      ),
                    ),
                    SizedBox(height: 25.0),
                    _buildSingUpBtn(),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
