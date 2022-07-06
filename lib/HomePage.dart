
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tourinc/BookingsPage.dart';
import 'package:tourinc/DestinationPage.dart';
import 'package:tourinc/AboutUsPage.dart';
import 'package:tourinc/ProfilePage.dart';


class HomeWidget extends StatefulWidget {
  const HomeWidget({Key? key}) : super(key: key);

  @override
  State<HomeWidget> createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
  TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const List<Widget> _widgetOptions = <Widget>[
    AboutUsWidget(),
    DestinationPageWidget(),
    BookingsPageWidget(),
    ProfilePageWidget(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
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
      appBar: AppBar(
        backgroundColor: Color(0xFF088454),
        automaticallyImplyLeading: false,
        title: Align(
          alignment: AlignmentDirectional(0, 0),
          child: Text(
            'TOUR.INC',
            style: TextStyle(
              fontFamily: 'Poppins',
              color: Colors.white,
              fontSize: 26,
            ),
          ),
        ),
        actions: [],
        centerTitle: false,
        elevation: 2,
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(
                Icons.home,
                color:Colors.grey
            ),
            label: 'Home',
            activeIcon:Icon(Icons.home,
                color:Color(0xFF088454)
            ),
            //backgroundColor: Colors.red,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.travel_explore,
                color:Colors.grey),
            label: 'Destination',
            activeIcon:Icon(Icons.travel_explore,
                color:Color(0xFF088454)
            ),
            //backgroundColor: Colors.green,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.book,
                color:Colors.grey),
            label: 'Booking',
            activeIcon:Icon(Icons.book,
                color:Color(0xFF088454)
            ),
            //backgroundColor: Colors.purple,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.people,
                color:Colors.grey),
            label: 'Profile',
            activeIcon:Icon(Icons.people,
                color:Color(0xFF088454)
            ),
            //backgroundColor: Colors.pink,
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Color(0xFF088454),
        onTap: _onItemTapped,
      ),
    );
  }
}

