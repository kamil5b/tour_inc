
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:tourinc/HomePage.dart';
import 'package:tourinc/main.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import 'package:tourinc/api.dart';

class RegisterPageWidget extends StatefulWidget {
  const RegisterPageWidget({Key? key}) : super(key: key);

  @override
  _RegisterPageWidgetState createState() => _RegisterPageWidgetState();
}

class _RegisterPageWidgetState extends State<RegisterPageWidget> {
  late TextEditingController textController1;
  late TextEditingController textController2;
  late bool passwordVisibility1;
  late TextEditingController textController3;
  late bool passwordVisibility2;
  final formKey = GlobalKey<FormState>();
  final scaffoldKey = GlobalKey<ScaffoldState>();
  bool _secureText = true;
  bool _isLoading = false;
  late String name, email, password;

  showHide(){
    setState(() {
      _secureText = !_secureText;
    });
  }
  _showMsg(msg) {
    final snackBar = SnackBar(
      content: Text(msg),
    );
    scaffoldKey.currentState!.showSnackBar(snackBar);
  }
  @override
  void initState() {
    super.initState();
    textController1 = TextEditingController();
    textController2 = TextEditingController();
    passwordVisibility1 = false;
    textController3 = TextEditingController();
    passwordVisibility2 = false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      resizeToAvoidBottomInset: false,
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
                                  labelText: 'Full Name',
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
                                style: TextStyle(
                                  fontFamily: 'Poppins',
                                  color: Colors.white,
                                ),
                                textAlign: TextAlign.center,
                                validator: (nameValue){
                                  if(nameValue!.isEmpty){
                                    return 'Please enter your full name';
                                  }
                                  name = nameValue;
                                  return null;
                                }
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
                              onChanged: (_) => EasyDebounce.debounce(
                                'textController2',
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
                                style: TextStyle(
                                  fontFamily: 'Poppins',
                                  color: Colors.white,
                                ),
                                textAlign: TextAlign.center,
                                validator: (emailValue){
                                  if(emailValue!.isEmpty){
                                    return 'Please enter your email';
                                  }
                                  email = emailValue;
                                  return null;
                                }
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
                              controller: textController3,
                              onChanged: (_) => EasyDebounce.debounce(
                                'textController3',
                                Duration(milliseconds: 2000),
                                    () => setState(() {}),
                              ),
                              autofocus: true,
                              obscureText: !passwordVisibility2,
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
                                        () => passwordVisibility2 =
                                    !passwordVisibility2,
                                  ),
                                  focusNode: FocusNode(skipTraversal: true),
                                  child: Icon(
                                    passwordVisibility2
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
                                validator: (passwordValue){
                                  if(passwordValue!.isEmpty){
                                    return 'Please enter your password';
                                  }
                                  password = passwordValue;
                                  return null;
                                }
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 15),
                        child: ElevatedButton(
                          onPressed: () {
                            if (formKey.currentState!.validate()) {
                              _register();
                            }
                          },
                          child: Text('Register',
                            style:TextStyle(
                              fontFamily: 'Poppins',
                              color: Color(0xFF088454),
                            ),
                          ),
                          style: ElevatedButton.styleFrom(
                            minimumSize: Size(240, 40),
                            primary: Colors.white,
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
  void _register() async{
    setState(() {
      _isLoading = true;
    });
    var data = {
      'name' : name,
      'email' : email,
      'password' : password
    };
    print("REGSITERED");
    var res = await Network().auth(data, '/register');
    var body = json.decode(res.body);
    if(body != null) {
      print(body['message']);
      if (body['success']) {
        print("SUCCESS");
        SharedPreferences localStorage = await SharedPreferences.getInstance();
        localStorage.setString('token', json.encode(body['token']));
        localStorage.setString('user', json.encode(body['user']));
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => HomeWidget()),
        );
      }
    } else{
      if(body['message']['name'] != null){
        _showMsg(body['message']['name'][0].toString());
      }
      else if(body['message']['email'] != null){
        _showMsg(body['message']['email'][0].toString());
      }
      else if(body['message']['password'] != null){
        _showMsg(body['message']['password'][0].toString());
      }
    }

    setState(() {
      _isLoading = false;
    });
  }
}
