import 'package:airplane/cubit/auth_cubit.dart';
import 'package:airplane/shared/theme.dart';
import 'package:airplane/ui/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BonusPage extends StatelessWidget {
  const BonusPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget cardBonus() {
      return BlocBuilder<AuthCubit, AuthState>(
        builder: (context, state) {
          if (state is AuthSuccess) {
            return Container(
              width: 300,
              height: 211,
              padding: EdgeInsets.symmetric(
                vertical: 20,
                horizontal: 24,
              ),
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                    'assets/images/images_bg_wallet.png',
                  ),
                ),
                boxShadow: [
                  BoxShadow(
                    color: primaryColor.withOpacity(0.5),
                    blurRadius: 50,
                    offset: Offset(0, 10),
                  )
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Name',
                              style: light.copyWith(
                                color: whiteColor,
                              ),
                            ),
                            SizedBox(height: 2),
                            Text(
                              state.user.name,
                              style: medium.copyWith(
                                fontSize: 20,
                                color: whiteColor,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        width: 24,
                        height: 24,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage('assets/logo/logo_airplane.png'),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 6,
                      ),
                      Text(
                        'Pay',
                        style: medium.copyWith(
                          fontSize: 16,
                          color: whiteColor,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 41,
                  ),
                  Text(
                    'Balance',
                    style: light.copyWith(
                      color: whiteColor,
                    ),
                  ),
                  SizedBox(
                    height: 2,
                  ),
                  Text(
                    state.user.balance.toString(),
                    style: medium.copyWith(
                      fontSize: 20,
                      color: whiteColor,
                    ),
                  ),
                ],
              ),
            );
          } else {
            return SizedBox();
          }
        },
      );
    }

    Widget title() {
      return Container(
        margin: EdgeInsets.only(top: 80),
        child: Text(
          'Big Bonus 🎉',
          style: semiBold.copyWith(
            fontSize: 32,
            color: primaryColor,
          ),
        ),
      );
    }

    Widget subTitle() {
      return Container(
        margin: EdgeInsets.only(top: 10),
        child: Text(
          'We give you early credit so that\nyou can buy a flight ticket',
          style: light.copyWith(
            fontSize: 16,
            color: greyColor,
          ),
          textAlign: TextAlign.center,
        ),
      );
    }

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            cardBonus(),
            title(),
            subTitle(),
            CustomButton(
              title: 'Start Fly Now',
              width: 220,
              margin: EdgeInsets.only(top: 50),
              onPressed: () {
                Navigator.pushNamedAndRemoveUntil(
                    context, '/main', (route) => false);
              },
            ),
          ],
        ),
      ),
    );
  }
}
