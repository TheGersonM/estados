import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getxpractice/contollers/title_controller.dart';
import 'package:getxpractice/contollers/buscador_controller.dart';



void main() => runApp( MyApp());

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final controller = Get.put(BuscadorController());
  final controller1 = Get.put(TitleController());

   Title title = Title(color: Colors.white, child: Text('Search Bar'));

   Icon icon = Icon(Icons.search);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Search Bar',
      home: Scaffold(
        appBar: AppBar(
          title:  title,
          actions: [
            IconButton(
              
              icon: Obx(
                () => Icon(controller.buscadorvalue == '' ? Icons.cancel : Icons.search),
              ),

              
            onPressed: () => 
            {
              controller.buscadorvalue == '' ? controller.buscadorvalue = '0' : controller.buscadorvalue = '',


              if(icon.icon == Icons.search)
              {
                setState(() {
                  icon = Icon(Icons.cancel);



                  title = Title(
                    color: Colors.white,
                    child: TextField(
                      onChanged: (text) {
                        controller.buscadorvalue = text;
                        
                      },
                      textInputAction: TextInputAction.search,
                      onSubmitted: (value) {
                        setState(() {
                          controller.buscadorvalue = value;
                        });
                      },
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                      ),
                    ),
                  );
                }),
              } else {
                setState(() {
                  icon = Icon(Icons.search);
                  title = Title(color: Colors.white, child: Text('Search Bar'));
                }),
              }
              
            },)
          ],
        ),
        body:  Center(
          child: Obx(() => Text(controller.buscadorvalue)),
        ),
      ),
      );
    
  }
}