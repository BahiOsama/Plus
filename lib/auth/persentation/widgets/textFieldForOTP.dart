import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TextFieldForOTP extends StatelessWidget {
  const TextFieldForOTP({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 64.r,
      height: 68.r,
      child: TextField(
        onChanged: (value) {
          if (value.length == 1) {
            FocusScope.of(context).nextFocus();
          }
        },
        textAlign: TextAlign.center,
        inputFormatters: [
          FilteringTextInputFormatter.digitsOnly,
          LengthLimitingTextInputFormatter(1)
        ],
        keyboardType: TextInputType.number,
        style: Theme.of(context).textTheme.bodyLarge,
        decoration: InputDecoration(
          fillColor: Colors.white,
          hintText: '_',
          hintStyle: const TextStyle(color: Colors.black26),
          enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.black12),
              borderRadius: BorderRadius.all(Radius.circular(12.r))),
          focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.black12),
              borderRadius: BorderRadius.all(Radius.circular(12.r))),
          filled: true,
          errorBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.redAccent),
          ),
        ),
      ),
    );
  }
}
