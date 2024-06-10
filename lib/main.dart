import 'package:admin_side_turf_application/view/login/screen/login_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'model/backend/firebase_options.dart';
import 'view/homescreen/screen/homescreen.dart';
import 'view_model/Image_controller/image_controller_bloc.dart';
import 'view_model/overview_bloc/overview_bloc.dart';
import 'view_model/request_turflist/request_turflist_bloc.dart';
import 'view_model/turf_details/turf_details_bloc.dart';
import 'view_model/turflist/turflist_bloc.dart';
import 'view_model/users_list/users_list_bloc.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize Firebase
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    User? user = FirebaseAuth.instance.currentUser;

    return MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => TurflistBloc()),
          BlocProvider(create: (context) => OverviewBloc()),
          BlocProvider(create: (context) => TurfDetailsBloc()),
          BlocProvider(create: (context) => RequestTurflistBloc()),
          BlocProvider(create: (context) => UsersListBloc()),
          BlocProvider(create: (context) => ImageBloc()),
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Turf Booking Application For Admin',
          theme: ThemeData(
            colorScheme: const ColorScheme.dark(
                primary: Color.fromARGB(255, 146, 68, 68)),
            useMaterial3: true,
            fontFamily: 'Poppins',
          ),
          home: user != null ? const HomeScreen() : const LoginScreen(),
        ));
  }
}
