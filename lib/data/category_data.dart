import 'package:flutter/cupertino.dart';

import '../models/category_model.dart';

class CategoryData with ChangeNotifier {
  static const apiKey =
      '563492ad6f917000010000014a51f74cba2a474db46997e288e86757';
  List<CategoryModel> _categories = [
    CategoryModel(
      'Street Art',
      'https://images.pexels.com/photos/545008/pexels-photo-545008.jpeg?auto=compress&cs=tinysrgb&dpr=2&w=500',
    ),
    CategoryModel(
      'Wild Life',
      'https://images.pexels.com/photos/704320/pexels-photo-704320.jpeg?auto=compress&cs=tinysrgb&dpr=2&w=500',
    ),
    CategoryModel(
      'Nature',
      'https://images.pexels.com/photos/34950/pexels-photo.jpg?auto=compress&cs=tinysrgb&dpr=2&w=500',
    ),
    CategoryModel(
      'City',
      'https://images.pexels.com/photos/466685/pexels-photo-466685.jpeg?auto=compress&cs=tinysrgb&dpr=2&w=500',
    ),
    CategoryModel(
      'Motivation',
      'https://images.pexels.com/photos/1434819/pexels-photo-1434819.jpeg?auto=compress&cs=tinysrgb&h=750&w=1260',
    ),
    CategoryModel(
      'Bikes',
      'https://images.pexels.com/photos/2116475/pexels-photo-2116475.jpeg?auto=compress&cs=tinysrgb&dpr=2&w=500',
    ),
    CategoryModel(
      'Cars',
      'https://images.pexels.com/photos/1149137/pexels-photo-1149137.jpeg?auto=compress&cs=tinysrgb&dpr=2&w=500',
    ),
  ];
  List<CategoryModel> get getCategory => [..._categories];
}
