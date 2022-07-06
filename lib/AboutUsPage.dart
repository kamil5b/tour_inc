
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tourinc/BookingsPage.dart';
import 'package:tourinc/DestinationPage.dart';
import 'package:tourinc/ProfilePage.dart';

class AboutUsWidget extends StatefulWidget {
  const AboutUsWidget({Key? key}) : super(key: key);

  @override
  _AboutUsWidgetState createState() => _AboutUsWidgetState();
}

class _AboutUsWidgetState extends State<AboutUsWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  List servicesName = [
    "Diving Kit",
    "Adventures",
    "Food & Drinks",
    "Rooms On Board",
    "Assurance",
    "COVID-19 Support"
  ];
  List servicesIcon = [
    const Icon(
      Icons.waves,
      color: Colors.white,
    ),
    const Icon(
      Icons.hiking,
      color: Colors.white,
    ),
    const Icon(
      Icons.food_bank,
      color: Colors.white,
    ),
    const Icon(
      Icons.room,
      color: Colors.white,
    ),
    const Icon(
      Icons.wallet_travel,
      color: Colors.white,
    ),
    const Icon(
      Icons.headphones,
      color: Colors.white,
    ),
  ];

  List servicesDesc = [
    "Don't Worry About Diving Kits, We Supply Every Part Of The Diving Kits And Include Diving Lessons",
    "Lots Of Adventures Await For You To Explore The Wonderful Nature Of Indonesia. All Activities Are Being Well-Prepared By Our Agency",
    "All Meals Are Under Controls. Include Breakfast, Lunch, And Dinner",
    "Room Facilities On Board Are Ready For All Guests And Being Sterilized Daily",
    "Life Assurance Are Giving To All Visitors If Anything Goes Wrong In Our Tours",
    "All Visitors Health Informations Are Integrated With PEDULI LINDUNGI Application By Kemenkes",
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: scaffoldKey,
        body: SafeArea(
          child: GestureDetector(
            onTap: () => FocusScope.of(context).unfocus(),
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(45, 0, 45, 0),
              child: ListView(
                padding: EdgeInsets.zero,
                scrollDirection: Axis.vertical,
                children: [
                  Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 15, 0, 15),
                        child: Card(
                          clipBehavior: Clip.antiAliasWithSaveLayer,
                          color: Color(0xFFF5F5F5),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25),
                          ),
                          child: Image.network(
                            'https://picsum.photos/seed/605/600',
                            width: double.infinity,
                            height: 160,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 10),
                        child: Text(
                          'About Us',
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            color: Color(0xFF088454),
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 10),
                        child: Text(
                          'Tour.Inc Offers You A Wonderful Experience In Sailing Through All Of Indonesia With Many Activities Include',
                          textAlign: TextAlign.center,
                        ),
                      ),
                      const Divider(),
                      const Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 10),
                        child: Text(
                          'Facility',
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            color: Color(0xFF088454),
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Container(
                        height: 350,
                        child: ListView.builder(
                          itemCount: servicesName.length,
                          scrollDirection: Axis.vertical,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.symmetric(vertical: 10),
                              child: Container(
                                decoration: BoxDecoration(
                                    color: const Color(0xFF088454),
                                    border: Border.all(color: Colors.white),
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(7))),
                                alignment: Alignment.center,
                                width: 100,
                                child: Column(children: [
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  servicesIcon[index],
                                  Text(
                                    servicesName[index],
                                    style: const TextStyle(color: Colors.white),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    servicesDesc[index],
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(color: Colors.white),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                ]),
                              ),
                            );
                          },
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
        /*
        bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'AboutUs',
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
          currentIndex: 0,
          selectedItemColor: Color(0xFF088454),
          onTap: (index) async {
            switch(index){
              case 0 : {
                await Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => AboutUsWidget(),
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
