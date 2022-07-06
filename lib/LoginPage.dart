
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import 'package:tourinc/api.dart';
import 'package:tourinc/HomePage.dart';
import 'package:tourinc/RegisterPage.dart';

class LoginPageWidget extends StatefulWidget {
  const LoginPageWidget({Key? key}) : super(key: key);

  @override
  _LoginPageWidgetState createState() => _LoginPageWidgetState();
}

class _LoginPageWidgetState extends State<LoginPageWidget> {
  late TextEditingController textController1;
  late TextEditingController textController2;
  late bool passwordVisibility;
  final formKey = GlobalKey<FormState>();
  final scaffoldKey = GlobalKey<ScaffoldState>();
  bool _isLoading = false;
  var email, password;
  bool _secureText = true;

  _showMsg(msg) {
    final snackBar = SnackBar(
      content: Text(msg),
    );
    scaffoldKey.currentState!.showSnackBar(snackBar);
  }
  showHide(){
    setState(() {
      _secureText = !_secureText;
    });
  }

  @override
  void initState() {
    super.initState();
    textController1 = TextEditingController();
    textController2 = TextEditingController();
    passwordVisibility = false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Color(0xFF088454),
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Align(
            alignment: AlignmentDirectional(0, 0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 170, 0, 27),
                  child: Text(
                    'TOUR.INC',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      color: Color(0xFFF1F4F8),
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Form(
                  key: formKey,
                  autovalidateMode: AutovalidateMode.disabled,
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 5, 0, 5),
                        child: Container(
                          width: 240,
                          height: 40,
                          decoration: BoxDecoration(
                            color: Color(0xFF088454),
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                              color: Colors.white,
                              width: 1.5,
                            ),
                          ),
                          child: Padding(
                            padding:
                            EdgeInsetsDirectional.fromSTEB(15, 5, 5, 5),
                            child: TextFormField(
                              controller: textController1,
                              onChanged: (_) => EasyDebounce.debounce(
                                'textController1',
                                Duration(milliseconds: 2000),
                                    () => setState(() {}),
                              ),
                              autofocus: true,
                              obscureText: false,
                              decoration: InputDecoration(
                                labelText: 'E-Mail',
                                enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color(0x00000000),
                                    width: 1,
                                  ),
                                  borderRadius: const BorderRadius.only(
                                    topLeft: Radius.circular(4.0),
                                    topRight: Radius.circular(4.0),
                                  ),
                                ),
                                focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color(0x00000000),
                                    width: 1,
                                  ),
                                  borderRadius: const BorderRadius.only(
                                    topLeft: Radius.circular(4.0),
                                    topRight: Radius.circular(4.0),
                                  ),
                                ),
                              ),
                              validator:(emailValue){
                                if(emailValue!.isEmpty){
                                  return 'Please enter your email';
                                }
                                email = emailValue;
                                return null;
                              },
                              style: TextStyle(
                                fontFamily: 'Poppins',
                                color: Colors.white,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 5, 0, 5),
                        child: Container(
                          width: 240,
                          height: 40,
                          decoration: BoxDecoration(
                            color: Color(0xFF088454),
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                              color: Colors.white,
                              width: 1.5,
                            ),
                          ),
                          child: Padding(
                            padding:
                            EdgeInsetsDirectional.fromSTEB(15, 5, 5, 5),
                            child: TextFormField(
                              controller: textController2,
                                validator: (passwordValue){
                                  if(passwordValue!.isEmpty){
                                    return 'Please enter your password';
                                  }
                                  password = passwordValue;
                                  return null;
                                },
                              onChanged: (_) => EasyDebounce.debounce(
                                'textController2',
                                Duration(milliseconds: 2000),
                                    () => setState(() {}),
                              ),
                              autofocus: true,
                              obscureText: !passwordVisibility,
                              decoration: InputDecoration(
                                labelText: 'Password',
                                enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color(0x00000000),
                                    width: 1,
                                  ),
                                  borderRadius: const BorderRadius.only(
                                    topLeft: Radius.circular(4.0),
                                    topRight: Radius.circular(4.0),
                                  ),
                                ),
                                focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color(0x00000000),
                                    width: 1,
                                  ),
                                  borderRadius: const BorderRadius.only(
                                    topLeft: Radius.circular(4.0),
                                    topRight: Radius.circular(4.0),
                                  ),
                                ),
                                suffixIcon: InkWell(
                                  onTap: () => setState(
                                        () => passwordVisibility =
                                    !passwordVisibility,
                                  ),
                                  focusNode: FocusNode(skipTraversal: true),
                                  child: Icon(
                                    passwordVisibility
                                        ? Icons.visibility_outlined
                                        : Icons.visibility_off_outlined,
                                    color: Colors.white,
                                    size: 22,
                                  ),
                                ),
                              ),
                              style: TextStyle(
                                fontFamily: 'Poppins',
                                color: Colors.white,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 15),
                        child: ElevatedButton(
                          /*onPressed: () async {
                            await Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => HomeWidget(),
                              ),
                            );
                          },*/
                          onPressed: () {
                            if (formKey.currentState!.validate()) {
                              _login();
                            }
                          },
                          child: Text('Login'),
                          style: ElevatedButton.styleFrom(
                            minimumSize: Size(240, 40),
                            primary: Colors.white,
                            textStyle:TextStyle(
                              fontFamily: 'Poppins',
                              color: Colors.white,
                            ),
                            elevation: 3,
                            side: BorderSide(
                              color:  Color(0xFF088454),
                              width: 1.5,
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
        ),
      ),
    );
  }
  void _login() async{
    setState(() {
      _isLoading = true;
    });
    var data = {
      'email' : email,
      'password' : password
    };

    var res = await Network().auth(data, '/login');
    var body = json.decode(res.body);
    if(body['success']){
      SharedPreferences localStorage = await SharedPreferences.getInstance();
      localStorage.setString('token', json.encode(body['token']));
      localStorage.setString('user', json.encode(body['user']));
      Navigator.pushReplacement(
        context,
        new MaterialPageRoute(
            builder: (context) => HomeWidget()
        ),
      );
    }else{
      _showMsg(body['message']);
    }

  setState(() {
      _isLoading = false;
    });
  }
}
