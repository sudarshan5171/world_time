import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:world_time/services/world_time.dart';

class ChooseLocation extends StatefulWidget {
  const ChooseLocation({Key? key}) : super(key: key);

  @override
  State<ChooseLocation> createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {

  List<WorldTime> countries = [
    WorldTime("Asia/Kolkata", "Kolkata","india.png" ),
    WorldTime('Asia/Kathmandu', 'Nepal','nepal.png'),
    WorldTime('Europe/London','London', 'uk.png'),
    WorldTime('Europe/Athens','Athens', 'greece.png'),
    WorldTime('Africa/Nairobi','Nairobi','kenya.png'),
    WorldTime('America/Chicago','Chicago','usa.png'),
    WorldTime('America/New_York','New York','usa.png'),
    WorldTime('Asia/Seoul','Seoul','south_korea.png'),
    WorldTime('Asia/Jakarta','Jakarta','indonesia.png'),
  ];

  void updateTime(index) async{

    WorldTime instance = countries[index];
    await instance.getTime();

    Navigator.pushReplacementNamed(context, '/home',arguments: {
      "location": instance.location,
      "time":instance.time,
      "flag":instance.flag,
      "isDay":instance.isDay,
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
      ),
      body: ListView.builder(
        itemCount: countries.length,
        itemBuilder: (BuildContext context, int index){
        return Padding(
          padding: const EdgeInsets.fromLTRB(16, 4, 16, 0),
          child: Card(
            child: ListTile(
              onTap: (){
                updateTime(index);
              },
              title: Text(countries[index].location),
              leading: CircleAvatar(
                backgroundImage: AssetImage('assets/${countries[index].flag}'),
              ),
            ),
          ),
        );
        },
      )
    );
  }
}

