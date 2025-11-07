import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:trackizer/view/login/welcome_view.dart';
import 'package:trackizer/view/main_tab/main_tab_view.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  // Ẩn thanh status bar và navigation bar
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.leanBack);

  runApp(const TrackizerApp());
}

class TrackizerApp extends StatelessWidget {
  const TrackizerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Trackizer',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.deepPurple,
          brightness: Brightness.light,
        ),
      ),
      home: const MainTabView(),
    );
  }
}
