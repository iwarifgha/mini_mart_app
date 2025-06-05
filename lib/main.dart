
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mini_mart_app/common/utils/color_utils.dart';
import 'package:mini_mart_app/features/home/view/home.dart';
import 'package:mini_mart_app/routes.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Mini mart',
      
      debugShowCheckedModeBanner: false,
      
      theme: ThemeData(
        fontFamily: GoogleFonts.ibmPlexSans().fontFamily,
        primaryColor: primaryColor),
      routerConfig: navigationRoutes,
    );
  }
}