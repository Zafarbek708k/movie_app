import "package:flutter/material.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:flutter_screenutil/flutter_screenutil.dart";
import "package:go_router/go_router.dart";
import "package:movie_app/src/core/constants/context_extension.dart";
import "package:movie_app/src/core/server/api/api.dart";
import "package:movie_app/src/core/server/api/api_constants.dart";
import "../../../../../riverpod.dart";
import "../../../../core/routes/app_route_name.dart";
import "../../../../core/widgets/text_widget.dart";

class Home extends ConsumerStatefulWidget {
  const Home({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<Home> {
  String? data;

  Future<void> getData() async {
    data = await ApiService.get(ApiConst.apiGetMovieLis, ApiParams.movieListParams(page: 1));
  }

  @override
  void initState() {
    getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    ref.watch(homePageController);
    final controller = ref.read(homePageController);
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: REdgeInsets.symmetric(horizontal: 18.0, vertical: 35),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              CustomTextWidget("Stories", textColor: context.appTheme.secondary, fontSize: 24),
              SizedBox(
                height: 75,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 15,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          height: 50.h,
                          width: 60.h,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(150),
                            gradient: const LinearGradient(
                              colors: [Colors.deepOrange, Colors.red, Colors.deepPurple],
                            ),
                          ),
                          child: Container(
                            margin: const EdgeInsets.all(4), // Adjust this value to set border thickness
                            decoration: BoxDecoration(
                              color: Colors.white, // Background color of the inner container
                              borderRadius: BorderRadius.circular(150),
                            ),
                          ),
                        ),

                      );
                    }),
              ),
              CustomTextWidget("Movies", textColor: context.appTheme.secondary, fontSize: 24),
              CustomTextWidget("Genres", textColor: context.appTheme.secondary, fontSize: 24),
              CustomTextWidget("Serial", textColor: context.appTheme.secondary, fontSize: 24),
              CustomTextWidget("Indian movies", textColor: context.appTheme.secondary, fontSize: 24),
              CustomTextWidget("Turkish movies", textColor: context.appTheme.secondary, fontSize: 24),
            ],
          ),
        ),
      ),
    );
  }
}
