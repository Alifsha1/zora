// ignore_for_file: prefer_const_constructors

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';
import 'package:zora/presentaion/bloc/forget_password/forget_password_bloc.dart';
import 'package:zora/presentaion/bloc/sign_up_bloc/sign_up_bloc_bloc.dart';
import 'package:zora/presentaion/bloc/user_login/user_login_bloc.dart';
import 'package:zora/presentaion/bloc/user_profile/user_profile_bloc.dart';
import 'package:zora/presentaion/cubit/theme/theme_cubit.dart';
import 'package:zora/presentaion/cubit/toggle_password/toggle_password.dart';
import 'package:zora/presentaion/pages/splash_screen/splash_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  HydratedBloc.storage = await HydratedStorage.build(
    storageDirectory: kIsWeb
        ? HydratedStorage.webStorageDirectory
        : await getApplicationDocumentsDirectory(),
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => SignUpBlocBloc()),
          BlocProvider(create: (context) => UserLoginBloc()),
          BlocProvider(create: (context) => ThemeCubit()),
          BlocProvider(create: (context) => TogglePasswordCubit()),
          BlocProvider(create: (context) => UserProfileBloc()),
          BlocProvider(create: (context)=> ForgetPasswordBloc()),
        ],
        child: BlocBuilder<ThemeCubit, ThemeMode>(
          builder: (context, ThemeMode mode) {
            return MaterialApp(
              theme: ThemeData(
                fontFamily: 'Quick_sand',
                scaffoldBackgroundColor: Color.fromARGB(255, 228, 246, 246),
              ),
              debugShowCheckedModeBanner: false,
              home: const SplashScreen(),
            );
          },
        ));
  }
}
