import 'package:flutter/material.dart';

class Home extends StatefulWidget {

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  var data;
  String bgImage="";

  @override
  Widget build(BuildContext context) {

    data = ModalRoute.of(context)?.settings.arguments;
    print(data);

    bgImage = data["isDay"]?"dayimage.jpg":"night.jpg";
    Color bgColor= data["isDay"]?Colors.lightBlueAccent:Colors.indigo;

    return Scaffold(
      backgroundColor: bgColor,
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/$bgImage"),
              fit: BoxFit.cover,
            )
          ),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0, 140, 0, 0),
            child: Column(
              children: [
                TextButton.icon(
                    icon: const Icon(
                      Icons.location_on_outlined,
                      color: Colors.black,),
                    label: const Text(
                      "Change location",
                      style: TextStyle(
                        color: Colors.black
                      ),
                    ),
                    onPressed: (){
                      Navigator.pushNamed(context, '/location');
                    },
                   ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      data["location"],
                      style: const TextStyle(
                        fontSize: 36,
                        color: Colors.white54
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 40,),
                Text(
                  data["time"],
                  style: const TextStyle(
                    fontSize: 80,
                    color: Colors.white,
                  ),
                )
              ],
            ),
          ),
        ),
      )
    );
  }
}
