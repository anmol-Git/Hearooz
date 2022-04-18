import 'package:flutter/material.dart';
import 'package:hearooz/utils/colors.dart';

class MediaButton extends StatelessWidget {
  final IconData icon;
  final double height;
  final double width;
  const MediaButton(
      {Key? key, required this.icon, required this.height, required this.width})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox.fromSize(
      size: Size(width, height),
      child: ClipOval(
        child: Material(
          color: Colors.white,
          child: InkWell(
            splashColor: MyColor.backgroundColor,
            onTap: () {},
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Icon(
                    icon,
                    color: MyColor.headerIconColor,
                  ),
                ), // <-- Text
              ],
            ),
          ),
        ),
      ),
    );
  }
}
