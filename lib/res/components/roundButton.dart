import 'package:flutter/material.dart';

import '../colors.dart';

class Roundbutton extends StatelessWidget {

  final String title;
  final bool loading;
  final VoidCallback ontap;

   Roundbutton({super.key,required this.title,this.loading = false,required this.ontap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ontap,
      child: Container(
        height: 40,
        width: 200,
        decoration: BoxDecoration(
            color: AppColors.buttonColor,
          borderRadius: BorderRadius.circular(10)
        ),
        child: Center(
          child: loading ? CircularProgressIndicator(color: AppColors.whiteColor,) : Text(title, style: TextStyle(color: AppColors.whiteColor),
          ),
        )
      )
    );
  }
}
