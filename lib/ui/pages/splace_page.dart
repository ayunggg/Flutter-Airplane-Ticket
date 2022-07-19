// ignore_for_file: prefer_const_constructors

import 'dart:async';

import 'package:airplane/cubit/auth_cubit.dart';
import 'package:airplane/shared/theme.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    Timer(Duration(seconds: 3), () {
      User? user = FirebaseAuth.instance.currentUser;

      if (user != null) {
        context.read<AuthCubit>().getUser(user.uid);
        Navigator.pushNamedAndRemoveUntil(context, '/main', (route) => false);
      } else {
        Navigator.pushNamedAndRemoveUntil(
            context, '/get-started', (route) => false);
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 100,
              height: 100,
              margin: EdgeInsets.only(
                bottom: 50,
              ),
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(
                      'assets/logo/logo_airplane.png',
                    ),
                    fit: BoxFit.cover),
              ),
            ),
            Text(
              'Airplane',
              style: medium.copyWith(
                fontSize: 32,
                color: whiteColor,
                letterSpacing: 10,
              ),
            )
          ],
        ),
      ),
    );
  }
}
