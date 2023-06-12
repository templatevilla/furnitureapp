import 'package:furniture_collection/view/home_screen/model/category_model.dart';
import 'package:get/get.dart';

class HomeScreenController extends GetxController{
  int currentIndex = 0;
  PopulerItem? item;
  int currentPage = 0;
  int colorId = 1;
  int currentQty =1;
  setIndex(int val){
    currentIndex = val;
    update();
  }

  void setLikePosition(PopulerItem data) {
    if(data.like!){
      data.like = false;
      update();
    }
    else{
      data.like = true;
      update();
    }
  }

  void setCurrentData(PopulerItem data) {
    item=data;
    update();
  }

  void setCurrentPage(int value) {
    currentPage= value;
    update();
  }

  void setColorId(id) {
    colorId = id;
    update();
  }

  void addQuentity() {
    currentQty++;
    update();
  }
  void removeQuentity() {
    if(currentQty>1){
      currentQty--;
    }

    update();
  }
}