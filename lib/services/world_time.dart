import 'dart:convert';
import 'package:http/http.dart';
import 'package:intl/intl.dart';
class WorldTime{
  String location="";
  String time="";
  String flag="";  //asset flag
  String url="";
  bool isDay=false;

  WorldTime(this.url, this.location, this.flag);

  Future<void> getTime() async{
    try{
      var response = await get(Uri.parse('http://worldtimeapi.org/api/timezone/$url'));
      Map data=jsonDecode(response.body);
      String datetime=data["datetime"];
      String hour=data["utc_offset"].substring(1,3);
      String minute = data["utc_offset"].substring(4,6);

      DateTime date = DateTime.parse(datetime);
      date = date.add(Duration(hours: int.parse(hour),minutes: int.parse(minute)));

      isDay = date.hour>6 && date.hour<20? true : false;

      time = DateFormat.jm().format(date);
    }
    catch(e){
      print("error:$e");
      time="NA";
    }
  }
}