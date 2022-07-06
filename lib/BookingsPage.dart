
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tourinc/DestinationPage.dart';
import 'package:tourinc/HomePage.dart';
import 'package:tourinc/ProfilePage.dart';

class BookingsPageWidget extends StatefulWidget {
  const BookingsPageWidget({Key? key}) : super(key: key);

  @override
  _BookingsPageWidgetState createState() => _BookingsPageWidgetState();
}

class _BookingsPageWidgetState extends State<BookingsPageWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Align(
                alignment: AlignmentDirectional(0, 0),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 15, 0, 10),
                  child: Text(
                    'BOOKINGS',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 24,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(45, 0, 45, 0),
                child: ListView(
                  padding: EdgeInsets.zero,
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  children: [
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 15, 0, 15),
                      child: Card(
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        color: Color(0xFF088454),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25),
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Image.network(
                              'https://picsum.photos/seed/605/600',
                              width: double.infinity,
                              height: 60,
                              fit: BoxFit.cover,
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  10, 10, 10, 10),
                              child: Container(
                                width: double.infinity,
                                height: 100,
                                decoration: BoxDecoration(
                                  color: Color(0x00EEEEEE),
                                ),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          5, 5, 5, 5),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Expanded(
                                            child: Text(
                                              'Labuan Bajo',
                                              style:
                                              TextStyle(
                                                fontFamily: 'Poppins',
                                                color:Colors.white,
                                              ),
                                            ),
                                          ),
                                          Expanded(
                                            child: Text(
                                              '5 Days',
                                              textAlign: TextAlign.end,
                                              style:
                                              TextStyle(
                                                fontFamily: 'Poppins',
                                                color: Colors.white,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          5, 5, 5, 5),
                                      child: Text(
                                        'Nadja Shafa',
                                        textAlign: TextAlign.start,
                                        style: TextStyle(
                                          fontFamily: 'Poppins',
                                          color: Colors.white,
                                          fontWeight: FontWeight.normal,
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          5, 5, 5, 5),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Expanded(
                                            child: Text(
                                              '24/08/20',
                                              style:
                                              TextStyle(
                                                fontFamily: 'Poppins',
                                                color: Colors.white,
                                              ),
                                            ),
                                          ),
                                          Expanded(
                                            child: Text(
                                              '19:30',
                                              textAlign: TextAlign.end,
                                              style:
                                              TextStyle(
                                                fontFamily: 'Poppins',
                                                color: Colors.white,
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
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 15, 0, 15),
                      child: Card(
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        color: Color(0xFF088454),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25),
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Image.network(
                              'https://picsum.photos/seed/605/600',
                              width: double.infinity,
                              height: 60,
                              fit: BoxFit.cover,
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  10, 10, 10, 10),
                              child: Container(
                                width: double.infinity,
                                height: 100,
                                decoration: BoxDecoration(
                                  color: Color(0x00EEEEEE),
                                ),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          5, 5, 5, 5),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Expanded(
                                            child: Text(
                                              'Raja Ampat',
                                              style:
                                              TextStyle(
                                                fontFamily: 'Poppins',
                                                color:Colors.white,
                                              ),
                                            ),
                                          ),
                                          Expanded(
                                            child: Text(
                                              '3 Days',
                                              textAlign: TextAlign.end,
                                              style:
                                              TextStyle(
                                                fontFamily: 'Poppins',
                                                color: Colors.white,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          5, 5, 5, 5),
                                      child: Text(
                                        'Ryan Rizky',
                                        textAlign: TextAlign.start,
                                        style: TextStyle(
                                          fontFamily: 'Poppins',
                                          color: Colors.white,
                                          fontWeight: FontWeight.normal,
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          5, 5, 5, 5),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Expanded(
                                            child: Text(
                                              '24/08/20',
                                              style:
                                              TextStyle(
                                                fontFamily: 'Poppins',
                                                color: Colors.white,
                                              ),
                                            ),
                                          ),
                                          Expanded(
                                            child: Text(
                                              '19:30',
                                              textAlign: TextAlign.end,
                                              style:
                                              TextStyle(
                                                fontFamily: 'Poppins',
                                                color: Colors.white,
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
                          ],
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
      /*
        bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.business),
              label: 'Business',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.school),
              label: 'School',
            ),
          ],
          currentIndex: 2,
          selectedItemColor: Color(0xFF088454),
          onTap: (index) async {
            switch(index){
              case 0 : {
                await Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => HomeWidget(),
                  ),
                );
              }
              break;
              case 1 : {
                await Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DestinationPageWidget(),
                  ),
                );
              }
              break;
              case 2 : {
                await Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => BookingsPageWidget(),
                  ),
                );
              }
              break;
              case 3 : {
                await Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ProfilePageWidget(),
                  ),
                );
              }
              break;
            }
          },
        )
    */
    );
  }
}
