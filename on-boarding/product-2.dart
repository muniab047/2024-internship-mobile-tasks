import 'dart:io';
class Product extends Product_Manager{
  String? name, description;
  double? price;

  
}


class Product_Manager{

  var products = {};

  void add_new_product(name, description, price){
    products[name] = [description, price];
    print(products);
    print('\n added successfully');
  }

  void view_all_products(){
    if (products.isEmpty){
      print('\n No product found');
    }
    else{

    print('Name   |    Description    |       Price');
    for (var key in products.keys){
      print("$key     ${products[key][0]}     ${products[key][1]}");
    }
    }

  }

  void  view_single_product(String name){
    if (products.containsKey(name)){

    print('$name, ${products[name][0]}, ${products[name][1]} ');
    }

    else{
      print('\n There is no product named $name');
    }

  }

  void edit_product(String old_name,String new_name, String description, double price){
        products.remove(old_name);
        products[new_name] = [description, price];
        print('\n Updated Successfully');
  }

  void delete_product(name){
    if (products.containsKey(name)){
        products.remove(name);
        print('\n Deleted Successfully');
    }

    else{
      print('There is no product named $name');
    }


  }


}


void main(){
  bool flag = true;

  var product = Product();
  while (flag){
    print('\n\n*********************');
    print('********WELCOME******');
    print('*********************\n');

    print('Choose No:');
    print(' 1 : Add a new product \n 2: View all products \n 3: View a single product \n 4: Edit a product (update name, description, price) \n 5: Delete a product\n 6: exit \n');

    var input = stdin.readLineSync();
    if (input == '1'){
      print('Enter name:');
      var name = stdin.readLineSync();
      print('Enter Description:');
      var description = stdin.readLineSync();
      print('Enter price:');
      var str_price = stdin.readLineSync();
      double price = double.parse(str_price ?? '0');

      
      product.add_new_product(name, description, price);


    }
    else if(input == '2'){
      product.view_all_products();


    }
    else if(input == '3'){
      print('Enter Name of The Product: ');
      var name = stdin.readLineSync();
      product.view_single_product(name ?? '');

    }
    else if(input == '4'){
      print('Enter Name:');
      var old_name = stdin.readLineSync();
      if (product.products.containsKey(old_name ?? '')){
        print('Enter Name:');
        var new_name = stdin.readLineSync();
        print('Enter Description:');
        var description = stdin.readLineSync();
        print('Enter price:');
        var str_price = stdin.readLineSync();
        double price = double.parse(str_price ?? '0');
        product.edit_product(old_name ?? '',new_name ?? '', description ?? '', price);}

      else{
        print('There is no product named $old_name');


    }
      

    }
    else if(input == '5'){
      print('Enter Name of The Product: ');
      var name = stdin.readLineSync();
      product.delete_product(name ?? '');

    }
    else{
      flag = false;

    }

  }
}

