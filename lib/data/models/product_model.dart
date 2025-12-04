class ProductModel {

  final String id;
  final String name;
  final String? description;
  final double price;
  final String imageUrl;
  final String category;
  final List<String>? sizes;
  final bool isStitched;

  ProductModel({
    required this.id,
    required this.name,
    this.description,
    required this.price,
    required this.imageUrl,
    required this.category,
    this.sizes,
    this.isStitched = false,
  });

  factory ProductModel.mock({
    required String id,
    required String name,
    required double price,
    required String imageUrl,
    required String category,
    bool stitched = false,
  })

  {
    return ProductModel(
      id: id,
      name: name,
      description: 'High quality fabric and finish.',
      price: price,
      imageUrl: imageUrl,
      category: category,
      sizes: ['S', 'M', 'L', 'XL'],
      isStitched: stitched,
    );
  }

}
