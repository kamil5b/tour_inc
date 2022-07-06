import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tourinc/HomePage.dart';
import 'package:tourinc/api.dart';
import 'package:tourinc/model/destination.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';

class DetailPageWidget extends StatefulWidget {
  const DetailPageWidget(this.destination,{Key? key}) : super(key: key);
  final Destination destination;
  @override
  _DetailPageWidgetState createState() => _DetailPageWidgetState(destination);
}

class _DetailPageWidgetState extends State<DetailPageWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final Destination _destinations;
  DateTime? datePicked ;
  bool unchange = true;
  TextEditingController _textEditingController = TextEditingController();

  _DetailPageWidgetState(Destination destination) : _destinations = destination;


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      key: scaffoldKey,
      resizeToAvoidBottomInset: false, // set it to false
      appBar: AppBar(
        backgroundColor: Color(0xFF088454),
        automaticallyImplyLeading: false,
        title: Text(
          '${_destinations.nama}',
        ),
        actions: [
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0, 0, 12, 0),
            child: IconButton(
              icon: Icon(
                Icons.close_rounded,
                size: 30,
              ),
              onPressed: () async {
                Navigator.pop(context);
              },
            ),
          ),
        ],
        centerTitle: false,
        elevation: 0,
      ),
      body: //SingleChildScrollView(child:
      SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Align(
              alignment: AlignmentDirectional(0, 0),
              child:
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 4, 0, 0),
                    child: Container(
                        width: 120,
                        height: 120,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: Image.network(
                              'https://img.jakpost.net/c/2017/08/02/2017_08_02_30495_1501654303._large.jpg',
                            ).image,
                          ),
                          boxShadow: [
                            BoxShadow(
                              blurRadius: 6,
                              color: Color(0x3A000000),
                              offset: Offset(0, 2),
                            )
                          ],
                          shape: BoxShape.circle,
                        ),
                      ),

                  )
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(16, 16, 16, 0),
                child: TextFormField(
                  enabled: false,
                  obscureText: false,
                  initialValue: '${_destinations.nama}',
                  decoration: InputDecoration(
                    labelText: 'Package Name',
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        width: 2,
                      ),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        width: 2,
                      ),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    contentPadding: EdgeInsetsDirectional.fromSTEB(20, 32, 20, 12),
                  ),
                  textAlign: TextAlign.start,
                  maxLines: 1,
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(16, 16, 16, 0),
                child: TextFormField(
                  enabled: false,
                  obscureText: false,
                  initialValue: '${_destinations.pulau}',
                  decoration: InputDecoration(
                    labelText: 'Island',
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        width: 2,
                      ),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        width: 2,
                      ),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    contentPadding: EdgeInsetsDirectional.fromSTEB(20, 32, 20, 12),
                  ),
                  textAlign: TextAlign.start,
                  maxLines: 1,
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(16, 16, 16, 0),
                child: TextFormField(
                  enabled: false,
                  obscureText: false,
                  initialValue: '${_destinations.durasi}',
                  decoration: InputDecoration(
                    labelText: 'Duration',
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        width: 2,
                      ),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        width: 2,
                      ),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    contentPadding: EdgeInsetsDirectional.fromSTEB(20, 32, 20, 12),
                  ),
                  textAlign: TextAlign.start,
                  maxLines: 1,
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(16, 16, 16, 0),
                child: TextFormField(
                  enabled: false,
                  obscureText: false,
                  initialValue: '${_destinations.harga}',
                  decoration: InputDecoration(
                    labelText: 'Price',
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        width: 2,
                      ),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        width: 2,
                      ),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    contentPadding: EdgeInsetsDirectional.fromSTEB(20, 32, 20, 12),
                  ),
                  textAlign: TextAlign.start,
                  maxLines: 1,
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(16, 16, 16, 0),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(10, 10, 10, 10),
                    child: Text(
                      'Facilities',
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 24
                      )
                      ),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(10, 10, 10, 10),
                      child: Text(
                          '${_destinations.fasilitas}',
                          style: TextStyle(
                              fontFamily: 'Poppins',
                              color: Colors.black,
                          )
                      ),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(10, 10, 10, 10),
                      child: Text(
                          '${_destinations.fasilitas2}',
                          style: TextStyle(
                              fontFamily: 'Poppins',
                              color: Colors.black,
                          )
                      ),
                    ),

                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(10, 10, 10, 10),
                      child: Text(
                          '${_destinations.fasilitas3}',
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            color: Colors.black,
                          )
                      ),
                    ),
                  ],
                )
              ),

              Align(
                alignment: AlignmentDirectional(0,0),
                child:Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 15),
                    child:Column(children: [
                          Text(
                              datePicked == null
                                  ? 'Nothing has been picked yet'
                                  : DateFormat('dd-MM-yyyy').format(datePicked!),
                          style: TextStyle(
                              fontFamily: 'Poppins',
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 24
                          )
                      ),
                      ElevatedButton(
                        onPressed: () {
                          showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime(2000),
                            lastDate: DateTime(2099),

                          ).then((date) {  //tambahkan setState dan panggil variabel _dateTime.
                            setState(() {
                              datePicked = date;
                            });
                          });
                        },
                        child: Text("Pick a date",
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
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 15),
                        child: ElevatedButton(
                          onPressed: () {
                            _order();
                          },
                          child: Text('Order!',
                            style:TextStyle(
                              fontFamily: 'Poppins',
                              color: Colors.white,
                            ),
                          ),
                          style: ElevatedButton.styleFrom(
                            minimumSize: Size(240, 40),
                            primary: Color(0xFF088454),
                            elevation: 3,
                            side: BorderSide(
                              color:  Colors.white,
                              width: 1.5,
                            ),
                          ),
                        ),
                      ),
                    ],
                    )

                  ),

                ),

            ],
          )

        ),
      ),
      
    );
  }
  void _order() async{
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    var user = jsonDecode(localStorage.getString('user')!);

    int id = user['id'];

    var data = {
      'user_id' : id,
      'paket_id' : _destinations.id,
      'tanggal' : datePicked.toString()
    };
    print("ORDERED");
    var res = await Network().auth(data, '/bookings/add');
    var body = jsonDecode(res.body);
    if(body != null) {
      print(body['message']);
      if (body['success']) {
        print("SUCCESS");
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => HomeWidget()),
        );
      }
    }
  }
}


