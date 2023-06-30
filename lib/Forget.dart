import 'package:flutter/material.dart';
import 'package:splashscreen/Reset.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const ForgetPage(),
    );
  }
}

class ForgetPage extends StatefulWidget {
  const ForgetPage({Key? key}) : super(key: key);
  @override
  State<ForgetPage> createState() => ForgetPage1();
}

class ForgetPage1 extends State<ForgetPage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  String errorMessage = '';
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(title:Text("Forget Password")),
      body: Padding(
          padding: const EdgeInsets.all(10),
          child: ListView(

              children: <Widget>[
                Text ('Email'),
                Container(
                  padding: const EdgeInsets.all(10),
                  child: TextField(
                    controller: nameController,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),


                Container(
                    height: 50,
                    padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                    child: ElevatedButton(
                      child: const Text('Done'),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const ResetPage()),
                        );
                        print(nameController.text);
                        print(passwordController.text);
                      },
                    )
                ),
              ]
          )
      ),
    );
  }

}
