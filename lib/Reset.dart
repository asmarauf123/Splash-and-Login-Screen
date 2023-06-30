import 'package:flutter/material.dart';

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
      home: const ResetPage(),
    );
  }
}

class ResetPage extends StatefulWidget {
  const ResetPage({Key? key}) : super(key: key);
  @override
  State<ResetPage> createState() => ResetPage1();
}

class ResetPage1 extends State<ResetPage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(title:Text(" Reset Password")),
      body: Padding(
          padding: const EdgeInsets.all(10),
          child: ListView(

              children: <Widget>[
                Text ('Password'),

                Container(
                  padding: const EdgeInsets.all(10),

                  child: TextField(
                    controller: nameController,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),

                    ),
                  ),
                ),
                Text (' Confirm Password'),

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
                      child: const Text('Match'),
                      onPressed: () {

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
