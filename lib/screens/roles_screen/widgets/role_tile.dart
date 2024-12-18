import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:foodlink/controllers/user_types.dart';
import 'package:foodlink/core/constants/fonts.dart';
import 'package:foodlink/models/user_details.dart';
import 'package:foodlink/providers/general_provider.dart';
import 'package:foodlink/providers/users_provider.dart';
import 'package:foodlink/screens/splash_screen/splash_screen.dart';
import 'package:get/get.dart';

import '../../../core/constants/colors.dart';
import '../../../core/utils/size_config.dart';

class RoleTile extends StatelessWidget {
  const RoleTile(
      {super.key,
      required this.imageUrl,
      required this.role,
      required this.user});

  final String imageUrl;
  final String role;
  final User user;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.symmetric(vertical: SizeConfig.getProportionalWidth(20)),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          width: SizeConfig.getProportionalHeight(269),
          height: SizeConfig.getProportionalWidth(70),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(40),
              border:
                  Border.all(width: 1.0, color: AppColors.textFieldBorderColor),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  blurRadius: 1,
                  offset: const Offset(0, 4),
                ),
              ],
              color: AppColors.backgroundColor),
          child: Row(
            mainAxisAlignment: GeneralProvider().language == "en"
                ? MainAxisAlignment.start
                : MainAxisAlignment.end,
            children: [
              if (GeneralProvider().language == "en") ...[
                Container(
                    height: SizeConfig.getProportionalHeight(54),
                    width: SizeConfig.getProportionalWidth(54),
                    margin: EdgeInsets.symmetric(
                        horizontal: SizeConfig.getProportionalWidth(20)),
                    child: Image.asset(imageUrl)),
                SizedBox(width: SizeConfig.getProportionalWidth(15)),
                Text(
                  role,
                  style: TextStyle(
                      fontSize: 25,
                      fontFamily: AppFonts.primaryFont,
                      fontWeight: FontWeight.bold),
                )
              ] else ...[
                Text(
                  role,
                  style: TextStyle(
                      fontSize: 25,
                      fontFamily: AppFonts.primaryFont,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(width: SizeConfig.getProportionalWidth(15)),
                Container(
                    height: SizeConfig.getProportionalHeight(54),
                    width: SizeConfig.getProportionalWidth(54),
                    margin: EdgeInsets.symmetric(
                        horizontal: SizeConfig.getProportionalWidth(20)),
                    child: Image.asset(imageUrl)),
              ]
            ],
          ),
        ),
      ),
    );
  }

  void onTap() async{
    int roleId =  role == "cooker" ? UserTypes.cooker : UserTypes.user;
    GeneralProvider().selectedUser =await UsersProvider().getUserByRoleAndId(user.uid!, roleId);
        // UserDetails(
        // userId: user.uid!,
        // email: user.email!,
        // userTypeId: role == "cooker" ? UserTypes.cooker : UserTypes.user,
        // username: user.displayName!);
    print(GeneralProvider().selectedUser);
    Get.to(const SplashScreen());
  }
}
