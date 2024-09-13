import "package:flutter/material.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";
import "../../../../../riverpod.dart";

class Profile extends ConsumerStatefulWidget {
  const Profile({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<Profile> {
  @override
  Widget build(BuildContext context) {
    ref.watch(homeController);
    final controller = ref.read(homeController);
    return  Scaffold(
      body: Center(
        child: MaterialButton(
          onPressed: (){},
          shape: const StadiumBorder(
            side: BorderSide(
              color: Colors.black,
            ),
          ),
          child: const Text("Go Profile Detail"),
        ),
      ),
    );
  }
}
