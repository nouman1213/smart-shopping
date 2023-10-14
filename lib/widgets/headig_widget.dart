// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:smart_shopping/utils/constant.dart';

class HeadingWidget extends StatelessWidget {
  const HeadingWidget(
      {super.key,
      required this.headigTitle,
      required this.headigSubTitle,
      required this.buttonText,
      required this.ontap});
  final headigTitle;
  final headigSubTitle;
  final buttonText;
  final VoidCallback ontap;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 5.0, vertical: 5),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '$headigTitle',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.grey.shade800,
                      fontSize: 16),
                ),
                Text(
                  '$headigSubTitle',
                  style: const TextStyle(color: Colors.grey, fontSize: 14),
                ),
              ],
            ),
            GestureDetector(
              onTap: ontap,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: AppConst.primaryColor, width: 1.5),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Text(
                        '$buttonText',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: AppConst.primaryColor,
                            fontSize: 16),
                      ),
                      Icon(
                        Icons.arrow_forward_ios,
                        size: 18,
                        color: AppConst.primaryColor,
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
