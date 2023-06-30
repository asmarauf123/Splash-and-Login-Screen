import 'dart:async';
import 'package:flutter/material.dart';
import 'package:splashscreen/Forget.dart';
import 'package:splashscreen/homeScreen1.dart';
import 'package:splashscreen/homescreen.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'Reset.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Splash Screen',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: MyHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  MyHomePageState createState() => MyHomePageState();
}
class MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    super.initState();

    Timer(Duration(seconds: 3),
            ()=>Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => SecondScreen()
            )
        )
    );
  }
  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.white,
        child:FlutterLogo(size:MediaQuery.of(context).size.height)
    );
  }
}
class SecondScreen extends StatefulWidget {
  @override
  State<SecondScreen> createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  TextEditingController nameController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title:Text("App Bar")),
      body: Padding(
          padding: const EdgeInsets.all(10),
          child: ListView(

              children: <Widget>[
                Text ('Email'),

                Container(
                  padding: const EdgeInsets.all(10),

                  child: TextFormField(
                    controller: nameController,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),),
                  ),
                ),
                Text ('Password'),
                Container(
                  padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                  child: TextField(
                    obscureText: true,
                    controller: passwordController,
                    decoration: const InputDecoration(

                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 50,
                ),

                Container(
                    height: 50,
                    padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                    child: ElevatedButton(
                      child: const Text('Login'),
                      onPressed: () {
                        if(nameController.text.length<=6){
                          Fluttertoast.showToast(
                              msg: "there should be name with at least 6 digits",
                              toastLength: Toast.LENGTH_SHORT,
                              gravity: ToastGravity.BOTTOM,
                              backgroundColor: Colors.red,
                              textColor: Colors.white,
                              fontSize: 12.0
                          );
                          print('there should be name with at least 6 digits');
                        }else{
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => const MyCustomForm()),
                          );
                        }

                        //print(nameController.text);
                        //print(passwordController.text);
                      },
                    )
                ),

                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const ForgetPage()),
                    );
                    //forgot password screen
                  },
                  child: const Text('Forgot Password ?',),
                ),


              ]
          )
      ),

    );
  }
}