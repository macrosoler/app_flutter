class Note {
  String codigo;
  String categoria;
  String pais;
  String region;
  String bodega;
  String nombre;
  String origen;
  String formato;
  String anada;
  String precio;


  Note(this.codigo, this.categoria, this.pais,this.region,this.bodega,this.nombre,this.origen,this.formato,this.anada,this.precio);

  Note.fromJson(Map<String, dynamic> json) {
    codigo = json['codigo'];
    categoria = json['categoria'];
    pais = json['pais'];
    region = json['region'];
    bodega = json['bodega'];
    nombre = json['nombre'];
    origen = json['origen'];
    formato = json['formato'];
    anada = json['anada'];
    precio = json['precio'];

  }
}

