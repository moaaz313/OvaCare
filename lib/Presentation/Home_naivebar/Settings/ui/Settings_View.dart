import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ovacare/Core/themes/Colors/ColorsStyle.dart';

import '../SubPages/ChangePassword/Google password/ui.dart';
import '../SubPages/ChangePassword/ui/ChangePassword_view.dart';
import '../SubPages/Edit_Profile/ui/EditProfileView.dart';
import '../SubPages/Language/ui/Language_View.dart';

class SettingsView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.grey,
      body: Padding(
        padding:  EdgeInsets.symmetric(horizontal: 20.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
             SizedBox(height:30.h),
            Row(
              children: [
                CircleAvatar(
                  radius: 40.r,
                  backgroundImage: AssetImage('assets/dohaa.jpeg'), // Replace with your image path
                ),
                 SizedBox(width: 20.w),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children:  [
                    Text(
                      'Doha Noor',
                      style: TextStyle(
                        fontSize: 20.spMin,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 5.h),
                    Text(
                      'dohanoor14@gmail.com',
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 14.spMin,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height:8.h),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 10.h),
              child: Divider(),
            ),
            const SectionHeader(title: 'Account'),
            ProfileOption(
              icon: Icons.person,
              trailingWidget: Icon(Icons.arrow_forward_ios, size:18.h, color: Colors.black),
              title: 'Edit profile',
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => edit_profile(),));
              },
            ),
            ProfileOption(
              icon: Icons.lock,
              trailingWidget: Icon(Icons.arrow_forward_ios, size:18.h, color: Colors.black),
              title: 'Change Password',
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => GooglePasswordView(),));
                // Add your navigation logic
              },
            ),
            SizedBox(height: 8.h),
            const SectionHeader(title: 'Settings'),
            ProfileOption(
              icon: Icons.language,
              trailingWidget: Icon(Icons.arrow_forward_ios, size:18.h, color: Colors.black),
              title: 'Language',
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => LanguageView(),));
              },
            ),
            ProfileOption(
              icon: Icons.notifications,
              trailingWidget: Switch(value: true, onChanged: (value){},),
              title: 'Notification',
              onTap: () {
                // Add your navigation logic
              },
            ),
            // SizedBox(height: 8.h),
            // const SectionHeader(title: 'Help & Support'),
            // ProfileOption(
            //   icon: Icons.help_center_outlined,
            //   trailingWidget: Icon(Icons.arrow_forward_ios, size:18.h, color: Colors.black),
            //   title: 'About',
            //   onTap: () {
            //     Navigator.of(context).push(MaterialPageRoute(builder: (context) => LanguageView(),));
            //   },
            // ),
            SizedBox(height: 8.h),
            const SectionHeader(title: 'Security'),
            ProfileOption(
              icon: Icons.delete,
              trailingWidget: Icon(Icons.arrow_forward_ios, size:18.h, color: Colors.black),
              title: 'Delete account',
              onTap: () {
                // Add your navigation logic
              },
            ),ProfileOption(
              icon: Icons.logout,
              trailingWidget: Icon(Icons.arrow_forward_ios, size:18.h, color: Colors.black),
              title: 'Logout',
              onTap: () {
                // Add your navigation logic
              },
            ),
             // SizedBox(height:8.h),
           Spacer(),
            // InkWell(
            //   child: Container(
            //     alignment: Alignment.center,
            //     height: 50.h,
            //     width: double.infinity,
            //     decoration: BoxDecoration(
            //       borderRadius: BorderRadius.all(Radius.circular(15.r)),
            //       color:ColorStyle.lightgray
            //     ),
            //     child: Text('Logout',style:TextStyle(fontSize: 22.spMin,fontWeight: FontWeight.bold,color: Colors.red),),
            //   ),
            // ),
            // SizedBox(height: 20.h),
          ],
        ),
      ),
    );
  }
}

class SectionHeader extends StatelessWidget {
  final String title;

  const SectionHeader({required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:EdgeInsets.symmetric(vertical: 5.h),
      child: Text(
        title,
        style:  TextStyle(
          fontWeight: FontWeight.bold,
          color: Colors.black,
          fontSize: 20.spMin,
        ),
      ),
    );
  }
}

class ProfileOption extends StatelessWidget {
  final IconData icon;
  final Widget trailingWidget;
  final String title;
  final VoidCallback onTap;

  const ProfileOption({required this.icon, required this.title, required this.onTap, required this.trailingWidget});

  @override
  Widget build(BuildContext context) {
    return Container(
      // padding: EdgeInsets.symmetric(vertical: 3.h),
      child: ListTile(
        contentPadding: EdgeInsets.zero,
        leading: Container(
            padding: EdgeInsets.all(8.h),
            decoration:BoxDecoration(
              color: ColorStyle.lightgray,
              borderRadius: BorderRadius.all(Radius.circular(10.r))
            ),
            child: Icon(icon, color: title == 'Delete account' ? Colors.red : ColorStyle.darkgray,size:25.h,)),
        title: Text(title, style: TextStyle(fontSize:18.spMin,fontWeight: FontWeight.w500)),
        trailing:  trailingWidget,
        onTap: onTap,
      ),
    );
  }
}
