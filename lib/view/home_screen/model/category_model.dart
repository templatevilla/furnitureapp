class Category{
  String? image;
  String? selectedimage;
  Category(this.image,this.selectedimage);
}

class PopulerItem{
  List? image;
  String? subtitle;
  String? discription;
  bool? like;
  String? name;
  String? price;
  PopulerItem(this.image,this.name,this.price,this.like,this.subtitle,this.discription);
}