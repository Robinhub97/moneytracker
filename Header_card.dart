import 'package:flutter/material.dart';


class HeaderCard extends StatelessWidget {
  final String title;
  final double amount;
  final Widget icon;
  
    const HeaderCard({
    Key? key,
    required this.title,
    required this.amount,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Expanded(
      child:  Card(
        margin: EdgeInsets.zero,
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                    icon,
                    // Icons.money_off, 
                    // color: Colors.red,
                    const SizedBox(width: 4),
                    Text(title, style: const TextStyle(color: Colors.grey)),
                    const SizedBox(width: 12),
                ],
              ),
              const SizedBox(height: 8),
              Text('€ ${amount.toStringAsFixed(2)}', style: textTheme.titleLarge),
              
            ],
          ),
        ),
      ),
    );
  }
}