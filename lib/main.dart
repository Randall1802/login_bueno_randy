import 'package:flutter/material.dart';
import 'package:login_bueno_randy/screens/checking_screen.dart';
import 'package:login_bueno_randy/screens/login_screen.dart';
import 'package:login_bueno_randy/screens/principal_screen.dart';
import 'package:login_bueno_randy/screens/registro_screen.dart';
import 'package:login_bueno_randy/services/auth_services.dart';
import 'package:login_bueno_randy/services/notifications_services.dart';
import 'package:provider/provider.dart';

void main(){
  runApp(AppState());
}

class AppState extends StatelessWidget {
  const AppState({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers:[
        ChangeNotifierProvider(create: (context) => AuthServices())
      ],
      child: MyApp(),
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Login demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Color.fromARGB(255, 2247, 230, 196)),
        useMaterial3: true
      ),
      initialRoute: 'checking',
      routes: {
        'login' : (_) => LoginScreen(),
        'register': (_) => RegistroScreen(),
        'home': (_) => PrincipalScreen(),
        'checking': (_) => CheckAuthScreen()
      },
      scaffoldMessengerKey: NotificationsServices.messengerKey
    );
  }
}