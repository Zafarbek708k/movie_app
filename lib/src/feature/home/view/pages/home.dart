import "package:flutter/material.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:go_router/go_router.dart";
import "../../../../../riverpod.dart";
import "../../../../core/routes/app_route_name.dart";

class Home extends ConsumerStatefulWidget {
  const Home({ super.key});


  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<Home> {
  @override
  Widget build(BuildContext context) {
    ref.watch(homeController);
    final controller = ref.read(homeController);
    return  Scaffold(
      body: Center(
        child: MaterialButton(
          onPressed: (){
            context.go("${AppRouteName.home}/${AppRouteName.homeDetail}");
          },
          shape: const StadiumBorder(
            side: BorderSide(
              color: Colors.black,
            ),
          ),
          child: const Text("Go Home Detail"),
        ),
      ),
    );
  }
}
