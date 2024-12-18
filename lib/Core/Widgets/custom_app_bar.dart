import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ovacare/Core/themes/Colors/ColorsStyle.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final bool useIconButton;
  final Color? backgroundColor;

   CustomAppBar({super.key, required this.title, required this.useIconButton,this.backgroundColor});

  @override
  Widget build(BuildContext context) {
    // Set status bar color
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        //  statusBarColor: Colors.pink, // Match the AppBar color
        statusBarIconBrightness: Brightness.light,
      ),
    );

    return AppBar(
      // backgroundColor: Colors.pink, // Fill the AppBar with the color
      automaticallyImplyLeading: false,
      elevation: 0,
      backgroundColor: backgroundColor??ColorStyle.white,
      title: Text(
        title,
        style:TextStyle(
          color:  backgroundColor==ColorStyle.pink?ColorStyle.white:ColorStyle.black,
          fontSize: 22.spMin,
          fontWeight: FontWeight.bold,
        ),
      ),
      // centerTitle: true,
      leading:useIconButton? IconButton(
        padding: const EdgeInsetsDirectional.only(start: 10),
        icon:  Icon(Icons.arrow_back_ios, color:backgroundColor==ColorStyle.pink?ColorStyle.white:ColorStyle.black,),
        onPressed: () {
          Navigator.pop(context);
        },
      ):null,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
