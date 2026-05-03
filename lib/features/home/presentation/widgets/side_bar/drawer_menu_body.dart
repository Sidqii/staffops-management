import 'package:flutter/material.dart';
import 'package:staffops/shared/themes/app_color.dart';

class DrawerMenuBody extends StatelessWidget {
  const DrawerMenuBody({super.key});

  static const Color softWhite = AppColor.softWhite;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView(
        padding: EdgeInsets.zero,

        children: [
          ListTile(
            leading: const Icon(Icons.home_rounded, color: softWhite),
            title: const Text('Home', style: TextStyle(color: softWhite)),

            onTap: () {},
          ),

          ListTile(
            leading: const Icon(Icons.person, color: softWhite),
            title: const Text('Profile', style: TextStyle(color: softWhite)),

            onTap: () {},
          ),

          // Kalau mau nambah menu side bar disini aja
        ],
      ),
    );
  }
}
