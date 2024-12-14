import 'package:chat_ui_design/bloc/chat_screen_bloc.dart';
import 'package:chat_ui_design/view/chat_screen/chat_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


void main(){
  runApp(MultiBlocProvider(
    providers: [
      BlocProvider(
        create: (context) => ChatScreenBloc(),
      ),
     
    ],
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ChatScreen(),
    );
  }
}