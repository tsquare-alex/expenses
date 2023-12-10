import 'package:expenses/general/constants/MyColors.dart';
import 'package:flutter/material.dart';

class CustomIcon extends StatelessWidget {
  final double? size;
  final Function()? onPressed;
  const CustomIcon({super.key, required this.onPressed, this.size});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: onPressed,
      backgroundColor: MyColors.primary,
      child: Icon(
        Icons.add,
        color: MyColors.white,
      ),
    );
  }
}
