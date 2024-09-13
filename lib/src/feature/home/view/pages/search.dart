import "package:flutter/material.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:go_router/go_router.dart";
import "../../../../../riverpod.dart";
import "../../../../core/routes/app_route_name.dart";

class Search extends ConsumerStatefulWidget {
  const Search({ super.key});


  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<Search> {
  @override
  Widget build(BuildContext context) {
    ref.watch(homeController);
    final controller = ref.read(homeController);
    return  Scaffold(
      body: Center(
        child: MaterialButton(
          onPressed: (){
            context.go("${AppRouteName.search}/${AppRouteName.searchDetail}");
          },
          shape: const StadiumBorder(
            side: BorderSide(
              color: Colors.black,
            ),
          ),
          child: const Text("Go Search Detail"),
        ),
      ),
    );
  }
}
