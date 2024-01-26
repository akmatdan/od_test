import 'dart:math';
import 'package:get/get.dart';
import 'package:od_photo/features/home/models/photos_model.dart';

import '../../../services/api_services.dart';

class ImageUIController extends GetxController {
  RxList<PhotosModel> latestPhotos = RxList();
  RxList<PhotosModel> popularPhotos = RxList();
  RxBool isLoading = true.obs;
  RxString apiKey = "dEjFFWrqb6X3ZJOhNdOT3JuB0G-Ctq8t7gsPBQOyeGI".obs;

  /// Get Picture
  getPictureData(String orderBy) async {
    isLoading.value = true;
    var response = await ApiService().getMethod(
        "https://api.unsplash.com/photos/?per_page=30&order_by=$orderBy&client_id=$apiKey");

    if (response.statusCode == 200) {
      if (orderBy == "latest") {
        latestPhotos = RxList();
        response.data.forEach((element) {
          latestPhotos.add(PhotosModel.fromJson(element));
        });
      } else if (orderBy == "popular") {
        popularPhotos = RxList();
        response.data.forEach((element) {
          popularPhotos.add(PhotosModel.fromJson(element));
        });
      }
      isLoading.value = false;
    }

    log(response.statusCode);
  }

  @override
  void onInit() {
    getPictureData("latest");
    getPictureData("popular");
    super.onInit();
  }
}
