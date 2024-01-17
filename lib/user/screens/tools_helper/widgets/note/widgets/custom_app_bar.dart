import 'package:flutter/material.dart';

import 'custom_search_icon.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({Key? key, required this.title,   this.onPressed}) : super(key: key);

  final String title;
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return  Text(title,style: const TextStyle(
      fontSize: 26,
      fontWeight: FontWeight.bold,
    ));
  }
}

