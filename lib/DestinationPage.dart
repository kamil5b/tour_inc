import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tourinc/BookingsPage.dart';
import 'package:tourinc/DetailPage.dart';
import 'package:tourinc/HomePage.dart';
import 'package:tourinc/ProfilePage.dart';
import 'package:tourinc/model/destination.dart';

class DestinationPageWidget extends StatefulWidget {
  const DestinationPageWidget({Key? key}) : super(key: key);

  @override
  _DestinationPageWidgetState createState() => _DestinationPageWidgetState();
}

class _DestinationPageWidgetState extends State<DestinationPageWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  late Future<List<Destination>> _destinations;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _destinations = getAllDestination();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
        resizeToAvoidBottomInset: false, // set it to false
        body: //SingleChildScrollView(child:
        SafeArea(
          child: GestureDetector(
            onTap: () => FocusScope.of(context).unfocus(),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                const Align(
                  alignment: AlignmentDirectional(0, 0),
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 15, 0, 10),
                    child: Text(
                      'DESTINATION',
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w400,
                        fontSize: 24,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(45, 0, 45, 0),
                    child:
                    FutureBuilder(
                        future: _destinations,
                        builder:(context, AsyncSnapshot snapshot) {
                          if (!snapshot.hasData) {
                            return Center(child: CircularProgressIndicator());
                          } else {
                            return Container(
                                child: ListView.builder(
                                    itemCount: snapshot.data.length,
                                    scrollDirection: Axis.vertical,
                                    itemBuilder: (BuildContext context, int index) {
                                      return Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(0, 15, 0, 15),
                                        child:
                                        InkWell(
                                          onTap: () async {
                                            await Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) => DetailPageWidget(snapshot.data[index]),
                                              ),
                                            );
                                          },
                                          child:Card(
                                            clipBehavior: Clip.antiAliasWithSaveLayer,
                                            color: const Color(0xFF088454),
                                            shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.circular(25),
                                            ),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Image.network(
                                                  snapshot.data[index].url_pic,
                                                  width: double.infinity,
                                                  height: 140,
                                                  fit: BoxFit.cover,
                                                ),
                                                Padding(
                                                  padding: EdgeInsetsDirectional.fromSTEB(
                                                      10, 10, 10, 10),
                                                  child: Text(
                                                    '${snapshot.data[index].nama}',
                                                    style: TextStyle(
                                                      fontFamily: 'Poppins',
                                                      color: Colors.white,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        )

                                      );
                                    }
                                )
                            );
                          }
                        }
                    )
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
          currentIndex: 1,
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
