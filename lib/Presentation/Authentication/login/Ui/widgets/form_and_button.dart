// ignore_for_file: depend_on_referenced_packages

import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ovacare/Core/Widgets/Custom_Button.dart';
import 'package:ovacare/Core/Widgets/Custom_Textfromfield.dart';
import 'package:ovacare/Core/Widgets/app_text_form_field.dart';

import '../../../../../Core/themes/Colors/ColorsStyle.dart';

class FormAndButton extends StatefulWidget {
  const FormAndButton({super.key});

  @override
  State<FormAndButton> createState() => _FormAndButton();
}

class _FormAndButton extends State<FormAndButton> {
  final GlobalKey<FormState> formKey = GlobalKey();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  bool isObscureText = true;
  TextEditingController _email=TextEditingController();
  TextEditingController _pass=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Form(
        key: formKey,
        autovalidateMode: autovalidateMode,
        child: Column(
          children: [
            CustomTextfromfield(hintText: 'Email', Controller: _email,prefixIcon: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Icon(Icons.email,color: ColorStyle.darkgray,size:30,),
            ),),
            // const AppTextFormField(
            //   hintText: 'Email',
            // ),
            SizedBox(height: 15.h),
            CustomTextfromfield(hintText: 'Password', Controller: _email,isObscure: true,prefixIcon: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Icon(Icons.lock,color: ColorStyle.darkgray,size:30,
              ),
            ),SuffixIcon:  GestureDetector(
          onTap: () {
            isObscureText = !isObscureText;
            setState(() {});
          },
          child: Icon(isObscureText ? Icons.visibility_off : Icons.visibility,color: ColorStyle.purple,size:25,)),
    ),
            // AppTextFormField(
            //   hintText: 'Password',
            //   isObscureText: isObscureText,
            //   suffixIcon: GestureDetector(
            //       onTap: () {
            //         isObscureText = !isObscureText;
            //         setState(() {});
            //       },
            //       child: Icon(
            //           isObscureText ? Icons.visibility_off : Icons.visibility)),
            // ),
            // SizedBox(height: 1.h),
            Align(
              alignment: AlignmentDirectional.centerEnd,
              child: TextButton(
                  onPressed: () {},
                  // ignore: prefer_const_constructors
                  child: Text(
                    'Forgot Password ?',style: TextStyle(color: ColorStyle.purple,fontWeight: FontWeight.bold),
                  )),
            ),
            // SizedBox(height:10.h),
            CustomButton(
              name: 'Login',
              ontap: () {
                if (formKey.currentState!.validate()) {
                  print("Doneeeeeeeeee");
                } else {
                  autovalidateMode = AutovalidateMode.always;
                }
                setState(() {});
              },
              width: double.infinity,
              height: 45.h,
              fontSize: 20.spMin,
            )
          ],
        ));
  }
}
