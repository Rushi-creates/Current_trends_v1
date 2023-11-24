import '../SCREENS/splash_screen.dart';
import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../CONSTANTS/init_process.dart';
import '../CONSTANTS/bloc_providers.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await InitialProcess.getProcess();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    // SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    //   statusBarColor: Color.fromARGB(255, 0, 70, 75),
    // ));
    return MultiBlocProvider(
      providers: MyBlocProviders.getProviders(context),
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        // theme: ThemeData(primaryColor: Colors.teal),

        home: SplashScreen(),
      ),
    );
  }
}
