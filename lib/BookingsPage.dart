import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:tourinc/BookingsPage.dart';
import 'package:tourinc/DetailPage.dart';
import 'package:tourinc/HomePage.dart';
import 'package:tourinc/ProfilePage.dart';
import 'package:tourinc/model/Bookings.dart';

class BookingsPageWidget extends StatefulWidget {
  const BookingsPageWidget({Key? key}) : super(key: key);

  @override
  _BookingsPageWidgetState createState() => _BookingsPageWidgetState();
}

class _BookingsPageWidgetState extends State<BookingsPageWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  late Future<List<Bookings>> _bookings;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _bookings = getAllBookings();
  }

  showAlertDialog(BuildContext context,int id) {

    // set up the buttons
    Widget cancelButton = TextButton(
      child: Text("Cancel"),
      onPressed:  () {
        Navigator.of(context).pop();
      },
    );
    Widget continueButton = TextButton(
      child: Text("Delete"),
      onPressed:  () {
        DeleteBooking(id);
        Navigator.of(context).pop();
      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("Delete Bookings"),
      content: Text("Are you sure cancel the booking?"),
      actions: [
        cancelButton,
        continueButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
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
                    'BOOKINGS',
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
                        future: _bookings,
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
                                                '${snapshot.data[index].destination.url_pic}',
                                                width: double.infinity,
                                                height: 60,
                                                fit: BoxFit.cover,
                                              ),
                                              Padding(
                                                padding: EdgeInsetsDirectional.fromSTEB(
                                                    10, 10, 10, 10),
                                                child: Container(
                                                  width: double.infinity,
                                                  height: 170,
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
                                                                '${snapshot.data[index].destination.nama}',
                                                                style:
                                                                TextStyle(
                                                                  fontFamily: 'Poppins',
                                                                  color:Colors.white,
                                                                ),
                                                              ),
                                                            ),
                                                            Expanded(
                                                              child: Text(
                                                                '${snapshot.data[index].destination.durasi}',
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
                                                        child: Row(
                                                          mainAxisSize: MainAxisSize.max,
                                                          children: [
                                                            Expanded(
                                                              child: Text(
                                                                '${snapshot.data[index].destination.pulau}',
                                                                style:
                                                                TextStyle(
                                                                  fontFamily: 'Poppins',
                                                                  color:Colors.white,
                                                                ),
                                                              ),
                                                            ),
                                                            Expanded(
                                                              child: Text(
                                                                '${snapshot.data[index].destination.harga}',
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
                                                        child: Row(
                                                          mainAxisSize: MainAxisSize.max,
                                                          children: [
                                                            Expanded(
                                                              child: Text(
                                                                DateFormat('dd-MM-yyyy').format(snapshot.data[index].tanggal),
                                                                style:
                                                                TextStyle(
                                                                  fontFamily: 'Poppins',
                                                                  color: Colors.white,
                                                                ),
                                                              ),
                                                            ),
                                                            Expanded(
                                                              child: ElevatedButton(
                                                                onPressed: () {
                                                                  showAlertDialog(context,snapshot.data[index].id);
                                                                },
                                                                child: Text("Delete",
                                                                  style:TextStyle(
                                                                    fontFamily: 'Poppins',
                                                                    color: Colors.white,
                                                                  ),
                                                                ),
                                                                style: ElevatedButton.styleFrom(
                                                                  primary: Colors.red,
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
                                                      Padding(
                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                            5, 5, 5, 5),
                                                        child: Row(
                                                          mainAxisSize: MainAxisSize.max,
                                                          children: [
                                                            Expanded(
                                                              child: ElevatedButton(
                                                                onPressed: () {
                                                                  showDatePicker(
                                                                    context: context,
                                                                    initialDate: snapshot.data[index].tanggal,
                                                                    firstDate: DateTime.now(),
                                                                    lastDate: DateTime(2099),

                                                                  ).then((date) {  //tambahkan setState dan panggil variabel _dateTime.
                                                                    setState(() {
                                                                      snapshot.data[index].tanggal = date;
                                                                    });
                                                                    EditTanggal(snapshot.data[index].id, date!);
                                                                  });
                                                                },
                                                                child: Text("Edit Tanggal",
                                                                  style:TextStyle(
                                                                    fontFamily: 'Poppins',
                                                                    color: Color(0xFF088454),
                                                                  ),
                                                                ),
                                                                style: ElevatedButton.styleFrom(
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

                                            ],
                                          ),
                                        ),
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
      
    );
  }
}
