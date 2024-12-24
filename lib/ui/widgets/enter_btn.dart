import 'package:contacts_pojo/ui/theme/colors.dart';
import 'package:flutter/material.dart';

class EnterBtn extends StatelessWidget {
  final VoidCallback check;
  const EnterBtn({super.key , required this.check});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        Future.delayed(Duration.zero,check);
      },
      style: ElevatedButton.styleFrom(
          backgroundColor: MyColors.goldColor,
          foregroundColor: MyColors.primaryColor,
          overlayColor: Colors.transparent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          padding: const EdgeInsets.all(16)),
      child: const Text(
        'Enter User',
        style: TxtStyle.btnText,
        textAlign: TextAlign.center,
      ),
    );
  }
}
