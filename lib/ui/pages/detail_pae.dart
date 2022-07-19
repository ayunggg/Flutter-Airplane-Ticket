// ignore_for_file: prefer_const_constructors

import 'package:airplane/models/destination.dart';
import 'package:airplane/shared/theme.dart';
import 'package:airplane/ui/pages/choose_seat_page.dart';
import 'package:airplane/ui/widgets/custom_button.dart';
import 'package:airplane/ui/widgets/custom_photos_item.dart';
import 'package:airplane/ui/widgets/custom_pinterest_item.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DetailPage extends StatelessWidget {
  final DestinationModel destinationModel;
  const DetailPage(this.destinationModel, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget imageDetail() {
      return Container(
        width: double.infinity,
        height: 450,
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: NetworkImage(
              destinationModel.imageUrl,
            ),
          ),
        ),
      );
    }

    Widget shadowImage() {
      return Container(
        width: double.infinity,
        height: 214,
        margin: EdgeInsets.only(top: 236),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              whiteColor.withOpacity(0),
              Colors.black.withOpacity(0.95),
            ],
          ),
        ),
      );
    }

    Widget content() {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //NOTE : Logo Emblem Front Image
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                  'assets/icons/icon_emblem.png',
                ),
              ),
            ),
          ),
          //NOTE : Title
          Container(
            margin: EdgeInsets.only(
              top: 310,
              left: 24,
              right: 24,
            ),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        destinationModel.name,
                        style: semiBold.copyWith(
                          fontSize: 24,
                          color: whiteColor,
                        ),
                      ),
                      Text(
                        destinationModel.city,
                        style: light.copyWith(
                          fontSize: 16,
                          color: whiteColor,
                        ),
                      ),
                    ],
                  ),
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: 20,
                      height: 20,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('assets/icons/icon_start.png'),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 2,
                    ),
                    Text(
                      destinationModel.rating.toString(),
                      style: medium.copyWith(
                        color: whiteColor,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),

          //Note: Card Content
          Container(
            width: double.infinity,
            height: 446,
            margin: EdgeInsets.only(left: 24, right: 24, top: 30),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(18),
              color: whiteColor,
            ),
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'About',
                    style: semiBold.copyWith(
                      fontSize: 16,
                      color: blackColor,
                    ),
                  ),
                  Text(
                    'Berada di jalur jalan provinsi yang menghubungkan Denpasar Singaraja serta letaknya yang dekat dengan Kebun Raya Eka Karya menjadikan tempat Bali.',
                    style: regular.copyWith(
                      color: blackColor,
                      height: 2,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    'Photos',
                    style: semiBold.copyWith(
                      fontSize: 16,
                      color: blackColor,
                    ),
                  ),
                  // NOTE : List Of Photos
                  Container(
                    margin: EdgeInsets.only(top: 8),
                    child: Row(
                      children: [
                        PhotosItem(
                          imageUrl: 'assets/images/images_detail_1.png',
                        ),
                        PhotosItem(
                          imageUrl: 'assets/images/images_detail_2.png',
                        ),
                        PhotosItem(
                          imageUrl: 'assets/images/images_detail_3.png',
                        ),
                      ],
                    ),
                  ),
                  // NOTE : Interest
                  Container(
                    margin: EdgeInsets.only(top: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Pinterest',
                          style: semiBold.copyWith(
                            fontSize: 16,
                            color: blackColor,
                          ),
                        ),
                        Row(
                          children: [
                            PinterestItem(
                              text: 'Kids Park',
                            ),
                            PinterestItem(
                              text: 'Honor Bridge',
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            PinterestItem(
                              text: 'City Museum',
                            ),
                            PinterestItem(
                              text: 'Central Mall',
                            ),
                          ],
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
          //NOTE : Footer
          Container(
            margin: EdgeInsets.symmetric(
              horizontal: 24,
              vertical: 30,
            ),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        NumberFormat.currency(
                          locale: 'id',
                          symbol: 'IDR ',
                          decimalDigits: 0,
                        ).format(destinationModel.price),
                        style: medium.copyWith(
                          fontSize: 18,
                          color: blackColor,
                        ),
                      ),
                      SizedBox(
                        height: 4,
                      ),
                      Text(
                        'Per orang',
                        style: light.copyWith(
                          color: greyColor,
                        ),
                      ),
                    ],
                  ),
                ),
                CustomButton(
                  title: 'Book Now',
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ChooseSeatPage(),
                      ),
                    );
                  },
                  width: 170,
                )
              ],
            ),
          )
        ],
      );
    }

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Stack(
            children: [
              imageDetail(),
              shadowImage(),
              content(),
            ],
          ),
        ),
      ),
    );
  }
}
