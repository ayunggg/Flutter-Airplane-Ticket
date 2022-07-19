// ignore_for_file: prefer_const_constructors

import 'package:airplane/models/destination.dart';
import 'package:airplane/shared/theme.dart';
import 'package:airplane/ui/pages/detail_pae.dart';
import 'package:flutter/material.dart';

class CardPopularDestination extends StatelessWidget {
  final DestinationModel destinationModel;

  const CardPopularDestination(
    this.destinationModel, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetailPage(destinationModel),
          ),
        );
      },
      child: Container(
        margin: EdgeInsets.only(left: 24),
        padding: EdgeInsets.all(10),
        width: 200,
        height: 323,
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: blackColor,
              blurRadius: 0.5,
              offset: Offset(0, 1),
            )
          ],
          color: whiteColor,
          borderRadius: BorderRadius.circular(18),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 180,
              height: 220,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(18),
                image: DecorationImage(
                  image: NetworkImage(
                    destinationModel.imageUrl,
                  ),
                  fit: BoxFit.cover,
                ),
              ),
              child: Align(
                alignment: Alignment.topRight,
                child: Container(
                  width: 55,
                  height: 30,
                  decoration: BoxDecoration(
                    color: whiteColor,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(18),
                    ),
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
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
                          color: blackColor,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    destinationModel.name,
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
                    destinationModel.city,
                    style: light.copyWith(
                      color: greyColor,
                    ),
                    overflow: TextOverflow.ellipsis,
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
