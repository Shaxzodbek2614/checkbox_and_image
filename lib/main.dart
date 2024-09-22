import 'package:flutter/material.dart';

void main() {
  runApp( MyApp());
}

class MyApp extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() =>_HomePageState();
}

class _HomePageState extends State<HomePage>{
  bool isSelected = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Center(child: Text("CheckBox"),),
      backgroundColor: Colors.blue,),
      body: Padding(padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          CheckboxListTile.adaptive(
              value: isSelected,
              onChanged: (value){
                setState(() {
                  isSelected = value?? false;
                });
              },
            title:const Text("CheckBox",style: TextStyle(
              fontFamily: 'TitilliumWeb-Italic',
              fontWeight: FontWeight.w900
            ),),
            subtitle: Text("checkbox"),
            controlAffinity: ListTileControlAffinity.platform,
            activeColor: Colors.red,
          ),
          const Padding(
            padding: const EdgeInsets.fromLTRB(0,8,0,0),
            child: Image(image: AssetImage("images/flutter.jpg")),
          ),
          Padding(
            padding:  const EdgeInsets.fromLTRB(0,8,0,0),
            child: Image.network(
              'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl-2.jpg',
              width: 300,
              loadingBuilder: (context, child, progress) {
                if (progress == null) {
                  return child; // Agar yuklash tugagan bo'lsa, rasmni ko'rsatadi.
                } else {
                  // Yuklanish foizini hisoblash
                  final loadingPercentage = progress.cumulativeBytesLoaded / (progress.expectedTotalBytes ?? 1);

                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      LinearProgressIndicator(value: loadingPercentage), // Progressni ko'rsatadi
                      SizedBox(height: 20),
                      Text('${(loadingPercentage * 100).toStringAsFixed(0)}%'), // Foizda yuklanish jarayonini ko'rsatadi
                    ],
                  );
                }
              },
            ),
          )
        ],
      ),
      ),
    );
  }
}
