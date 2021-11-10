import 'package:flutter/material.dart';
import 'package:inspira_vm/services/state_tab.dart';
import 'package:inspira_vm/utilities/theme_colors.dart';
import 'package:inspira_vm/utilities/theme_styles.dart';
import 'package:provider/provider.dart';


class CustomTabs extends StatefulWidget {
  const CustomTabs({Key? key}) : super(key: key);

  @override
  _TabsState createState() => _TabsState();
}

class _TabsState extends State<CustomTabs> {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<AppState>(context);
    return Padding(
      padding: const EdgeInsets.only(left: 12.0, top: 16.0, bottom: 12.0),
      child: SizedBox(
        height: 25.0,
        child: Row(
          children: <Widget>[
            GestureDetector(
              onTap: () {
                provider.changeToVendings();
              },
              child: Column(
                children: <Widget>[
                  Text(
                    'Vending',
                    style: provider.isSelectedVendings
                        ? ThemeStyles.activeTab
                        : ThemeStyles.inactiveTab,
                  ),
                  const SizedBox(height: 4.0),
                  Container(
                    width: 60.0,
                    height: 2.0,
                    color: provider.isSelectedVendings
                        ? ThemeColors.darkBlue
                        : Colors.transparent,
                  )
                ],
              ),
            ),
            const SizedBox(width: 15.0),
            GestureDetector(
              onTap: () {
                provider.changeToTransactions();
              },
              child: Column(
                children: <Widget>[
                  Text(
                    'Transactions',
                    style: provider.isSelectedTransactions
                        ? ThemeStyles.activeTab
                        : ThemeStyles.inactiveTab,
                  ),
                  const SizedBox(height: 4.0),
                  Container(
                    width: 60.0,
                    height: 2.0,
                    color: provider.isSelectedTransactions
                        ? ThemeColors.darkBlue
                        : Colors.transparent,
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
