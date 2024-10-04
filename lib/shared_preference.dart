import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyShared extends StatefulWidget {
  const MyShared({Key? key}) : super(key: key);
  @override
  _MySharedState createState() {
    return _MySharedState();
  }
}

class _MySharedState extends State<MyShared> {
  late SharedPreferences prefs;
  final TextEditingController _iniController = TextEditingController();
  String name = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Shared Preferences"),
      ),
      body: Container(
          margin: const EdgeInsets.symmetric(
            vertical: 12,
            horizontal: 16,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextField(
                controller: _iniController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                ),
              ),
              ElevatedButton(
                child: const Text("Save"),
                onPressed: () {
                  save();
                },
              ),
              const SizedBox(
                height: 20,
              ),
              TextField(
                readOnly: true,
                decoration: InputDecoration(
                  border: const OutlineInputBorder(),
                  hintText: name,
                ),
              ),
              // Text(
              //   name,
              //   style: TextStyle(fontSize: 20),
              // ),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                child: const Text("Get Value"),
                onPressed: () {
                  retrieve();
                },
              ),
              ElevatedButton(
                child: const Text("Delete Value"),
                onPressed: () {
                  delete();
                },
              )
            ],
          )),
    );
  }

  save() async {
    prefs = await SharedPreferences.getInstance();
    prefs.setString("initext", _iniController.text.toString());
    _iniController.text = "";
  }

  retrieve() async {
    prefs = await SharedPreferences.getInstance();
    name = prefs.getString("initext").toString();
    setState(() {});
  }

  delete() async {
    prefs = await SharedPreferences.getInstance();
    prefs.remove("initext");
    name = "";
    setState(() {});
  }
}
