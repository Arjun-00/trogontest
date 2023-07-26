//@dart =2.9
import '../model/cast.dart';
import '../model/shows.dart';
import 'package:http/http.dart' as http;

class Services{
  static  var client =http.Client();
  static Future<List<Showes>> getshowsData() async{
    try{
      final responce = await client.get(Uri.parse("https://api.tvmaze.com/shows"));
      if(responce.statusCode == 200) {
        return showsFromJson(responce.body);
      } else{
        return null;
      }
    }catch(e){
      return null;
    }
  }

  static Future<List<Cast>> getcastData() async{
    try{
      final responce = await client.get(Uri.parse("https://api.tvmaze.com/shows/1/cast"));
      if(responce.statusCode == 200) {
        return castFromJson(responce.body);
      } else{
        return null;
      }
    }catch(e){
      return null;
    }
  }
}