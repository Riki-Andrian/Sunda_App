import 'dart:convert';

Pupuh pupuhFromJson(String str) => Pupuh.fromJson(json.decode(str));

class Pupuh {
    List<PupuhSunda> pupuhSunda;

    Pupuh({
        required this.pupuhSunda,
    });

    factory Pupuh.fromJson(Map<String, dynamic> json) => Pupuh(
        pupuhSunda: List<PupuhSunda>.from(json["pupuh_sunda"].map((x) => PupuhSunda.fromJson(x))),
    );
}

class PupuhSunda {
    int id;
    String nama;
    List<String> polaSajak;
    List<int> jumlahSukuKataPerBaris;
    String watak;
    String link;
    Lirik lirik;

    PupuhSunda({
        required this.id,
        required this.nama,
        required this.polaSajak,
        required this.jumlahSukuKataPerBaris,
        required this.watak,
        required this.link,
        required this.lirik,
    });

    factory PupuhSunda.fromJson(Map<String, dynamic> json) => PupuhSunda(
        id: json["id"],
        nama: json["nama"],
        polaSajak: List<String>.from(json["pola_sajak"].map((x) => x)),
        jumlahSukuKataPerBaris: List<int>.from(json["jumlah_suku_kata_per_baris"].map((x) => x)),
        watak: json["Watak"],
        link: json["link"],
        lirik: Lirik.fromJson(json["lirik"]),
    );
}

class Lirik {
    List<String> versi1;
    List<String> versi2;

    Lirik({
        required this.versi1,
        required this.versi2,
    });

    factory Lirik.fromJson(Map<String, dynamic> json) => Lirik(
        versi1: List<String>.from(json["versi_1"].map((x) => x)),
        versi2: List<String>.from(json["versi_2"].map((x) => x)),
    );
}
