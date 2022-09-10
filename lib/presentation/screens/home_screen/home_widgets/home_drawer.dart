import 'package:flutter/material.dart';
import 'package:weather_app/presentation/styles/assets_manager.dart';
import 'package:weather_app/presentation/styles/colors_manager.dart';
import 'package:weather_app/presentation/styles/icon_broken.dart';
import 'package:weather_app/presentation/widgets/text_style_manager.dart';

class HomeDrawer extends StatelessWidget {
  const HomeDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: ColorManager.containerColor,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 20.0,
        ),
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 40,),
              Align(
                alignment: Alignment.topRight,
                child: IconButton(
                    onPressed: (){},
                    icon: Icon(
                      IconBroken.Setting,
                      size: 30,
                      color: ColorManager.white,
                    )
                ),
              ),
              const SizedBox(height: 15,),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Icon(
                    IconBroken.Star,
                    size: 30,
                    color: ColorManager.white,
                  ),
                  const SizedBox(width: 10,),
                  Text(
                      'Favorite Location',
                      style: defaultTextStyle(16, ColorManager.white,fontWeight: FontWeight.w500)
                  ),
                  const Spacer(),
                  Icon(
                    IconBroken.Info_Circle,
                    size: 30,
                    color: ColorManager.white,
                  ),
                  const SizedBox(width: 10,),
                ],
              ),
              const SizedBox(height: 25,),
              Row(
                children: [
                  const SizedBox(width: 25,),
                  Icon(
                    Icons.location_on,
                    color: ColorManager.white,
                    size: 22,
                  ),
                  const SizedBox(
                    width: 10.0,
                  ),
                  Text(
                      'Banha',
                      style: defaultTextStyle(22, ColorManager.white,fontWeight: FontWeight.w500)
                  ),
                  const Spacer(),
                  const Image(
                    height: 20,
                    width: 20,
                    image: AssetImage(AssetsManager.uvIcon),
                  ),
                  const SizedBox(width: 10,),
                  Text(
                      '30\u00B0',style: defaultTextStyle(18, ColorManager.white,fontWeight: FontWeight.w500)
                  ),
                  const SizedBox(width: 10,),
                ],
              ),
              const SizedBox(height: 10,),
              Divider(
                thickness: 1,
                color: ColorManager.white,
              ),
              const SizedBox(height: 15,),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Icon(
                    IconBroken.Location,
                    size: 30,
                    color: ColorManager.white,
                  ),
                  const SizedBox(width: 10,),
                  Text(
                      'Other locations',
                      style: defaultTextStyle(14, ColorManager.white,fontWeight: FontWeight.w500),
                  ),
                ],
              ),
              const SizedBox(height: 15,),
              Row(
                children: [
                  const SizedBox(width: 40,),
                  Text(
                      'Saint Cathrine',
                      style: defaultTextStyle(20, ColorManager.white,fontWeight: FontWeight.w500),
                  ),
                  const Spacer(),
                  const Image(
                    height: 20,
                    width: 20,
                    image: AssetImage(AssetsManager.uvIcon),
                  ),
                  const SizedBox(width: 10,),
                  Text(
                      '29\u00B0',
                      style: defaultTextStyle(18, ColorManager.white,fontWeight: FontWeight.w500),
                  ),
                  const SizedBox(width: 10,),
                ],
              ),
              const SizedBox(height: 25,),
              Align(
                alignment: Alignment.center,
                child: MaterialButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25)
                  ),
                  padding: const EdgeInsets.symmetric(
                      horizontal: 65,
                      vertical: 15
                  ),
                  color: ColorManager.primary1,
                  onPressed: (){},
                  child: Text('Manage locations',style: defaultTextStyle(16, ColorManager.white,fontWeight: FontWeight.w500),),
                ),
              ),
              const SizedBox(height: 15,),
              Divider(
                thickness: 1,
                color: ColorManager.white,
              ),
              const SizedBox(height: 15,),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Icon(
                    IconBroken.Info_Circle,
                    size: 30,
                    color: ColorManager.white,
                  ),
                  const SizedBox(width: 10,),
                  Text(
                      'Report wrong location',
                      style: defaultTextStyle(18, ColorManager.white,fontWeight: FontWeight.w500),
                  ),
                ],
              ),
              const SizedBox(height: 25,),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Icon(
                    IconBroken.Call,
                    size: 30,
                    color: ColorManager.white,
                  ),
                  const SizedBox(width: 10,),
                  Text(
                      'Contact us',
                      style: defaultTextStyle(18, ColorManager.white,fontWeight: FontWeight.w500),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
