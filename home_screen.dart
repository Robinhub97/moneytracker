
import 'package:flutter/material.dart';
import 'package:moneytracker/view/components/add_transaction_dialog.dart';
import 'package:moneytracker/view/components/home_header.dart';
import 'package:moneytracker/view/components/transactionslist.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal,
        body: const SafeArea(
          bottom: false,
          child: Column(
              children: [
              HomeHeader(),
              Transactionslist(),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor:  Colors.pink,
          onPressed: () {
            
            showModalBottomSheet(
              context: context, 
              isScrollControlled: true,
              builder: (context) {
                return const AddTransactionDialog ();
          });
          }, 
        child: const Icon (Icons.add, color: Colors.white,),
        ),
      );
    }
  }


