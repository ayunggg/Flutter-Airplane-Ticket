import 'package:airplane/shared/theme.dart';
import 'package:airplane/ui/pages/succes_booked_page.dart';
import 'package:airplane/ui/widgets/custom_button.dart';
import 'package:airplane/ui/widgets/custom_card_new_destination.dart';
import 'package:airplane/ui/widgets/custom_checkout_detail_item.dart';
import 'package:flutter/material.dart';

class CheckoutDetail extends StatelessWidget {
  const CheckoutDetail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget route() {
      return Column(
        children: [
          //NOTE : IMAGE ROUTE PLANE
          Container(
            width: double.infinity,
            height: 65,
            margin: EdgeInsets.only(top: 50),
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.fitHeight,
                image: AssetImage('assets/images/image_route.png'),
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          //NOTE : CITY NAME ROUTE
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'CGK',
                      style: semiBold.copyWith(
                        fontSize: 24,
                        color: blackColor,
                      ),
                    ),
                    Text(
                      'Tangerang',
                      style: light.copyWith(
                        fontSize: 14,
                        color: blackColor,
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      'TLC',
                      style: semiBold.copyWith(
                        fontSize: 24,
                        color: blackColor,
                      ),
                      textAlign: TextAlign.right,
                    ),
                    Text(
                      'Ciliwung',
                      style: light.copyWith(
                        fontSize: 14,
                        color: blackColor,
                      ),
                      textAlign: TextAlign.right,
                    ),
                  ],
                ),
              ),
            ],
          )
        ],
      );
    }

    Widget cardDetail() {
      return Container(
        width: double.infinity,
        margin: EdgeInsets.only(top: 30),
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
        decoration: BoxDecoration(
          color: whiteColor,
          borderRadius: BorderRadius.circular(18),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //NOTE : Header Card

            //NOTE : BOOKING DETAILS
            Container(
              margin: EdgeInsets.only(top: 20),
              child: Text(
                'Booking Details',
                style: semiBold.copyWith(
                  fontSize: 16,
                ),
              ),
            ),
            CheckoutDetailItem(
              title: 'Travelr',
              description: '2 Person',
            ),
            CheckoutDetailItem(
              title: 'Seat',
              description: 'A3, B3',
            ),
            CheckoutDetailItem(
              title: 'Insurance',
              description: 'YES',
              dfColor: greenColor,
            ),
            CheckoutDetailItem(
              title: 'Refundable',
              description: 'NO',
              dfColor: redColor,
            ),
            CheckoutDetailItem(
              title: 'VAT',
              description: '45%',
            ),
            CheckoutDetailItem(
              title: 'Price',
              description: 'IDR 8.500.690',
            ),
            CheckoutDetailItem(
              title: 'Grand Total',
              description: 'IDR 12.000.000',
            ),
          ],
        ),
      );
    }

    Widget paymentDetails() {
      return Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
        margin: EdgeInsets.only(top: 30),
        decoration: BoxDecoration(
          color: whiteColor,
          borderRadius: BorderRadius.circular(18),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Payment Details',
              style: semiBold.copyWith(
                fontSize: 16,
                color: blackColor,
              ),
            ),
            Row(
              children: [
                Container(
                  width: 100,
                  height: 70,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(
                        'assets/images/images_bg_wallet.png',
                      ),
                    ),
                  ),
                  child: Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: 24,
                          height: 24,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage(
                                'assets/logo/logo_airplane.png',
                              ),
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
                  ),
                ),
                SizedBox(
                  width: 16,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'IDR 80.400.000',
                      style: medium.copyWith(
                        fontSize: 18,
                        color: blackColor,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      'Current Balance',
                      style: light.copyWith(
                        color: greyColor,
                      ),
                    ),
                  ],
                )
              ],
            ),
          ],
        ),
      );
    }

    Widget buttonPayNow() {
      return CustomButton(
        title: 'Pay Now',
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => SuccessBooked(),
            ),
          );
        },
        margin: EdgeInsets.only(top: 30),
      );
    }

    Widget tagSection() {
      return Container(
        margin: EdgeInsets.only(top: 30, bottom: 30),
        child: Align(
          alignment: Alignment.bottomCenter,
          child: Text(
            'Terms and Conditions',
            style: light.copyWith(
              fontSize: 16,
              color: greyColor,
              decoration: TextDecoration.underline,
            ),
          ),
        ),
      );
    }

    return Scaffold(
      backgroundColor: backgroundColor,
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 24),
        children: [
          route(),
          cardDetail(),
          paymentDetails(),
          buttonPayNow(),
          tagSection(),
        ],
      ),
    );
  }
}
