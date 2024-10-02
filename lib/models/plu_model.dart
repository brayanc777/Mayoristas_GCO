class Plu {
  final int id;
  final String plu;
  final String variante;
  final String descripcion;
  final String generico;
  final String codRef;
  final String talla;
  final String color;
  final String marca;

  Plu({
    required this.id,
    required this.plu,
    required this.variante,
    required this.descripcion,
    required this.generico,
    required this.codRef,
    required this.talla,
    required this.color,
    required this.marca,
  });

  factory Plu.fromJson(Map<String, dynamic> json) {
    return Plu(
      id: json['id'],
      plu: json['plu'],
      variante: json['variante'],
      descripcion: json['descripcion'],
      generico: json['generico'],
      codRef: json['codRef'],
      talla: json['talla'],
      color: json['color'],
      marca: json['marca'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'plu': plu,
      'variante': variante,
      'descripcion': descripcion,
      'generico': generico,
      'codRef': codRef,
      'talla': talla,
      'color': color,
      'marca': marca,
    };
  }
}

