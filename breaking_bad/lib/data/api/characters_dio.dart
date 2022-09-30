import 'package:breaking_bad/const/strings.dart';
import 'package:dio/dio.dart';

class CharactersDio{
  late Dio dio;

  CharactersDio(){
    BaseOptions baseOptions = BaseOptions(
      baseUrl: baseUrl,
      receiveDataWhenStatusError: true,
      receiveTimeout: 20*1000,
      connectTimeout: 20*1000,
    );
    dio = Dio(baseOptions);
  }

  Future <List<dynamic>> getAllCharacters () async {
    Response response = await dio.get(charactersRoute).catchError((e){
      print(e.toString());
    });
    return response.data;
  }

}