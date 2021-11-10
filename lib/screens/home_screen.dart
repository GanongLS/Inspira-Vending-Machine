import 'package:flutter/material.dart';
import 'package:inspira_vm/screens/transactions.dart';
import 'package:inspira_vm/screens/vendings.dart';
import 'package:inspira_vm/services/state_tab.dart';
import 'package:inspira_vm/widgets/composition/app_bar.dart';
import 'package:inspira_vm/widgets/composition/user_balance.dart';
import 'package:inspira_vm/widgets/composition/custom_tabs.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        
          child: Consumer<AppState>(
            builder: (context, appState, _) => Column(
              children: <Widget>[
                const CustomAppBar(),
                const UserBalance(),
                const CustomTabs(),
                Provider.of<AppState>(context).selectedWidgetMarker == WidgetMarker.vendings
                    ? Vendings()
                    : const Transactions()
              ],
            ),
          ),
        ),
     
    );
  }
}
