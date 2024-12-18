import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:foodlink/providers/general_provider.dart';
import 'package:foodlink/screens/roles_screen/widgets/role_tile.dart';

import '../../core/constants/assets.dart';
import '../../core/constants/colors.dart';
import '../../core/constants/fonts.dart';
import '../../core/utils/size_config.dart';
import '../../services/translation_services.dart';

class RolesScreen extends StatelessWidget {
  const RolesScreen({super.key, required this.user});

  final User user;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.backgroundColor,
        body: Center(
          child: Padding(
              padding: EdgeInsets.symmetric(
                  vertical: SizeConfig.getProportionalWidth(70),
                  horizontal: SizeConfig.getProportionalWidth(10)),
              child: Column(children: [
                SizedBox(
                    height: SizeConfig.getProportionalHeight(179),
                    width: SizeConfig.getProportionalWidth(179),
                    child: Image.asset(Assets.pureLogo)),
                SizedBox(
                  height: SizeConfig.getProportionalHeight(70),
                ),
                Padding(
                  padding: EdgeInsets.only(
                      top: SizeConfig.getProportionalHeight(10),
                      bottom: SizeConfig.getProportionalHeight(13),
                      left: SizeConfig.getProportionalWidth(70),
                      right: SizeConfig.getProportionalWidth(70)),
                  child: Align(
                    alignment: GeneralProvider().language == "en"
                        ? Alignment.centerLeft
                        : Alignment.centerRight,
                    child: Text(
                      TranslationService().translate("choose_role"),
                      textDirection: GeneralProvider().language == "en"
                          ? TextDirection.ltr
                          : TextDirection.rtl,
                      textAlign: GeneralProvider().language == "en"
                          ? TextAlign.left
                          : TextAlign.right,
                      style: TextStyle(
                          fontFamily: AppFonts.primaryFont,
                          fontSize:
                              GeneralProvider().language == "en" ? 25 : 30,
                          color: AppColors.fontColor,
                          fontWeight: FontWeight.bold),
                      softWrap: false,
                    ),
                  ),
                ),
                RoleTile(
                    imageUrl: Assets.user,
                    role: TranslationService().translate("user"),
                    user: user),
                RoleTile(
                    imageUrl: Assets.cooker,
                    role: TranslationService().translate("cooker"),
                    user: user)
              ])),
        ));
  }
}
