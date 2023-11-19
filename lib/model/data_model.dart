class ProductModel {
  static String table = 'products';

  int id;
  String productName;
  int categoryId;

  ProductModel(
      {required this.id, required this.productName, required this.categoryId});

  static ProductModel fromMap(Map<String, dynamic> map) {
    return ProductModel(
        id: map["id"],
        productName: map['productName'].toString(),
        categoryId: map['categoryId']);
  }

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = {
      'id': id,
      'productName': productName,
      'categoryId': categoryId
    };

    map['id'] = id;
    return map;
  }
}

// class CategoryModel {
//   static String table = 'product_categories';

//   String categoryName;
//   int categoryId;

//   CategoryModel({
//     this.categoryId,
//     this.categoryName,
//   });

//   static CategoryModel fromMap(Map<String, dynamic> map) {
//     return CategoryModel(
//       categoryId: map["id"],
//       categoryName: map['categoryName'],
//     );
//   }

//   Map<String, dynamic> toMap() {
//     Map<String, dynamic> map = {
//       'categoryName': categoryName,
//     };

//     if (id != null) {
//       map['id'] = id;
//     }
//     return map;
//   }
// }
