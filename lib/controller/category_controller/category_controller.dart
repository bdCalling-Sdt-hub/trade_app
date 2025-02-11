import 'package:get/get.dart';
import 'package:trade_app/utils/app_const/app_const.dart';

class CategoryController extends GetxController {
  final List<Map<String, dynamic>> cateGoriList = [
    {
      "image": AppConstants.electronics,
      "name": "Electronics",
    },
    {
      "image": AppConstants.mobile,
      "name": "Mobile & Accessories",
    },
    {
      "image": AppConstants.electronics,
      "name": "Vehicles",
    },
    {
      "image": AppConstants.mobile,
      "name": "Home & Living",
    },
    {
      "image": AppConstants.electronics,
      "name": "Jewelry",
    },
  ];

  final List<Map<String, dynamic>> subCategoriesList = [
    {'name': 'Television'},
    {'name': 'Washing Machine '},
    {'name': 'Computer & Laptop'},
    {'name': 'Cameras'},
    {'name': 'Ovens'},
    {'name': 'Air Condition'},
    {'name': 'Refrigerator'},
    {'name': 'IPS & Generator'},
    {'name': 'Geyser'},
  ];
}
