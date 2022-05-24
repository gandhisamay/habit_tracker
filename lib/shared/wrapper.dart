import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:habit_app/constants/constants.dart';
import 'package:habit_app/providers/auth_provider.dart';
import 'package:habit_app/screens/dashboard/dashboard.dart';
import 'package:habit_app/screens/loading%20/loading_screen.dart';
import 'package:habit_app/screens/login/login.dart';
import 'package:habit_app/screens/onboarding/personal_details.dart';
import 'package:habit_app/shared/functions.dart';

class Wrapper extends ConsumerWidget {
  const Wrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final _auth = ref.watch(authStateProvider);
    return _auth.when(data: (data) {
      //If data is null user hasn't signed in yet even through using Google
      if (data == null) {
        return LoginScreen();
      } else {
        //Check if user doc exists or not
        final detailsMap = ref.watch(personalDetails);
        addDetails(detailsMap, uid, _auth.value!.uid);
        final doc = ref.watch(docProvider);

        return doc.when(data: (exists) {
          if (exists) {
            return DashboardScreen();
          } else {
            return PersonalDetailsScreen();
          }
        }, error: (_, st) {
          return Container();
        }, loading: () {
          print("loading");
          return Container();
        });
      }
    }, error: (_, st) {
      return Container();
    }, loading: () {
      print("Initial Loading");
      return LoadingScreen();
    });
  }
}
