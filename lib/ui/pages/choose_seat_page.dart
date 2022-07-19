import 'package:airplane/shared/theme.dart';
import 'package:airplane/ui/pages/checkout_detail_page.dart';
import 'package:airplane/ui/widgets/custom_button.dart';
import 'package:airplane/ui/widgets/custom_seat_item.dart';
import 'package:flutter/material.dart';

class ChooseSeatPage extends StatelessWidget {
  const ChooseSeatPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget title() {
      return Container(
        margin: EdgeInsets.only(top: 30, left: 24),
        child: Text(
          'Select Your\nFavorite Seat',
          style: semiBold.copyWith(
            fontSize: 24,
            color: blackColor,
          ),
        ),
      );
    }

    Widget statusSeat() {
      return Container(
        margin: EdgeInsets.only(
          top: 30,
          left: 24,
        ),
        child: Row(
          children: [
            //NOTE : FIRST STATUS
            Container(
              margin: EdgeInsets.only(right: 10),
              child: Row(
                children: [
                  Container(
                    width: 16,
                    height: 16,
                    margin: EdgeInsets.only(right: 4),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(6),
                      color: availableColor,
                      border: Border.all(
                        color: primaryColor,
                      ),
                    ),
                  ),
                  Text(
                    'Available',
                    style: regular.copyWith(
                      color: blackColor,
                    ),
                  )
                ],
              ),
            ),
            //NOTE : SECOND STATUS
            Container(
              margin: EdgeInsets.only(right: 10),
              child: Row(
                children: [
                  Container(
                    width: 16,
                    height: 16,
                    margin: EdgeInsets.only(right: 4),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(6),
                      color: selectedColor,
                    ),
                  ),
                  Text(
                    'Selected',
                    style: regular.copyWith(
                      color: blackColor,
                    ),
                  )
                ],
              ),
            ),
            //NOTE : THIRD STATUS
            Row(
              children: [
                Container(
                  width: 16,
                  height: 16,
                  margin: EdgeInsets.only(right: 4),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(6),
                    color: unAvailableColor,
                  ),
                ),
                Text(
                  'Unavailable',
                  style: regular.copyWith(
                    color: blackColor,
                  ),
                )
              ],
            ),
          ],
        ),
      );
    }

    Widget cardSeat() {
      return Container(
        width: double.infinity,
        margin: EdgeInsets.symmetric(horizontal: 24, vertical: 30),
        padding: EdgeInsets.only(left: 22, right: 22, top: 18, bottom: 30),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(18),
          color: whiteColor,
        ),
        child: Column(
          children: [
            //NOtE : INDICATOR SEAT
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: 48,
                  height: 48,
                  child: Center(
                    child: Text(
                      'A',
                      style: regular.copyWith(
                        fontSize: 16,
                        color: greyColor,
                      ),
                    ),
                  ),
                ),
                Container(
                  width: 48,
                  height: 48,
                  child: Center(
                    child: Text(
                      'B',
                      style: regular.copyWith(
                        fontSize: 16,
                        color: greyColor,
                      ),
                    ),
                  ),
                ),
                Container(
                  width: 48,
                  height: 48,
                  child: Center(
                    child: Text(
                      ' ',
                      style: regular.copyWith(
                        fontSize: 16,
                        color: greyColor,
                      ),
                    ),
                  ),
                ),
                Container(
                  width: 48,
                  height: 48,
                  child: Center(
                    child: Text(
                      'C',
                      style: regular.copyWith(
                        fontSize: 16,
                        color: greyColor,
                      ),
                    ),
                  ),
                ),
                Container(
                  width: 48,
                  height: 48,
                  child: Center(
                    child: Text(
                      'D',
                      style: regular.copyWith(
                        fontSize: 16,
                        color: greyColor,
                      ),
                    ),
                  ),
                )
              ],
            ),
            //NOTE : FIRST SEAT
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SeatItem(
                  id: 'A1',
                ),
                SeatItem(
                  id: 'B1',
                ),
                Container(
                  width: 48,
                  height: 48,
                  child: Center(
                    child: Text(
                      '1',
                      style: regular.copyWith(
                        fontSize: 16,
                        color: greyColor,
                      ),
                    ),
                  ),
                ),
                SeatItem(
                  id: 'C1',
                ),
                SeatItem(
                  id: 'D1',
                ),
              ],
            ),
            SizedBox(
              height: 16,
            ),
            //NOTE : SECOND SEAT
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SeatItem(
                  id: 'A2',
                ),
                SeatItem(
                  id: 'B2',
                ),
                Container(
                  width: 48,
                  height: 48,
                  child: Center(
                    child: Text(
                      '2',
                      style: regular.copyWith(
                        fontSize: 16,
                        color: greyColor,
                      ),
                    ),
                  ),
                ),
                SeatItem(
                  id: 'C2',
                ),
                SeatItem(
                  id: 'D2',
                ),
              ],
            ),
            SizedBox(
              height: 16,
            ),
            //NOTE : THIRD SEAT
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SeatItem(
                  id: 'A3',
                ),
                SeatItem(
                  id: 'B3',
                ),
                Container(
                  width: 48,
                  height: 48,
                  child: Center(
                    child: Text(
                      '3',
                      style: regular.copyWith(
                        fontSize: 16,
                        color: greyColor,
                      ),
                    ),
                  ),
                ),
                SeatItem(
                  id: 'C3',
                ),
                SeatItem(
                  id: 'D3',
                ),
              ],
            ),
            SizedBox(
              height: 16,
            ),
            //NOTE : FOURTH SEAT
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SeatItem(
                  id: 'A4',
                ),
                SeatItem(
                  id: 'B4',
                ),
                Container(
                  width: 48,
                  height: 48,
                  child: Center(
                    child: Text(
                      '4',
                      style: regular.copyWith(
                        fontSize: 16,
                        color: greyColor,
                      ),
                    ),
                  ),
                ),
                SeatItem(
                  id: 'C4',
                ),
                SeatItem(
                  id: 'D4',
                ),
              ],
            ),
            SizedBox(
              height: 16,
            ),
            //NOTE : FIFTH SEAT
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SeatItem(
                  id: 'A5',
                ),
                SeatItem(
                  id: 'B5',
                ),
                Container(
                  width: 48,
                  height: 48,
                  child: Center(
                    child: Text(
                      '5',
                      style: regular.copyWith(
                        fontSize: 16,
                        color: greyColor,
                      ),
                    ),
                  ),
                ),
                SeatItem(
                  id: 'C5',
                ),
                SeatItem(
                  id: 'D5',
                ),
              ],
            ),
            SizedBox(
              height: 30,
            ),
            // NOTE : YOUR SEAT
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Your seat',
                  style: light.copyWith(
                    color: greyColor,
                  ),
                ),
                Text(
                  'A3, B3',
                  style: medium.copyWith(
                    fontSize: 16,
                    color: blackColor,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 16,
            ),
            //NOTE : TOTAL
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Total',
                  style: light.copyWith(
                    color: greyColor,
                  ),
                ),
                Text(
                  'IDR 540.000.000',
                  style: medium.copyWith(
                    fontSize: 16,
                    color: primaryColor,
                  ),
                ),
              ],
            ),
          ],
        ),
      );
    }

    Widget checkOutButton() {
      return Container(
          margin: EdgeInsets.only(left: 24, right: 24, top: 30, bottom: 45),
          child: CustomButton(
            title: 'Continue To Checkout',
            width: double.infinity,
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CheckoutDetail(),
                ),
              );
            },
          ));
    }

    return Scaffold(
      backgroundColor: backgroundColor,
      body: ListView(
        children: [
          title(),
          statusSeat(),
          cardSeat(),
          checkOutButton(),
        ],
      ),
    );
  }
}
