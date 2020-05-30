class Note2 {
  String pais;


  Note2(this.pais);

  Note2.fromJson(Map<String, dynamic> json) {
    pais = json['pais'];


  }
}

