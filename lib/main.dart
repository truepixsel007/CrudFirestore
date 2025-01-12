import 'package:firebase_core/firebase_core.dart';
import 'package:firestrore_crud/pages/home_page.dart';
import 'package:flutter/material.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});
  final Future<FirebaseApp> _initialization = Firebase.initializeApp(
    // Replace with actual values
    options: FirebaseOptions(
      apiKey: "AIzaSyBPtRg9ZeTtmbaSozhSZmVCnZrc3fUI1W4",
      appId: "1:1079044353505:android:b3a0225daa5f810debf6a0",
      messagingSenderId: "1079044353505",
      projectId: "fir-crud-geeky-shows",
    ),
  );
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: _initialization,
        builder: (context ,snapshot){
          // check for errors
          if(snapshot.hasError){
            print("something went wrong");
          }
          // once complete, show your applicatin
          if(snapshot.connectionState == ConnectionState.done){
            return MaterialApp(
              title: 'Flutter Firestore CRUD',
              theme: ThemeData(
                colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
                useMaterial3: true,
              ),
              debugShowCheckedModeBanner: false,
              home: const HomePage(),
            );
          }

          return CircularProgressIndicator();
        }
    );
  }
}


