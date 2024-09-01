import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:app/viewmodel/s_perf_viewmodel.dart';
import 'package:app/setup_locator.dart';
import 'package:app/views/class_selection.dart';

void main() {
  setupLocator();  
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => getIt<StudentViewModel>()),
        
      ],
      child: MaterialApp(
        title: 'Öğrenci Performans Takibi',
        theme: ThemeData(
          primarySwatch: Colors.deepPurple,
        ),
        home: FirstPage(),
      ),
    );
  }
}
