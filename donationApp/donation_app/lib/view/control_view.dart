import 'package:donation_app/view/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../core/network_viewmodel.dart';
import '../core/view_model/auth_viewmodel.dart';
import '../core/view_model/control_viewmodel.dart';
import 'auth/login_view.dart';

class ControlView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Get.find<AuthViewModel>().user == null
          ? LoginView()
          : Get.find<NetworkViewModel>().connectionStatus.value == 1 ||
                  Get.find<NetworkViewModel>().connectionStatus.value == 2
              ? GetBuilder<ControlViewModel>(
                  init: ControlViewModel(),
                  builder: (controller) => Scaffold(
                    body: controller.currentScreen,
                    bottomNavigationBar: CustomBottomNavigationBar(),
                  ),
                )
              : NoInternetConnection();
    });
  }
}

class CustomBottomNavigationBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 84.h,
      child: GetBuilder<ControlViewModel>(
        builder: (controller) => BottomNavigationBar(
          showSelectedLabels: false,
          showUnselectedLabels: false,
          elevation: 0,
          backgroundColor: Colors.grey.shade100,
          currentIndex: controller.navigatorIndex,
          onTap: (index) {
            controller.changeCurrentScreen(index);
          },
          items: [
            BottomNavigationBarItem(
              label: '',
              icon: Image.asset(
                'assets/images/icons/explore.png',
                fit: BoxFit.contain,
                height: 20.h,
                width: 20.h,
              ),
              activeIcon: CustomText(
                text: 'Explore',
                fontSize: 14,
                alignment: Alignment.center,
              ),
            ),
            BottomNavigationBarItem(
              label: '',
              icon: Image.asset(
                'assets/images/icons/magnifying-glass.png',
                fit: BoxFit.contain,
                height: 20.h,
                width: 20.h,
              ),
              activeIcon: CustomText(
                text: 'Search',
                fontSize: 14,
                alignment: Alignment.center,
              ),
            ),
            BottomNavigationBarItem(
              label: '',
              icon: Image.asset(
                'assets/images/icons/account.png',
                fit: BoxFit.contain,
                height: 20.h,
                width: 20.h,
              ),
              activeIcon: CustomText(
                text: 'Account',
                fontSize: 14,
                alignment: Alignment.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class NoInternetConnection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const CircularProgressIndicator(),
            SizedBox(
              height: 30.h,
            ),
            CustomText(
              text: 'Please check your internet connection..',
              fontSize: 14,
              alignment: Alignment.center,
            ),
          ],
        ),
      ),
    );
  }
}
