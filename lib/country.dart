class Country {
  final String codigo;
  final String categoria;
  final String pais;
  final String region;
  final String bodega;
  final String nombre;
  final String origen;
  final String formato;
  final String anada;
  final String precio;


  Country({this.codigo,this.categoria,this.pais,this.region,this.bodega,this.nombre,this.origen,this.formato,this.anada,this.precio});

  factory Country.fromJson(Map<String, dynamic> json) {
    return new Country(
      codigo : json['codigo'] as String,
      categoria: json['categoria'] as String,
      pais: json['pais'] as String,
      region: json['region'] as String,
      bodega: json['bodega'] as String,
      nombre: json['nombre'] as String,
      origen: json['origen'] as String,
      formato: json['formato'] as String,
      anada: json['anada'] as String,
      precio: json['precio'] as String,

    );
  }
}