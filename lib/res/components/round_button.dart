import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:samplep/res/color.dart';

class RoundButton extends StatelessWidget {
  final String title;
  final bool loading;
  final VoidCallback onPress;
  const RoundButton({super.key,
    required this.title,
    this.loading = false,
    required this.onPress});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPress,
      child: Container(
        height: 40,
        width: 200,
        decoration: BoxDecoration(
          color: Colors.deepPurple,
          borderRadius: BorderRadius.circular(10)
        ),
        child: Center(
          child: loading? CircularProgressIndicator():
           Text('as',style: TextStyle(color: AppColor.whiteColor),),
        ),
      ),
    );
  }
}
