import 'dart:convert';

import 'package:tourinc/api.dart';

class Destination {
  int id;
  String nama;
  String durasi;
  String pulau;
  String? fasilitas;
  String? fasilitas2;
  String? fasilitas3;
  int harga;
  String? url_pic;

  Destination(
      this.id,
      this.nama,
      this.durasi,
      this.pulau,
      this.harga,
      {
         this.fasilitas,
         this.fasilitas2,
         this.fasilitas3,
        this.url_pic
      }
      );
}

Future<List<Destination>> getAllDestination() async{
  var res = await Network().getData('/paket/get');
  var body = jsonDecode(res.body);
  List<Destination> dest = [];
  if(body['success']){
    var datas = body['data'];
    datas.forEach( (data) =>
        dest.add(
            Destination(
                data['id'],
                data['nama'],
                data['durasi'],
                data['pulau'],
                data['harga'],
                fasilitas:data['fasilitas'],
              fasilitas2:data['fasilitas2'],
              fasilitas3:data['fasilitas3'],
              url_pic:data['url_pic'],
            )
        )
    );
  }
  return dest;
}