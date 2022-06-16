import 'package:donation_app/core/view_model/auth_viewmodel.dart';
import 'package:donation_app/view/profile/edit_profile_view.dart';
import 'package:donation_app/view/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../core/view_model/profile_viewmodel.dart';

class ProfileView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<ProfileViewModel>(
        init: ProfileViewModel(),
        builder: (controller) => controller.loading == true
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.only(top: 58.h, right: 16.w, left: 16.w),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        children: [
                          CircleAvatar(
                            radius: 60.h,
                            backgroundImage: const AssetImage(
                                'assets/images/profile_pic.png'),
                            foregroundImage:
                                controller.currentUser!.pic != 'default'
                                    ? NetworkImage(controller.currentUser!.pic)
                                    : null,
                          ),
                          SizedBox(
                            width: 30.w,
                          ),
                          Column(
                            children: [
                              CustomText(
                                text: controller.currentUser!.name,
                                fontSize: 26,
                              ),
                              SizedBox(
                                height: 6.h,
                              ),
                              CustomText(
                                text: controller.currentUser!.email,
                                fontSize: 14,
                              ),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 100.h,
                      ),
                      CustomListTile(
                        iconName: '1',
                        title: 'Edit Profile',
                        onTapFn: () {
                          Get.to(EditProfileView());
                        },
                      ),
                      CustomListTile(
                        iconName: '2',
                        title: 'Messages',
                        onTapFn: () {
                          // Get.to(EditProfileView());
                        },
                      ),
                      CustomListTile(
                        iconName: '6',
                        title: 'Log Out',
                        onTapFn: () {
                          Get.find<AuthViewModel>().signOut();
                        },
                      ),
                    ],
                  ),
                ),
              ),
      ),
    );
  }
}

class CustomListTile extends StatelessWidget {
  final String iconName;
  final String title;
  final VoidCallback onTapFn;

  const CustomListTile({
    required this.iconName,
    required this.title,
    required this.onTapFn,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          onTap: onTapFn,
          leading: Image.asset(
            'assets/images/icons/menu_icons/$iconName.png',
            height: 40.h,
            width: 40.h,
          ),
          title: CustomText(
            text: title,
            fontSize: 18,
          ),
          trailing: title == 'Log Out'
              ? null
              : const Icon(
                  Icons.navigate_next,
                  color: Colors.black,
                ),
        ),
        SizedBox(
          height: 20.h,
        ),
      ],
    );
  }
}
