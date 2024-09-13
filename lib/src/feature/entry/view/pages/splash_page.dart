import "dart:async";
import "package:flutter/material.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:go_router/go_router.dart";
import "package:movie_app/src/core/constants/context_extension.dart";
import "package:movie_app/src/core/storage/app_storage.dart";
import "package:movie_app/src/feature/settings/locale_controller.dart";
import "../../../../core/routes/app_route_name.dart";
import "../../../../core/widgets/app_material_context.dart";
import "../../../../core/widgets/text_widget.dart";
import "../../../settings/theme_controller.dart";

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  late final String? enterUser;

  Future<bool?> isEnterUser()async{
    enterUser = await  AppStorage.$read(key: StorageKey.enter);
    if(enterUser != null){
      return true;
    }else{
      return false;
    }
  }

  // @override
  // void didChangeDependencies()async {
  //   bool? a = await isEnterUser();
  //   Timer(const Duration(seconds: 3), (){
  //     if(a != null && a == true){
  //       context.go(AppRouteName.home);
  //     }else{
  //       context.go(AppRouteName.welcomePage);
  //     }
  //   });
  //   super.didChangeDependencies();
  // }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const CustomTextWidget("Splash", textColor: Colors.black),
             Text(
               context.localized.welcome3description,
              style: TextStyle(color: context.theme.primaryColor),
            ),
            MaterialButton(
              onPressed: () async {
                themeController.switchTheme();  // Using the shared instance
              },
              shape: const StadiumBorder(side: BorderSide(color: Colors.orangeAccent)),
              child:  Text(
                "switch them",
                style: TextStyle(color: context.theme.primaryColor),
              ),
            ),
            MaterialButton(
              onPressed: () async {
               localController.changeLocal(LangCodes.en);
              },
              shape: const StadiumBorder(side: BorderSide(color: Colors.orangeAccent)),
              child:  Text(
                "switch Lang",
                style: TextStyle(color: context.theme.primaryColor),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
