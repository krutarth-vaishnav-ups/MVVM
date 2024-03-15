
import 'package:flutter/material.dart';
import 'package:mvvm/resources/app_colors.dart';

class RoundButton extends StatelessWidget {

  final String title;
  final bool loading;
  final VoidCallback onPressed;

  const RoundButton({
    super.key,
    required this.title,
    this.loading = false,
    required this.onPressed
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        height: 40,
        width: 200,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: AppColors.buttonColor,
          borderRadius: BorderRadius.circular(10)
        ),
        child: loading
        ? const SizedBox(
          height: 15,
          width: 15,
          child: CircularProgressIndicator(color: AppColors.whiteColor,),
        )
        : Text(
          title,
          style: const TextStyle(
            color: AppColors.blackColor
          ),
        ),
      ),
    );
  }
}
