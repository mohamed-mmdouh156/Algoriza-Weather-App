import 'package:flutter/material.dart';
import 'package:weather_app/presentation/styles/colors_manager.dart';
import 'package:weather_app/presentation/widgets/text_style_manager.dart';

class HomeTomorrowTemp extends StatelessWidget {
  const HomeTomorrowTemp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 20.0,
        vertical: 5.0,
      ),
      child: Container(
        height: 100,
        width: double.infinity,
        decoration: BoxDecoration(
            color: ColorManager.containerColor,
            borderRadius: BorderRadius.circular(15)
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
                'Tomorrow\'s Temperature',
                style: defaultTextStyle(17, ColorManager.white,fontWeight: FontWeight.w900)
            ),
            const SizedBox(height: 5,),
            Text(
                'Almost the same as today',
                style: defaultTextStyle(14, ColorManager.whiteDark,)
            ),
          ],
        ),
      ),
    );
  }
}
