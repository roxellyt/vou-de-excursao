import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:roxellytavaresp1/cubit/app_cubit_logics.dart';
import 'package:roxellytavaresp1/cubit/app_cubits.dart';
import 'package:roxellytavaresp1/pages/detail_page.dart';
import 'package:roxellytavaresp1/pages/home_page.dart';
import 'package:roxellytavaresp1/pages/navpages/main_page.dart';
import 'package:roxellytavaresp1/pages/welcome_page.dart';
import 'package:roxellytavaresp1/services/data_services.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      title: "Vou de Excursão",
      home: BlocProvider<AppCubits>(
        create: (context) => AppCubits(
          data: DataServices(),
        ),
        child: AppCubitLogics(),
      ),
    );
  }
}
