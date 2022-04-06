import 'package:get/get.dart';

class Dimensions {
  static double screenHeight = Get.context!.height;
  static double screenWidth = Get.context!.width;
  static double height = 760;

  static double pageView = screenHeight / 2.375;
  static double pageViewContainer = screenHeight / 3.45;
  static double pageViewTextContainer = screenHeight / 6.3;

  heightFactor(double h) {
    double factor = 760 / h;
    return screenHeight / factor;
  }

  radiusFactor(double h) {
    double factor = 760 / h;
    return screenHeight / factor;
  }

  widthFactor(double w) {
    double factor = 392.7 / w;
    return screenWidth / factor;
  }
}
