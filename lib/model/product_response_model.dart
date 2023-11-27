// To parse this JSON data, do
//
//     final productResponseModel = productResponseModelFromJson(jsonString);

import 'dart:convert';

List<ProductResponseModel> productResponseModelFromJson(String str) => List<ProductResponseModel>.from(json.decode(str).map((x) => ProductResponseModel.fromJson(x)));

String productResponseModelToJson(List<ProductResponseModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ProductResponseModel {
  int idBarang;
  String gambarBarang;
  String namaBarang;
  String hargaBarang;
  double rating;
  String spesifikasiBarang;
  String deskripsiBarang;
  String jumlahTerjual;
  int sisaBarang;
  dynamic createdAt;
  dynamic updatedAt;

  ProductResponseModel({
    required this.idBarang,
    required this.gambarBarang,
    required this.namaBarang,
    required this.hargaBarang,
    required this.rating,
    required this.spesifikasiBarang,
    required this.deskripsiBarang,
    required this.jumlahTerjual,
    required this.sisaBarang,
    required this.createdAt,
    required this.updatedAt,
  });

  factory ProductResponseModel.fromJson(Map<String, dynamic> json) =>
      ProductResponseModel(
        idBarang: json["id_barang"],
        gambarBarang: json["gambar_barang"],
        namaBarang: json["nama_barang"],
        hargaBarang: json["harga_barang"],
        rating: json["rating"]?.toDouble(),
        spesifikasiBarang: json["spesifikasi_barang"],
        deskripsiBarang: json["deskripsi_barang"],
        jumlahTerjual: json["jumlah_terjual"],
        sisaBarang: json["sisa_barang"],
        createdAt: json["created_at"],
        updatedAt: json["updated_at"],
      );

  Map<String, dynamic> toJson() => {
        "id_barang": idBarang,
        "gambar_barang": gambarBarang,
        "nama_barang": namaBarang,
        "harga_barang": hargaBarang,
        "rating": rating,
        "spesifikasi_barang": spesifikasiBarang,
        "deskripsi_barang": deskripsiBarang,
        "jumlah_terjual": jumlahTerjual,
        "sisa_barang": sisaBarang,
        "created_at": createdAt,
        "updated_at": updatedAt,
      };
}
