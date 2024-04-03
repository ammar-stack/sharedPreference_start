import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp( MyApp());
}

class MyApp extends StatefulWidget {
   MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var nameController = TextEditingController();
  var statusStored = "No value saved";
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getValue();
  }
  @override
  Widget build(BuildContext context) {
    
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Color.fromARGB(255, 247, 241, 223),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
               Padding(
                padding:const EdgeInsets.symmetric(horizontal: 30),
                child: TextField(
                  controller: nameController,
                  decoration:const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Enter Your Name',
                    labelText: 'Name',
                  ),
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.amber,
                      foregroundColor: Colors.black,
                      elevation: 10,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(40))),
                  onPressed: () async{
                    var name = nameController.text.toString();
                    var prefs =await SharedPreferences.getInstance();
                    prefs.setString("name", name);
                    setState(() {
                      
                    });
                  },
                  child: const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                    child: Text(
                      'Save Name',
                      style:
                          TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                    ),
                  )),
               Padding(
                padding:const EdgeInsets.symmetric(vertical: 30),
                child: Text(statusStored,style:const TextStyle(fontSize: 30),),
              )
            ],
          ),
        ),
      ),
    );
  }
  void getValue() async{
    var prefss =await SharedPreferences.getInstance();
    var getName = prefss.getString("name");
    statusStored = getName!=null ? "$getName":"No Value Saved";
    setState(() {
      
    });
  }
}
