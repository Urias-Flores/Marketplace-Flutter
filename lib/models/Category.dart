class Category{
  final String? id;
  final String name;
  final String image;

  Category(
  this.id, {
    required this.name,
    required this.image
  });

  factory Category.fromJSON(Map<String, dynamic> data){
    return Category(
      data['Document ID'] ?? 'No data',
      name: data['Name'] ?? '',
      image: data['Image'] ?? ''
    );
  }

  toJSON(){
    return {
      'Name': name,
      'Image': image
    };
  }
}