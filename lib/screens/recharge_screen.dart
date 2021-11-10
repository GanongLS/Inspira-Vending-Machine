import 'package:flutter/material.dart';
import 'package:inspira_vm/services/state_tab.dart';
import 'package:inspira_vm/utilities/theme_colors.dart';
import 'package:inspira_vm/utilities/theme_styles.dart';
import 'package:provider/provider.dart';

class RechargeScreen extends StatelessWidget {
  final List<int> pecahan = [2000, 5000, 10000, 20000, 50000];
  RechargeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<AppState>(context);
    debugPrint(provider.balance.toString());
    return Scaffold(
      appBar: PreferredSize(
        child: Container(
          padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    IconButton(
                      padding: const EdgeInsets.all(0),
                      alignment: Alignment.centerLeft,
                      icon: const Icon(
                        Icons.arrow_back,
                        color: Colors.white,
                      ),
                      tooltip: 'go back',
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                    const Text(
                      'Available Cash',
                      style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w500, color: Colors.white),
                    ),
                  ],
                ),
                Text(
                  'Rp' + provider.balance.toString(),
                  style: const TextStyle(fontSize: 20.0, fontWeight: FontWeight.w500, color: Colors.white),
                ),
              ],
            ),
          ),
          decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [ThemeColors.lightBlue, ThemeColors.darkBlue],
              ),
              boxShadow: const [
                BoxShadow(
                  color: Colors.grey,
                  blurRadius: 8.0,
                  spreadRadius: 1.0,
                )
              ]),
        ),
        preferredSize: Size(MediaQuery.of(context).size.width, 120.0),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: const EdgeInsets.all(8),
            child: const Text('Recharge Option:'),
          ),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 4),
            height: MediaQuery.of(context).size.height * 0.6,
            child: ListView.builder(
              itemCount: pecahan.length,
              itemBuilder: (context, index) => RechargeTile(amount: pecahan[index]),
            ),
          ),
        ],
      ),
    );
  }
}

class RechargeTile extends StatelessWidget {
  const RechargeTile({
    Key? key,
    required this.amount,
  }) : super(key: key);
  final int amount;

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<AppState>(context);
    return Center(
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 8),
        height: MediaQuery.of(context).size.height * 0.07,
        width: MediaQuery.of(context).size.width * 0.9,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(primary: ThemeColors.lightBlue, shape: const StadiumBorder()),
          onPressed: () {
            provider.addBalance(addition: amount);
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                margin: const EdgeInsets.only(left: 8),
                child: const Icon(
                  Icons.payments_outlined,
                  color: Colors.yellowAccent,
                  size: 24.0,
                  semanticLabel: 'Text to announce in accessibility modes',
                ),
              ),
              Text("Rp " + amount.toString(), style: ThemeStyles.vendingButton),
              Container(margin: const EdgeInsets.only(right: 4), child: const Text("Recharge")),
            ],
          ),
        ),
      ),
    );
  }
}
