import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:netflix/Api/Model/model.dart';

// Get url list
List urls = [
  'https://api.themoviedb.org/3/trending/all/day?api_key=04a9b37fcdea64b805449c345539b21e&language=en-US&page=1',
  'https://api.themoviedb.org/3/movie/popular?api_key=04a9b37fcdea64b805449c345539b21e&language=en-US&page=1',
  'https://api.themoviedb.org/3/trending/all/day?api_key=04a9b37fcdea64b805449c345539b21e',
  'https://api.themoviedb.org/3/tv/popular?api_key=04a9b37fcdea64b805449c345539b21e&language=en-US&page=1',
  'https://api.themoviedb.org/3/movie/upcoming?api_key=04a9b37fcdea64b805449c345539b21e&language=en-US&page=1',
  'https://api.themoviedb.org/3/tv/on_the_air?api_key=04a9b37fcdea64b805449c345539b21e&language=en-US&page=1',
  'https://api.themoviedb.org/3/movie/top_rated?api_key=04a9b37fcdea64b805449c345539b21e&language=en-US&page=1',
  'https://api.themoviedb.org/3/movie/latest?api_key=04a9b37fcdea64b805449c345539b21e&language=en-US',
  'https://api.themoviedb.org/3/discover/movie?api_key=04a9b37fcdea64b805449c345539b21e&language=en-US&sort_by=popularity.desc&include_adult=false&include_video=false&page=1&with_watch_monetization_types=flatrate',
  'https://api.themoviedb.org/3/tv/popular?api_key=04a9b37fcdea64b805449c345539b21e&language=en-US&page=1',
];

class DataServices extends GetxController {
  //create Get function
  Future<List<DataModel>?> getService(String url) async {
    var response = await http.get(Uri.parse(url));

    //check condition
    if (response.statusCode == 200) {
      // Json decode
      Map<String, dynamic> body = await json.decode(response.body);

      List allData = body['results'];
      List<DataModel> modelClassData = allData
          .map(
            (element) => DataModel(
                id: element['id'],
                title: element['title'] ?? element['original_title'],
                image: element['poster_path'],
                overview: element['overview'],
                releasedate: element['releasedate']),
          )
          .toList();

      return modelClassData;
    } else {
      return null;
    }
  }
}
