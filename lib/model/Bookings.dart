import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:tourinc/api.dart';
import 'package:tourinc/model/destination.dart';

class Bookings{
  int id;
  Destination destination;
  int user_id;
  DateTime tanggal;

  Bookings(this.id,this.destination,this.user_id,this.tanggal);

}

void AddBooking(int paket_id, int user_id, DateTime tanggal) async{
  var data = {
    'paket_id' : paket_id,
    'user_id' : user_id,
    'tanggal' : tanggal.toString()
  };
  print("BOOKING");
  var res = await Network().auth(data, '/bookings/add');
  var body = json.decode(res.body);
  if(body != null) {
    if (body['success']) {
      print("SUCCESS");
    }else{
      print(body['message']);
    }
  }
}

void EditTanggal(int booking_id, DateTime tanggal) async{
  var data = {
    'id' : booking_id,
    'tanggal' : tanggal.toString()
  };
  print("BOOKING");
  var res = await Network().editData(data, '/bookings/edit');
  var body = json.decode(res.body);
  if(body != null) {
    if (body['success']) {
      print("SUCCESS");
    }else{
      print(body['message']);
    }
  }
}
void DeleteBooking(int id) async{
  print("BOOKING");
  var res = await Network().deleteData('/bookings/delete/${id}');
  var body = json.decode(res.body);
  if(body != null) {
    if (body['success']) {
      print("SUCCESS");
    }else{
      print(body['message']);
    }
  }
}

Future<List<Bookings>> getAllBookings() async{

  SharedPreferences localStorage = await SharedPreferences.getInstance();
  var user = jsonDecode(localStorage.getString('user')!);

  int id = user['id'];
  var res = await Network().getData('/bookings/${id}');
  var body = jsonDecode(res.body);
  List<Bookings> bookings = [];
  print(res.body);
  if(body['success']){
    var datas = body['data'];
    datas.forEach( (data) =>
        bookings.add(
            Bookings(
              data['id'],
              Destination(
                  data['paket_id'],
                  data['nama'],
                  data['durasi'],
                  data['pulau'],
                  data['harga'],
                url_pic: data['url_pic']
              ),
              id,
              DateTime.parse(data['tanggal'])
            )
        )
    );
  }
  return bookings;
}
