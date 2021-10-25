import 'package:flutter/material.dart';
import 'package:hackaton_app/constants.dart';
import 'package:hackaton_app/main.dart';

void main() {
  runApp(const AuthList());
}

class AuthList extends StatefulWidget {
  const AuthList({Key? key}) : super(key: key);
  @override
  _AuthorizationPage createState() => _AuthorizationPage();
}

class _AuthorizationPage extends State<AuthList> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final controller1 = TextEditingController();
  final controller2 = TextEditingController();

  String? fontFam = "Montserrat";
  double? f_Size = 30.0;
  String? Log_passw;

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    controller1.dispose();
    controller2.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "So good",
        theme: ThemeData.dark(),
        home: Scaffold(
            appBar: AppBar(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(2),
              ),
              title: Text(
                "Авторизация",
                style: kMontserratStyleText,
              ),
            ),
            body: Container(
                child: Form(
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                  Expanded(
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                        TextFormField(
                          controller: controller1,
                          validator: (String? value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter some text';
                            }
                            return null;
                          },
                          autofocus: true,
                          decoration: InputDecoration(
                              contentPadding: EdgeInsets.all(0),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(18)),
                              labelText: "Login",
                              helperText:
                                  "Enter your phone number, bill or e-mail",
                              labelStyle: TextStyle(
                                  fontSize: f_Size,
                                  fontFamily: fontFam,
                                  decorationColor: Colors.white10)),
                        ),
                        SizedBox(
                          height: 35,
                        ),
                        TextFormField(
                          controller: controller2,
                          obscureText: true,
                          validator: (String? value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter some text';
                            } else if (value.length < 8) {
                              return "The password should contains at least 8 symbols";
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(18)),
                            labelText: "Password",
                            labelStyle: TextStyle(
                                fontSize: f_Size,
                                fontFamily: fontFam,
                                decorationColor: Colors.white10),
                          ),
                        ),
                        Container(
                          height: 50,
                        ),
                        FloatingActionButton.extended(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Control()));
                          },
                          label: Text(
                            "Sign in!",
                            style: kMontserratStyleText,
                          ),
                        )
                      ]))
                ])))));
  }
}
