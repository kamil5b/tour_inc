import 'package:flutter/material.dart';
import 'package:tourinc/HomePage.dart';
import 'package:tourinc/LoginPage.dart';
import 'package:tourinc/RegisterPage.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const MainPageWidget(),
    );
  }
}

class MainPageWidget extends StatefulWidget {
  const MainPageWidget({Key? key}) : super(key: key);

  @override
  _MainPageWidgetState createState() => _MainPageWidgetState();
}

class _MainPageWidgetState extends State<MainPageWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  bool isAuth = false;

  @override
  void initState(){
    super.initState();
    _checkIfLoggedIn();
  }

  void _checkIfLoggedIn() async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    var token = localStorage.getString('token');
    if(token != null){
      if(mounted){
        setState(() {
          isAuth = true;
        });
      }
    }
  }
  @override
  Widget build(BuildContext context) {
    if(isAuth){
      return HomeWidget();
    }
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Color(0xFF088454),
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Align(
            alignment: AlignmentDirectional(-0.05, 0),
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
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 15),
                  child:
                  ElevatedButton(
                    onPressed: () async {
                      await Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => LoginPageWidget(),
                        ),
                      );
                    },
                    child: Text('Login',
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
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 10),
                  child:
                  ElevatedButton(
                    onPressed: () async {
                      await Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => RegisterPageWidget(),
                        ),
                      );
                    },
                    child: Text('Register'),
                    style: ElevatedButton.styleFrom(
                      minimumSize: Size(240, 40),
                      primary: Color(0xFF088454),
                      elevation: 3,
                      side: BorderSide(
                        color: Colors.white,
                        width: 1.5,
                      ),
                    ),
                  ),

                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
