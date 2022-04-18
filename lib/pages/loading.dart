import 'package:flutter/material.dart';
import 'package:world_time/services/world_time.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatefulWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading>{


  Future<void> setUpWorldTime() async {

    WorldTime instance = WorldTime("Asia/Kolkata","Kolkata", "kolkata.png");
    await instance.getTime();

    Navigator.pushReplacementNamed(context, '/home',arguments: {
      "location": instance.location,
      "time":instance.time,
      "flag":instance.flag,
      "isDay":instance.isDay,
    });
  }

  @override
  void initState() {
    super.initState();
    setUpWorldTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: SpinKitThreeInOut(
            color: Colors.blue,
            size: 50.0,
          )
      ),
    );
  }
}

