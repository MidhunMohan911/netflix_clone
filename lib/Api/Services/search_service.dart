import 'dart:convert';

import 'package:get/get.dart';
import 'package:netflix/Api/Model/search.dart';
import 'package:http/http.dart' as http;

class SearchService {
  // List<SearchModel> modelClassData = [];
  Future<List<SearchModel>> postMethod(String query) async {
    var response = await http.get(
      Uri.parse(
          "https://api.themoviedb.org/3/search/movie?api_key=04a9b37fcdea64b805449c345539b21e&language=en-US&query=$query&page=1&include_adult=false"),
    );

    String a = '{"name" : "Mansoor"}';

    //check condition
    if (response.statusCode == 200) {
      // Json decode
      Map<String, dynamic> body = await json.decode(response.body);

      List allSearchData = body['results'];
      List<SearchModel> modelClassData = allSearchData
          .map(
            (element) => SearchModel(
                title: element['title'] ?? element['original_title'],
                image: element['poster_path'] ?? element['backdrop_path'],
                overview: element['overview'],
                releasedate: element['releasedate']),
          )
          .toList();

      return modelClassData;
    } else {
      return [];
    }
  }
}

class SearchController extends GetxController {
  // var datalist = <SearchModel>[].obs;
  var loading = true.obs;
  RxList<SearchModel> data = <SearchModel>[].obs;
  putdata(query) async {
    data.value = await SearchService().postMethod(query);
  
  }

  @override
  void onInit() {
    putdata('Tv & Movies');
    super.onInit();
  }
}
