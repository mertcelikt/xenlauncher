import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key }): super(key: key);

  @override
  State<LoginScreen> createState () => _LoginScreenState () ;

}

class _LoginScreenState  extends State <LoginScreen>  {
  @override
Widget build (BuildContext context) {
   final height= MediaQuery.of(context).size.height;
  return Scaffold(
    appBar: AppBar(),
     
    body:Center (
      child: Column(
        children: [
          Container (
            height: height * .25,
            decoration: BoxDecoration (
              image:DecorationImage(
                fit:BoxFit.cover,
                image:AssetImage("assets/image/resim.jpg"),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Hoşgeldiniz"),

              ],
            ),
          )
        ],

      ),

      ),
  );

  }
}

