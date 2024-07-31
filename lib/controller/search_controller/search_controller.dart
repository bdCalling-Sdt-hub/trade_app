import 'package:get/get.dart';

class SearchListController extends GetxController {
  var selectedCategory = 'Electronics'.obs;
  var selectedSubCategory = 'Television'.obs;

  List<String> categories = ['Electronics', 'Furniture', 'Clothing','Mobile'];
  List<String> subCategories = ['Television', 'Sofa', 'Shirt','Freez'];

  void updateCategory(String newCategory) {
    selectedCategory.value = newCategory;
  }

  void updateSubCategory(String newSubCategory) {
    selectedSubCategory.value = newSubCategory;
  }
}
