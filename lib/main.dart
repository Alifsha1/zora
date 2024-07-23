// ignore_for_file: prefer_const_constructors

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';
import 'package:zora/presentaion/bloc/comment/comment_bloc.dart';
import 'package:zora/presentaion/bloc/create_post/create_post_bloc.dart';
import 'package:zora/presentaion/bloc/delete_post/delete_post_bloc.dart';
import 'package:zora/presentaion/bloc/edit_profile/edit_profile_bloc.dart';
import 'package:zora/presentaion/bloc/folllow_unfollow.dart/follow_unfollow_user_bloc.dart';
import 'package:zora/presentaion/bloc/forget_password/forget_password_bloc.dart';
import 'package:zora/presentaion/bloc/get_all_post/get_all_post_bloc.dart';
import 'package:zora/presentaion/bloc/image_picker/image_picker_bloc.dart';
import 'package:zora/presentaion/bloc/like_post/like_post_bloc.dart';
import 'package:zora/presentaion/bloc/post_/post_bloc.dart';
import 'package:zora/presentaion/bloc/profile_fetch_by_id.dart/profile_fetch_by_id_bloc.dart';
import 'package:zora/presentaion/bloc/profile_of_users_bloc/profile_bloc.dart';
import 'package:zora/presentaion/bloc/save_Unsave_post/save_un_save_post_bloc.dart';
import 'package:zora/presentaion/bloc/saved_posts/saved_posts_bloc.dart';
import 'package:zora/presentaion/bloc/selected_images/selected_images_bloc.dart';
import 'package:zora/presentaion/bloc/sign_up_bloc/sign_up_bloc_bloc.dart';
import 'package:zora/presentaion/bloc/user_login/user_login_bloc.dart';
import 'package:zora/presentaion/bloc/user_profile/user_profile_bloc.dart';
import 'package:zora/presentaion/cubit/theme/theme_cubit.dart';
import 'package:zora/presentaion/cubit/toggle_password/toggle_password.dart';
import 'package:zora/presentaion/pages/home_screen/loading/postcontainer_loading.dart';
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
          BlocProvider(create: (context) => ForgetPasswordBloc()),
          BlocProvider(create: (context) => EditProfileBloc()),
          BlocProvider(create: (context) => ImagePickerBloc()),
          BlocProvider(create: (context) => CreatePostBloc()),
          BlocProvider(create: (context) => SelectedImagesBloc()),
          BlocProvider(create: (context) => DeletePostBloc()),
          BlocProvider(create: (context) => PostBloc()),
          BlocProvider(create: (context) => GetAllPostBloc()),
          BlocProvider(create: (context) => LikePostBloc()),
          BlocProvider(create: (context) => CommentBloc()),
          BlocProvider(create: (context) => ProfileFetchByIdBloc()),
          BlocProvider(create: (context) => FollowUnfollowUserBloc()),
          BlocProvider(create: (context) => ProfileBloc()),
          BlocProvider(create: (context) => SaveUnSavePostBloc()),
          BlocProvider(create: (context)=>SavedPostsBloc()),
        ],
        child: BlocBuilder<ThemeCubit, ThemeMode>(
          builder: (context, ThemeMode mode) {
            return MaterialApp(
              theme: ThemeData(
                fontFamily: 'Quick_sand',
                scaffoldBackgroundColor: Color.fromARGB(255, 228, 246, 246),
              ),
              debugShowCheckedModeBanner: false,
              home: SplashScreen(),
            // home: PostcontainerLoading(),
            );
          },
        ));
  }
}
