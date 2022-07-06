import 'dart:convert';

import 'package:tourinc/api.dart';
import 'package:tourinc/model/destination.dart';

class Bookings{
  Destination destination;
  int user_id;
  DateTime tanggal;

  Bookings(this.destination,this.user_id,this.tanggal);

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
  var res = await Network().auth(data, '/bookings/edit');
  var body = json.decode(res.body);
  if(body != null) {
    if (body['success']) {
      print("SUCCESS");
    }else{
      print(body['message']);
    }
  }
}
void DeleteBooking(int paket_id) async{
  print("BOOKING");
  var res = await Network().getData('/bookings/delete/${paket_id}');
  var body = json.decode(res.body);
  if(body != null) {
    if (body['success']) {
      print("SUCCESS");
    }else{
      print(body['message']);
    }
  }
}

Future<List<Bookings>> getAllBookings(int user_id, List<Destination>? listDestination) async{
  var res = await Network().getData('/bookings/${user_id}');
  var body = jsonDecode(res.body);
  List<Bookings> bookings = [];
  if(body['success']){
    var datas = body['data'];
    datas.forEach( (data) =>
        bookings.add(
            Bookings(
              listDestination!.firstWhere((destination) => destination.id == data['paket_id']),
              user_id,
              DateTime.parse(data['tanggal'])
            )
        )
    );
  }
  return bookings;
}