import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:getwidget/components/floating_widget/gf_floating_widget.dart';
import 'package:getwidget/getwidget.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Forgotpassword extends StatefulWidget {
  @override
  _ForgotpasswordState createState() => _ForgotpasswordState();
}

class _ForgotpasswordState extends State<Forgotpassword> {
  String email = '';
  final _auth = FirebaseAuth.instance;
  bool showFloatingToast = false;

  String toastMessage = "";
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Colors.white,
        body: GFFloatingWidget(
        verticalPosition: MediaQuery.of(context).size.height * 0.8,
          horizontalPosition: MediaQuery.of(context).size.width * 0.1,
          showBlurness: showFloatingToast,
          blurnessColor: Colors.black54,
          child: showFloatingToast
          ? GFToast(
          backgroundColor: Colors.black,
          text: toastMessage,
          type: GFToastType.rounded,
          textStyle: const TextStyle(
          color: Colors.white,
          letterSpacing: 1.0,
          fontWeight: FontWeight.w600,
          ),
          alignment: Alignment.center,
          width: MediaQuery.of(context).size.width * 0.7,
          button: GFButton(
          onPressed: () {
          setState(() {
          showFloatingToast = false;
          });
          },
          text: 'CLOSE',
          type: GFButtonType.transparent,
          color: GFColors.SUCCESS,
          ),
          autoDismiss: false,
          )
        : Container(),
      body: Center(
        child: SingleChildScrollView(
          child:Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 11.0,bottom: 30),
                child: Center(
                    child: Text(
                      'Reset Password',
                    style: TextStyle(
                        fontSize: 30.0,
                        fontWeight: FontWeight.w500,
                        fontFamily: 'Roboto',
                        color: Colors.black54),),),
              ),
              Center(
                child: Container(
                  height: MediaQuery.of(context).size.height/3,
                  width: MediaQuery.of(context).size.width*(5/6),
                //padding: const EdgeInsets.all(8.0),
                  child: Card(
                  //margin: EdgeInsets.all(10),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                  ),
                    elevation: 8.0,
                  //color: Colors.orange,
                    shadowColor: Colors.orange,
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.8,
                      //margin: EdgeInsets.only(top: 20),
                      child: Center(
                        child: SingleChildScrollView(
                            child: Column(

                              children: [
                                Container(
                                  padding: EdgeInsets.only(top:5, left: 13, right:13,bottom: 13),
                                  child: TextField(
                                    keyboardType: TextInputType.emailAddress,
                                    decoration: InputDecoration(hintText: 'E-mail',hintStyle:
                                        TextStyle(color: Colors.grey[700], fontSize: 14),
                                      contentPadding:
                                      EdgeInsets.only(top: 20, bottom: 20, left: 38),
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(color: Colors.orange),
                                        borderRadius:
                                        BorderRadius.all(Radius.circular(10.0)),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(color: Colors.orange[600]),
                                        borderRadius:
                                        BorderRadius.all(Radius.circular(10.0)),
                                      )),
                                    onChanged: (val){
                                      setState(() {
                                        email=val;
                                      });
                                    },
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(top: 20.0, left: 50.0, right: 50.0),
                                  height: 50.0,
                                  width: double.maxFinite,
                                  child: RaisedButton(
                                    onPressed: (){
                                      try {
                                        print(email==null?'null':email);
                                        print('hello');
                                        _auth.sendPasswordResetEmail(
                                            email:email).then((value) {
                                          print('sucesfull');
                                          setState(() {
                                            toastMessage =
                                            'ResetE-mail Successfully sent';
                                            showFloatingToast = true;
                                          });
                                        });
                                      }
                                      catch(e){
                                        print(e);
                                      }
                                    },
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20.0),
                                    ),

                                    padding: EdgeInsets.all(0.0),
                                    child: Ink(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20.0),
                                        gradient: LinearGradient(
                                          colors: [Colors.orange[700], Colors.orange[200]],
                                          begin: Alignment.centerLeft,
                                          end: Alignment.centerRight,
                                        ),
                                      ),
                                      child: Container(
                                        alignment: Alignment.center,
                                        child: Text(
                                          "Send",
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            fontFamily: 'Segoe UI',
                                            fontSize: 16,
                                            color: const Color(0xffffffff),
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Container(
                                  padding: const EdgeInsets.only(top: 20,left: 8,right: 8),
                                  child: Center(
                                    child: GestureDetector(
                                        onTap: () {
                                          Navigator.of(context).pop();
                                        },
                                        child: Text(
                                          'Sign Up or Log In',
                                          style: TextStyle(
                                              fontSize: 15.0,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.orange),
                                        )),
                                  ),
                                ),
                              ],
                            ),
                        ),
                      ),
                    ),
                  ),
              ),
            ),],
            ),
          ),
      ),
    ),
    );
  }
}


