import 'package:first_project/helper/appColors.dart';
import 'package:first_project/helper/textStyles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TextFieldWidget extends StatefulWidget {
  const TextFieldWidget({
    super.key,
    required this.hintText,
    this.keyboardType,
    this.textEditingController,
    required this.suffixImage,
    this.borderSide,
    this.prefixIcon,
    this.visibleIcon,
    this.validator,
    this.textColor,
    this.containerColor,
    this.formkey,
    this.autovalidateMode,
  });
  final String hintText;
  final TextInputType? keyboardType;
  final TextEditingController? textEditingController;
  final Widget? prefixIcon;
  final String suffixImage;
  final Color? borderSide;
  final bool? visibleIcon;
  final String? Function(String?)? validator;
  final Color? textColor, containerColor;
  final Key? formkey;
  final AutovalidateMode? autovalidateMode;

  @override
  @override
  @override
  State<TextFieldWidget> createState() => _TextFieldWidgetState();
}

class _TextFieldWidgetState extends State<TextFieldWidget> {
  bool visible = true;
  bool obsecure = false;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autovalidateMode: widget.autovalidateMode,
      validator: widget.validator,
      key: widget.formkey,
      obscureText: obsecure,
      textAlign: TextAlign.end,
      textDirection: TextDirection.ltr,
      controller: widget.textEditingController,
      textInputAction: TextInputAction.next,
      keyboardType: widget.keyboardType,
      decoration: InputDecoration(
        suffixIcon: Container(
          width: 22.r,
          height: 33.r,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(
                widget.suffixImage,
              ),
            ),
          ),
        ),
        prefixIcon: Visibility(
            visible: widget.visibleIcon ?? false,
            child: InkWell(
                onTap: () {
                  setState(() {
                    visible = !visible;
                    obsecure = !obsecure;
                  });
                },
                child: Icon(
                  visible ? Icons.visibility : Icons.visibility_off,
                  color: Colors.black26,
                ))),
        fillColor: widget.containerColor ?? Colors.white,
        hintText: widget.hintText,
        hintStyle: AppTextStyle.regular12.copyWith(color: widget.textColor),
        enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: widget.borderSide ?? Colors.black26),
            borderRadius: BorderRadius.all(Radius.circular(8.r))),
        focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Appcolors.textColor),
            borderRadius: BorderRadius.all(Radius.circular(8.r))),
        filled: true,
        errorBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.redAccent),
        ),
      ),
    );
  }
}
