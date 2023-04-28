import 'package:docter_app/utils/colors/colors.dart';
import 'package:flutter/material.dart';

class InputTextField extends StatelessWidget {
  const InputTextField(
      {Key? key,
      required this.myController,
      required this.focusNode,
      required this.onFileSubmittedValue,
      required this.onValidator,
      required this.keyboardType,
      required this.hint,
      required this.obscureText,
      this.enable = true,
      this.autoFocus = false})
      : super(key: key);
  final TextEditingController myController;
  final FocusNode focusNode;
  final FormFieldSetter onFileSubmittedValue;
  final FormFieldValidator onValidator;
  final TextInputType keyboardType;
  final String hint;
  final bool obscureText;
  final bool enable, autoFocus;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10.0),
      child: TextFormField(
        controller: myController,
        focusNode: focusNode,
        onFieldSubmitted: onFileSubmittedValue,
        validator: onValidator,
        keyboardType: keyboardType,
        obscureText: obscureText,
        enabled: enable,
        style: Theme.of(context)
            .textTheme
            .bodyText2!
            .copyWith(height: 0, fontSize: 10),
        cursorColor: FlexColor.black,
        decoration: InputDecoration(
            filled: true,
            contentPadding: const EdgeInsets.all(15),
            hintText: hint,
            fillColor: FlexColor.lightSurfaceOrg,
            hintStyle: Theme.of(context)
                .textTheme
                .bodyText2!
                .copyWith(height: 0, color: FlexColor.black.withOpacity(0.8)),
            border: const OutlineInputBorder(
                borderSide: BorderSide(color: FlexColor.lightSurfaceOrg),
                borderRadius: BorderRadius.all(Radius.circular(8))),
            focusedBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: FlexColor.lightSurfaceOrg),
                borderRadius: BorderRadius.all(Radius.circular(8))),
            errorBorder: const OutlineInputBorder(
                borderSide:
                    BorderSide(color: FlexColor.redDarkSecondaryContainer),
                borderRadius: BorderRadius.all(Radius.circular(8))),
            enabledBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: FlexColor.black),
                borderRadius: BorderRadius.all(Radius.circular(8)))),
      ),
    );
  }
}
