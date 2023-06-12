import '../model/category_model.dart';

class CategoryData {
  static List<Category> getCategoryData() {
    return [
      Category("", ""),
      Category("chair_icon_unselected.svg", "chair_icon.svg"),
      Category("bad_icon.svg", "bad_icon_selected.svg"),
      Category("table_lamp_icon.svg", "table_lamp_icon_selected.svg"),
      Category("plant_icon.svg", "plant_icon_selected.svg"),
      Category("sofa_icon.svg", "sofa_icon_selected.svg"),
    ];
  }

  static List<PopulerItem> getPopulerItemData() {
    return [
      PopulerItem(
          ["doctor_chair.png", "doctor_chair.png", "doctor_chair.png"],
          "Doctor chair",
          "\$50.00",
          false,
          "Bessie Cooper",
          "Ocontent of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English"),
      PopulerItem(
          ["roacking_chair.png", "roacking_chair.png", "roacking_chair.png"],
          "Roacking Chair",
          "\$20.00",
          false,
          "Bessie Cooper",
          "Ocontent of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English"),
      PopulerItem(
          ["wooden_chair.png", "wooden_chair.png", "wooden_chair.png"],
          "Woooden chair",
          "\$20.00",
          false,
          "Bessie Cooper",
          "Ocontent of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English"),
      PopulerItem(
          ["plastic_chair.png", "plastic_chair.png", "plastic_chair.png"],
          "Plastic chair",
          "\$20.00",
          false,
          "Bessie Cooper",
          "Ocontent of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English"),
    ];
  }
}
