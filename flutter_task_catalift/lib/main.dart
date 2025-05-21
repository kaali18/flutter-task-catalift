import 'package:flutter/material.dart';
import 'constants/app_colors.dart';
import 'screens/mentors_screen.dart';

void main() {
  runApp(const CataliftApp());
}

class CataliftApp extends StatelessWidget {
  const CataliftApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Catalift',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: AppColors.primary,
        fontFamily: 'Poppins',
        scaffoldBackgroundColor: AppColors.background,
        useMaterial3: true,
      ),
      home: const MentorsScreen(),
    );
  }
}