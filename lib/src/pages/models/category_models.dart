import 'package:flutter/material.dart';

class CategoryModel {
  String name;
  String iconPath;
  Color boxColor;

  CategoryModel(
      {required this.name, required this.iconPath, required this.boxColor});

  static List<CategoryModel> getCategories() {
    List<CategoryModel> categories = [];

    categories.add(
      CategoryModel(
          name: 'Menstrual cycle',
          iconPath: 'assets/noun-ovaries-2653159.svg',
          boxColor: const Color.fromARGB(255, 233, 161, 152)),
    );

    categories.add(
      CategoryModel(
          name: 'Tampons',
          iconPath: 'assets/tampon.svg',
          boxColor: const Color.fromARGB(255, 213, 162, 255)),
    );

    categories.add(
      CategoryModel(
          name: 'PCOS',
          iconPath: 'assets/noun-ovaries-6534607.svg',
          boxColor: const Color.fromARGB(255, 213, 162, 255)),
    );

    return categories;
  }
}
