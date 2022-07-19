// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:airplane/cubit/page_cubit.dart';
import 'package:airplane/shared/theme.dart';
import 'package:airplane/ui/pages/home_page.dart';
import 'package:airplane/ui/pages/setting_page.dart';
import 'package:airplane/ui/pages/transaction_page.dart';
import 'package:airplane/ui/pages/wallet_page.dart';
import 'package:airplane/ui/widgets/custom_bottom_navbar_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainPage extends StatelessWidget {
  const MainPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget buildContent(int currentIndex) {
      switch (currentIndex) {
        case 0:
          return HomePage();
        case 1:
          return TransactionPage();
        case 2:
          return WalletPage();
        case 3:
          return SettingPage();
        default:
          return HomePage();
      }
    }

    Widget customBottomNavBar() {
      return Align(
        alignment: Alignment.bottomCenter,
        child: Container(
          width: double.infinity,
          height: 60,
          margin: EdgeInsets.only(
            bottom: 30,
            left: 24,
            right: 24,
          ),
          decoration: BoxDecoration(
            color: whiteColor,
            borderRadius: BorderRadius.circular(18),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              CustomBottomNavbarItem(
                imageUrl: 'assets/icons/icon_home_normal.png',
                index: 0,
              ),
              CustomBottomNavbarItem(
                imageUrl: 'assets/icons/icon_book_normal.png',
                index: 1,
              ),
              CustomBottomNavbarItem(
                imageUrl: 'assets/icons/icon_wallet_normal.png',
                index: 2,
              ),
              CustomBottomNavbarItem(
                imageUrl: 'assets/icons/icon_setting_normal.png',
                index: 3,
              )
            ],
          ),
        ),
      );
    }

    return BlocBuilder<PageCubit, int>(
      builder: ((context, currentIndex) {
        return Scaffold(
          backgroundColor: backgroundColor,
          body: SafeArea(
            child: Stack(
              children: [
                buildContent(currentIndex),
                customBottomNavBar(),
              ],
            ),
          ),
        );
      }),
    );
  }
}
