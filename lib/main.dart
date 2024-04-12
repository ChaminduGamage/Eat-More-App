import 'package:eat_more/admin/add_food.dart';
import 'package:eat_more/admin/admin_login.dart';
import 'package:eat_more/admin/home_admin.dart';
import 'package:eat_more/firebase_options.dart';
import 'package:eat_more/pages/onboard.dart';

import 'package:eat_more/pages/wallet.dart';
import 'package:eat_more/widget/app_concsent.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_stripe/flutter_stripe.dart';

void main() async {
  runApp(const MyApp());
  WidgetsFlutterBinding.ensureInitialized();
  Stripe.publishableKey = publishableKey;
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Eat More App',
      theme: ThemeData(),
      home: Onboard(),
    );
  }
}
