import 'package:flutter/material.dart';
import 'package:splashscreen/show_data.dart';
import 'package:intl/intl.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    const appTitle = 'Form Validation Demo';

    return MaterialApp(
      title: appTitle,
      home: Scaffold(
        appBar: AppBar(
          title: const Text(appTitle),
        ),
        body: const MyCustomForm(),
      ),
    );
  }
}

// Create a Form widget.
class MyCustomForm extends StatefulWidget {
  const MyCustomForm({super.key});

  @override
  MyCustomFormState createState() {
    return MyCustomFormState();
  }
}

// Create a corresponding State class.
// This class holds data related to the form.
class MyCustomFormState extends State<MyCustomForm> {
  final formKey = GlobalKey<FormState>();
  TextEditingController userInput = TextEditingController();
  TextEditingController usersecondname = TextEditingController();
  TextEditingController cnic = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController dob = TextEditingController();
  TextEditingController education = TextEditingController();
  void initState() {
    dob.text = ""; //set the initial value of text field
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    // Build a Form widget using the _formKey created above.
    return Scaffold(
      body: Padding(

        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Form(
        key: formKey,
        child: Column (
        children: [
          TextFormField(
            controller: userInput,
            style: TextStyle(
              fontSize: 24,
              color: Colors.blue,
              fontWeight: FontWeight.w600,),

            decoration: const InputDecoration(
             // border: OutlineInputBorder(
               // borderRadius: BorderRadius.circular(12),
               // ),
              labelText: 'First Name ',
              //border: OutlineInputBorder(borderRadius: BorderRadius. circular(10,0));
            ),
            // The validator receives the text that the user has entered.
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter some text';
              }
              return null;
            },

          ),
          TextFormField(
            controller: usersecondname,
            style: TextStyle(
              fontSize: 24,
              color: Colors.blue,
              fontWeight: FontWeight.w600,),
            decoration: const InputDecoration(
              icon: Icon(Icons.person),
              //hintText: 'What do people call you?',
              labelText: 'Second Name ',
            ),
            // The validator receives the text that the user has entered.
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter some text';
              }
              return null;
            },

          ),
          TextFormField(
            controller: cnic,
            style: TextStyle(
              fontSize: 24,
              color: Colors.blue,
              fontWeight: FontWeight.w600,),
            decoration: const InputDecoration(
              icon: Icon(Icons.person),
              //hintText: 'What do people call you?',
              labelText: 'CNIC ',
            ),
            // The validator receives the text that the user has entered.
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter some text';
              }
              return null;
            },

          ),
          TextFormField(
            controller: dob,
            style: TextStyle(
              fontSize: 24,
              color: Colors.blue,
              fontWeight: FontWeight.w600,),
            decoration: const InputDecoration(
              icon: Icon(Icons.person),
              //hintText: 'What do people call you?',
              labelText: 'DOB ',
            ),

            readOnly: true,
            onTap: () async {
              DateTime? pickedDate = await showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime(1950),
                  //DateTime.now() - not to allow to choose before today.
                  lastDate: DateTime(2100));

              if (pickedDate != null) {
                print(
                    pickedDate); //pickedDate output format => 2021-03-10 00:00:00.000
                String formattedDate =
                DateFormat('yyyy-MM-dd').format(pickedDate);
                print(
                    formattedDate); //formatted date output using intl package =>  2021-03-16
                setState(() {
                  dob.text =
                      formattedDate; //set output date to TextField value.
                });
              } else {}
            },
            // The validator receives the text that the user has entered.
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter some text';
              }
              return null;
            },

          ),
          TextFormField(
            controller: phone,
            style: TextStyle(
              fontSize: 24,
              color: Colors.blue,
              fontWeight: FontWeight.w600,),
            decoration: const InputDecoration(
              icon: Icon(Icons.person),
              //hintText: 'What do people call you?',
              labelText: 'phone ',
            ),
            // The validator receives the text that the user has entered.
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter some text';
              }
              return null;
            },

          ),
          TextFormField(
            controller: education,
            style: TextStyle(
              fontSize: 24,
              color: Colors.blue,
              fontWeight: FontWeight.w600,),
            decoration: const InputDecoration(
              icon: Icon(Icons.person),
              //hintText: 'What do people call you?',
              labelText: 'Educaton ',
            ),
            // The validator receives the text that the user has entered.
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter some text';
              }
              return null;
            },

          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: ElevatedButton(
              onPressed: () {
                // Validate returns true if the form is valid, or false otherwise.
                if (formKey.currentState!.validate()) {
                  // If the form is valid, display a snackbar. In the real world,
                  // you'd often call a server or save the information in a database.
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Processing Data')),
                  );

                  Navigator.push(context,
                    MaterialPageRoute(
                      builder: (context) => new Screen2(name:userInput.text, secondname:usersecondname.text, cnic:cnic.text,phone:phone.text,
                          dob:dob.text,education:education.text,),
                    ),
                  );

                }
              },
              child: const Text('Submit'),
            ),
          ),
        ],),
      ),),
    );
  }
}

