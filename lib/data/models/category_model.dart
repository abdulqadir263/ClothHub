class CategoryModel {
  final String id;
  final String name;
  final String? parentId;
  final String? imageUrl;

  CategoryModel({
    required this.id,
    required this.name,
    this.parentId,
    this.imageUrl,
  });


  factory CategoryModel.mock({
    required String id,
    required String name,
    String? imageUrl,
    String? parentId,
  })
  {
    return CategoryModel(
      id: id,
      name: name,
      imageUrl: imageUrl,
      parentId: parentId,
    );
  }
}
