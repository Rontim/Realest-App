import 'package:get/get.dart';
import 'package:realest_app/src/features/screens/home/home_screen.dart';

class LoadScreenController extends GetxController {
  static LoadScreenController get instance => Get.find();

  @override
  void onInit() {
    super.onInit();
    Future.delayed(const Duration(seconds: 5), () {
      Get.offAll(() => const Home());
    });
  }
}
