import 'package:flutter/material.dart';
import 'package:inspira_vm/utilities/theme_colors.dart';


class ProfilePic extends StatefulWidget {
  const ProfilePic({Key? key}) : super(key: key);

  @override
  _ProfilePicState createState() => _ProfilePicState();
}

class _ProfilePicState extends State<ProfilePic> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 52.0,
      width: 52.0,
      decoration: BoxDecoration(
        border: Border.all(
          color: ThemeColors.pink,
          width: 3.0,
        ),
        borderRadius: BorderRadius.circular(26.0),
      ),
      child: Container(
        height: 50.0,
        width: 50.0,
        decoration: BoxDecoration(
          border: Border.all(
            width: 2.0,
            color: Colors.white,
          ),
          borderRadius: BorderRadius.circular(25.0),
          image: const DecorationImage(
            image: AssetImage('assets/userImage.jpg'),
            fit: BoxFit.contain,
          ),
        ),
      ),
    );
  }
}
