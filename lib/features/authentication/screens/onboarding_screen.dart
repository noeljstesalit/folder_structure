import 'package:crobros/Utils/constants/image_strings.dart';
import 'package:crobros/Utils/helper/helper_functions.dart';
import 'package:flutter/material.dart';

class OnBorading extends StatelessWidget {
  const OnBorading({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            children: [
              Column(
                children: [
                  Image(
                    width: THelperFunctions.getScreenWidth(),
                    image: AssetImage(TImages.OnBoradingImage1),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
