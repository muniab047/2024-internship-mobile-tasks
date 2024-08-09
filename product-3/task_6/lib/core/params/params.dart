class GetProductParams{
  final int id;

  const GetProductParams({
    required this.id,});
    }

class UpdateProductParams{
  final int id;
  final String name, image, item;
  final List<int> sizes;
  final double price;

  const UpdateProductParams({ 
    required this.id, 
    required this.name, 
    required this.image, 
    required this.item,
    required this.sizes, 
    required this.price});

  
}


class DeleteProductParams{
  final int id;

  const DeleteProductParams({
    required this.id
  });
}

class InsertProductParams{
  final int id;
  final String name, image, item;
  final List<int> sizes;
  final double price;

  const InsertProductParams({ 
    required this.id, 
    required this.name, 
    required this.image, 
    required this.item,
    required this.sizes, 
    required this.price});


}