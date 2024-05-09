class Kamus{
    final String kamus_arti;
    final int kamus_id;
    final String kamus_kata;
    final dynamic kamus_status;

    Kamus({
        required this.kamus_arti,
        required this.kamus_id,
        required this.kamus_kata,
        required this.kamus_status,
    });


    factory Kamus.fromJson(Map<String, dynamic> json) => Kamus(
        kamus_arti: json["kamus_arti"],
        kamus_id: json["kamus_id"],
        kamus_kata: json["kamus_kata"],
        kamus_status: json["kamus_status"],
    );
}
