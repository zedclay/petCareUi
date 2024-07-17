import 'package:flutter/material.dart';
import 'package:petcare/core/constants/color.dart';

class CustomTextfield extends StatelessWidget {
  final bool ishidden;
  final String? Function(String?)? isvalid;
  final String hint;
  final TextEditingController? textcontroller;
  final Widget suffixIcon;
  final double radius;
  final Color fill;
  const CustomTextfield(
      {super.key,
      this.ishidden = false,
      this.textcontroller,
      required this.hint,
      required this.suffixIcon,
      this.radius = 40,
      this.fill = const Color(0xffE5E5E5), this.isvalid});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: TextFormField(
        validator: isvalid,
        obscureText: ishidden,
        style: const TextStyle(fontSize: 14, fontWeight: FontWeight.normal),
        controller: textcontroller,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        decoration: InputDecoration(
            filled: true,
            fillColor: fill,
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: AppColor.primaryColor),
                borderRadius: BorderRadius.circular(radius)),
            hintText: hint,
            border: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.circular(radius)),
            suffixIcon: suffixIcon),
      ),
    );
  }
}
