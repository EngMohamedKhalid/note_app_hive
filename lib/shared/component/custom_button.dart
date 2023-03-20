import 'package:flutter/material.dart';


class CustomButton extends StatelessWidget {
  const CustomButton({Key? key, required this.onPressed, required this.text}) : super(key: key);
  final VoidCallback onPressed;
  final String text;
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(15),
      child: MaterialButton(
        color: const Color(0xff62FCD7),
        padding:const EdgeInsets.symmetric(
            vertical: 10,
            horizontal: 30
        ),
        minWidth: 300,
        onPressed: onPressed,
        child: Text(
          text,
          style:const TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 23,
          ),
        ),

      ),
    );
  }
}
