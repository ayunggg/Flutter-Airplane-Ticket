import 'package:airplane/shared/theme.dart';
import 'package:airplane/ui/widgets/custom_button.dart';
import 'package:flutter/material.dart';

class SuccessBooked extends StatelessWidget {
  const SuccessBooked({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 300,
              height: 150,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                    'assets/images/image_scheduling.png',
                  ),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 80),
              child: Column(
                children: [
                  Text(
                    'Well Booked 😍',
                    style: semiBold.copyWith(
                      fontSize: 32,
                      color: blackColor,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Are you ready to explore the new\nworld of experiences?',
                    style: light.copyWith(
                      fontSize: 16,
                      color: greyColor,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
            CustomButton(
              title: 'My Bookings',
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
