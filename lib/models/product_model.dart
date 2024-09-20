class ProductModel {
  final int id;
  final String descripcion;
  final String codRef;
  final String talla;
  final String color;

  ProductModel({
    required this.id,
    required this.descripcion,
    required this.codRef,
    required this.talla,
    required this.color,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json['id'],
      descripcion: json['descripcion'],
      codRef: json['codRef'],
      talla: json['talla'],
      color: json['color'],
    );
  }
}
