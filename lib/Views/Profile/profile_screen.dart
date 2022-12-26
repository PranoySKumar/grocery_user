import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grocery_user/Routes/route_helper.dart';
import 'package:grocery_user/Views/Dashboard/HomeScreen/home_controller.dart';
import 'package:grocery_user/Views/Profile/profile_controller.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () => Get.back(),
          child: Container(
            width: 20,
            height: 30,
            margin: const EdgeInsets.only(right: 15),
            child: const Icon(
              Icons.arrow_back_ios_rounded,
              size: 18,
              color: Colors.black,
            ),
          ),
        ),
        backgroundColor: Get.theme.scaffoldBackgroundColor,
        elevation: 0,
      ),
      body: Stack(
        children: [
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 16),
            child: ListView(
              children: [
                _ProfileImage(),
                const SizedBox(
                  height: 20,
                ),
                _ProfileList()
              ],
            ),
          ),
          Positioned(
            bottom: 20,
            left: 100,
            right: 100,
            child: Container(
              height: 5,
              width: 120,
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(10), color: Colors.grey),
            ),
          )
        ],
      ),
    );
  }
}

class _ProfileList extends StatelessWidget {
  _ProfileList({
    Key? key,
  }) : super(key: key);

  final _profileController = Get.find<ProfileController>();
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _ProfileListItem(
          iconData: Icons.list_alt_rounded,
          onTap: () {
            Get.toNamed(RouteHelper.orderListScreen);
          },
          label: "Orders",
        ),
        const SizedBox(
          height: 4,
        ),
        _ProfileListItem(
          iconData: Icons.privacy_tip_outlined,
          onTap: _profileController.navigateToPrivacyPolicyWebPage,
          label: "Privacy Policy",
        ),
        const SizedBox(height: 4),
        _ProfileListItem(
          iconData: Icons.logout_outlined,
          onTap: _profileController.logout,
          label: "Log out",
        ),
      ],
    );
  }
}

class _ProfileImage extends StatelessWidget {
  _ProfileImage({
    Key? key,
  }) : super(key: key);
  final _homescreenController = Get.find<HomeScreenController>();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          width: 70,
          height: 70,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.black, width: 2),
            borderRadius: BorderRadius.circular(50),
          ),
          child: const Icon(
            Icons.person,
            size: 30,
          ),
        ),
        const SizedBox(
          height: 2,
        ),
        Text(
          _homescreenController.user.value.userName!,
          style: Get.textTheme.labelMedium,
        ),
        const SizedBox(height: 30),
        Container(
          width: 120,
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20), color: Get.theme.highlightColor),
          child: Center(
            child: Text(
              "Edit Profile",
              style: Get.textTheme.labelSmall?.copyWith(color: Colors.white),
            ),
          ),
        )
      ],
    );
  }
}

class _ProfileListItem extends StatelessWidget {
  final IconData iconData;
  final VoidCallback onTap;
  final String label;

  const _ProfileListItem({required this.iconData, required this.onTap, required this.label});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 40,
        padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 3),
        width: double.infinity,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Icon(
                  iconData,
                  size: 18,
                ),
                const SizedBox(
                  width: 10,
                ),
                Text(
                  label,
                  style: Get.textTheme.labelMedium?.copyWith(
                    fontSize: 12,
                  ),
                )
              ],
            ),
            const Icon(
              Icons.arrow_forward_ios_rounded,
              size: 18,
            )
          ],
        ),
      ),
    );
  }
}
