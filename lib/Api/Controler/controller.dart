import 'package:get/get.dart';
import 'package:netflix/Api/Model/model.dart';
import 'package:netflix/Api/Services/services.dart';

class Controller extends GetxController {
  List<DataModel> continueWatching = [];
  List<DataModel> popular = [];
  List<DataModel> trending = [];
  List<DataModel> tvshowsbooks = [];
  List<DataModel> newrelease = [];
  List<DataModel> tvdramas = [];
  List<DataModel> top10 = [];
  List<DataModel> usmovies = [];
  List<DataModel> hindimovies = [];
  List<DataModel> international = [];

  var loading = true.obs;
  Future<List<DataModel>> getData(String url) async {
    loading.value = true;
    try {
      var data = await DataServices().getService(url);
      loading.value = false;
      return data!;
    } catch (e) {
      // Get.snackbar('oops! ', '$e');
      loading.value = false;
      return [];
    }
  }

  @override
  void onInit() {
    getData(urls[0]).then((value) => continueWatching = value);
    getData(urls[1]).then((value) => popular = value);
    getData(urls[2]).then((value) => trending = value);
    getData(urls[3]).then((value) => tvshowsbooks = value);
    getData(urls[4]).then((value) => newrelease = value);
    getData(urls[5]).then((value) => tvdramas = value);
    getData(urls[6]).then((value) => top10 = value);
    getData(urls[7]).then((value) => usmovies = value);
    getData(urls[8]).then((value) => hindimovies = value);
    getData(urls[9]).then((value) => international = value);

    super.onInit();
  }
}
