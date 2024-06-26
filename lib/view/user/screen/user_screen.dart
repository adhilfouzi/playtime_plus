import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../view_model/users_list/users_list_bloc.dart';
import '../../utils/screen/responsive_layout.dart';
import 'extra_small_users.dart';
import 'large_users.dart';
import 'medium_users.dart';
import 'small_users.dart';

class UsersScreen extends StatelessWidget {
  const UsersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => UsersListBloc()..add(FetchTurfList()),
        child: const ResponsiveLayout(
          extraSmallBody: ExtraSmallUsersScreen(),
          smallBody: SmallUsersScreen(),
          mediumBody: MediumUsersScreen(),
          largeBody: LargeUsersScreen(),
        ),
      ),
    );
  }
}
