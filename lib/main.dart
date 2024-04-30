import 'package:admin_side_turf_application/view_model/turf_details/turf_details_bloc.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'model/backend/firebase_options.dart';
import 'view/owners/screen/owners_screen.dart';
import 'view_model/turflist/turflist_bloc.dart';

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
    return MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => TurflistBloc()),
          BlocProvider(create: (context) => TurfDetailsBloc()),
          // Add more Bloc providers if needed
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
          home: const OwnersScreen(),
        ));
  }
}
