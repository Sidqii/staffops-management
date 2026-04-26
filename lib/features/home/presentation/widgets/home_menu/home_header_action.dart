import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class HomeHeaderAction extends StatelessWidget {
  const HomeHeaderAction({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Builder(
        builder: (context) {
          return SizedBox(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,

              children: [
                IconButton(
                  onPressed: () {
                    Scaffold.of(context).openDrawer();
                  },

                  icon: Icon(Icons.grid_view_rounded),
                ),

                Text(
                  DateFormat('d MMMM').format(DateTime.now()),
                  style: TextStyle(fontSize: 30),
                ),

                IconButton(onPressed: () {}, icon: Icon(Icons.history_sharp)),
              ],
            ),
          );
        },
      ),
    );
  }
}
