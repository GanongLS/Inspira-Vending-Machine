import 'package:flutter/material.dart';
import 'package:inspira_vm/screens/recharge_screen.dart';
import 'package:inspira_vm/services/state_tab.dart';
import 'package:inspira_vm/utilities/theme_colors.dart';
import 'package:inspira_vm/utilities/theme_styles.dart';
import 'package:provider/provider.dart';

class RechargeBalance extends StatelessWidget {
  const RechargeBalance({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<AppState>(context);
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Container(
        height: 80.0,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.0),
          gradient: LinearGradient(
            colors: [ThemeColors.lightBlue, ThemeColors.darkBlue],
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'Current Ballance',
                    style: ThemeStyles.availableTextStyle,
                  ),
                  Text(
                    'Rp ' + provider.balance.toString(),
                    style: ThemeStyles.moneyTextStyle,
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.white,
                      shape: const StadiumBorder(),
                    ),
                    onPressed: () { Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) =>  RechargeScreen()),
                      ); },
                    child: Center(child: Text('Recharge', style: ThemeStyles.rechargeTextStyle)),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
