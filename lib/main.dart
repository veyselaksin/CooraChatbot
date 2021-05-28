import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chatbot_coora/screens/onBoard.dart';
import 'package:flutter_chatbot_coora/screens/signIn.dart';
import 'package:flutter_chatbot_coora/services/firebase/authentication_service.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_chatbot_coora/custom_extensions.dart';

int initScreen;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences preferences=await SharedPreferences.getInstance();
  initScreen=await preferences.getInt('initScreen');
  await preferences.setInt('initScreen', 1);
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          Provider(create: (_)=>AuthenticationService(FirebaseAuth.instance)),
          StreamProvider(create: (context)=>context.read<AuthenticationService>().authStateChanges),

        ],
        child: MaterialApp(
          theme: ThemeData(fontFamily: 'Ubuntu'),
          debugShowCheckedModeBanner: false,
          home:MyHomePage(),
        ));
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    // TODO: implement initState
    Timer(Duration(seconds: 3), openOnBoard);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(100),
          child: Container(
            height: context.dynamicHeight(1),
            width: context.dynamicWidth(1),
            decoration: BoxDecoration(
                image: DecorationImage(
              image: AssetImage("assets/images/logo.png"),
            )),
          ),
        ),
      ),
    );
  }



  void openOnBoard() {
    Navigator.push(context, MaterialPageRoute(builder: (context)=>(initScreen==0 ||initScreen==null)?OnBoarding():SignIn()));
  }
}
