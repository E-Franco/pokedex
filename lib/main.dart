import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'common/core/contants/colors.dart';
import 'features/presentation/pages/home/home_controller.dart';
import 'features/presentation/pages/home/home_page.dart';
import 'service_locator.dart';

void main() {
  setUp();
  runApp(const AppRoot());
}

class AppRoot extends StatelessWidget {
  const AppRoot({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: Theme.of(context).copyWith(
        primaryColor: AppColors.primary,
        textTheme: GoogleFonts.poppinsTextTheme(),
      ),
      home: HomePage(controller: serviceLocator.get<HomeController>()),
    );
  }
}
