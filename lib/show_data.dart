
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Screen2 extends StatefulWidget{
  Screen2({required this.name, required this.secondname, required this.cnic,required this.phone,required this.dob,required this.education,});
  final String name;
  final String secondname;
  final String cnic;
  final String phone;
  final String dob;
  final String education;

  // etc
  @override
  State<StatefulWidget> createState() { return new Screen2State();}
}

class Screen2State extends State<Screen2> {
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Column(
        children: [
          new Text('Your First Name: ${widget.name}',style: TextStyle(fontSize: 28),),
          new Text(' Your Second Name:${widget.secondname}',style: TextStyle(fontSize: 28),),
           new Text('Your CNIC: ${widget.cnic}',style: TextStyle(fontSize: 28),),
          new Text('Your Phone Number: ${widget.phone}',style: TextStyle(fontSize: 28),),
          new Text('Your DOB: ${widget.dob}',style: TextStyle(fontSize: 28),),
          new Text('Your Education: ${widget.education}',style: TextStyle(fontSize: 28),),
        ],
      ),
    );
  }
}