import 'package:contacts_pojo/ui/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class InputField extends StatelessWidget {
  final String txt;
  final int txtLimit;
  //final TextEditingController controller;
  //final String? errortxt;
  final FormFieldValidator vali;
  final FormFieldValidator save;
  const InputField({
    super.key,
    required this.txt,
    required this.txtLimit,
    //required this.controller,
    //required this.errortxt,
    required this.vali,
    required this.save,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      cursorColor: MyColors.goldColor,
      style: TxtStyle.titleMedium,
      inputFormatters: [LengthLimitingTextInputFormatter(txtLimit)],
      validator: vali,
      onSaved: save ,
      decoration: InputDecoration(
        fillColor: MyColors.primaryColor,
        filled: true,
        hintText: txt,
        hintStyle: TxtStyle.hintText,
        //errorText: errortxt,
        errorStyle: const TextStyle(fontSize: 10, color: MyColors.redColor , fontWeight: FontWeight.bold),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: const BorderSide(width: 2, color: MyColors.goldColor)),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: const BorderSide(width: 2, color: MyColors.goldColor),
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: const BorderSide(width: 2, color: MyColors.goldColor),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: const BorderSide(width: 2, color: MyColors.goldColor),
        ),
        errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: const BorderSide(width: 2, color: MyColors.redColor)),
        focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: const BorderSide(width: 2, color: MyColors.redColor)),
        contentPadding:
            const EdgeInsetsDirectional.symmetric(horizontal: 16, vertical: 16),
      ),
    );
  }
}
