import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:quiz_app/controller/controller.dart';
import 'package:quiz_app/screens/score_screen.dart';
import 'package:quiz_app/screens/home_screen.dart';
import 'package:quiz_app/screens/question_screen.dart';
import 'package:quiz_app/screens/splash_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  XController.localBox = await Hive.openBox("localBox");
  XController.history = (XController.localBox.get('users')) as List?;
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key}); // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData.dark(),
        //home: const QuestionScreen(),
        initialRoute: SplashScreen.id,
        routes: {
          HomeScreen.id: (context) => const HomeScreen(),
          QuestionScreen.id: (context) => const QuestionScreen(),
          SplashScreen.id: (context) => const SplashScreen(),
          ScoreScreen.id: (context) => const ScoreScreen(),
        });
  }
}
