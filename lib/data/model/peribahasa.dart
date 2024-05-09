class Peribahasa {
    final int idperibahasa;
    final String makna;
    final String peribahasa;

    Peribahasa({
        required this.idperibahasa,
        required this.makna,
        required this.peribahasa,
    });


    factory Peribahasa.fromJson(Map<String, dynamic> json) => Peribahasa(
        idperibahasa: json["idperibahasa"],
        makna: json["makna"],
        peribahasa: json["peribahasa"],
    );
}
