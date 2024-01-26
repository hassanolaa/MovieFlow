import 'dart:convert';

import 'package:another_flutter_splash_screen/another_flutter_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';
import 'package:movieapp/Screens/mainScreen.dart';
import 'package:movieapp/Services/httpServices.dart';
import 'package:movieapp/Services/movieServices.dart';

import '../Models/AppConfig.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

 

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _setup(context);
  }

  Future<void> _setup(BuildContext _context) async {
    final getIt = GetIt.instance;

    final configFile = await rootBundle.loadString('assets/config/main.json');
    final configData = jsonDecode(configFile);

    getIt.registerSingleton<AppConfig>(
      AppConfig(
        BASE_API_URL: configData['BASE_API_URL'],
        BASE_IMAGE_API_URL: configData['BASE_IMAGE_API_URL'],
        API_KEY: configData['API_KEY'],
      ),
    );
   
   getIt.registerSingleton<httpServices>(httpServices());
   getIt.registerSingleton<movieServices>(movieServices());
    

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FlutterSplashScreen.fadeIn(
        duration: const Duration(milliseconds: 2515),
        backgroundColor: Color.fromRGBO(16, 24, 43, 1),
        childWidget: SizedBox(
          height: 320.h,
          width: 320.w,
          child: Image.asset("assets/images/logo2.png"),
        ),
        onAnimationEnd: () => debugPrint("On Fade In End"),
        nextScreen: ProviderScope(child: Main()),
      
    )
    );
  }
}
