import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:inspira_vm/utilities/theme_colors.dart';
import 'package:inspira_vm/utilities/theme_styles.dart';
import 'package:inspira_vm/widgets/profile_pic.dart';


class CustomAppBar extends StatefulWidget {
  const CustomAppBar({Key? key}) : super(key: key);

  @override
  _AppbarState createState() => _AppbarState();
}

class _AppbarState extends State<CustomAppBar> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 70.0,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Row(
            children: <Widget>[
              const ProfilePic(),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 12.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text('WELCOME', style: ThemeStyles.welcomeTextStyle),
                    Text('Luki Subandi', style: ThemeStyles.userNameTextStyle),
                  ],
                ),
              ),
            ],
          ),
          Row(
            children: <Widget>[
              IconButton(
                icon: SvgPicture.asset(
                  'assets/more-horizontal.svg',
                  color: ThemeColors.grey,
                ),
                onPressed: null,
              ),
              Stack(
                children: <Widget>[
                  IconButton(
                    icon: SvgPicture.asset(
                      'assets/bell.svg',
                      color: ThemeColors.darkBlue,
                    ),
                    onPressed: null,
                  ),
                  Positioned(
                    left: 24.0,
                    top: 4.0,
                    child: SvgPicture.asset('assets/badge.svg'),
                  )
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}
