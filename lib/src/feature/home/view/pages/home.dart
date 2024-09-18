import "dart:convert";
import "dart:developer";
import "package:flutter/material.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:flutter_screenutil/flutter_screenutil.dart";
import "package:movie_app/src/core/constants/context_extension.dart";
import "package:movie_app/src/core/server/api/api.dart";
import "package:movie_app/src/core/server/api/api_constants.dart";
import "package:movie_app/src/data/entity/movie_model.dart";
import "../../../../../riverpod.dart";
import "../../../../core/widgets/text_widget.dart";
import "../../../../data/entity/model_2.dart";

class Home extends ConsumerStatefulWidget {
  const Home({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<Home> {
  bool isLoading = false;
  String? data;
  MovieModel? model3;
  MovieModel2? model2;

  Future<void> getData() async {
    setState(() {
      isLoading = true; // Set loading state to true when fetching data
    });

    try {
      // Fetch data using the ApiService
      final response = await ApiService.get(ApiConst.apiPopular, ApiConst.param);
      log("home response == $response");

      // Ensure response is valid and correctly typed
      if (response != null && response is Map<String, dynamic>) {
        // Parse the response directly from Map to MovieModel2
        model2 = movieModel2FromJson(jsonEncode(response));  // Convert Map to JSON string before parsing
        log("response ==== $response");
        log("movieModel2 ==== ${model2?.toJson()}");  // Ensure model2 is not null

        setState(() {
          data = jsonEncode(response); // Convert to string for storage
        });
      } else {
        log("Invalid response");
      }
    } catch (e) {
      log("Error: $e");
    } finally {
      setState(() {
        isLoading = false; // Set loading state to false after fetching
      });
    }
  }


  @override
  void initState() {
    super.initState();
    getData();
  }
  @override
  Widget build(BuildContext context) {
    ref.watch(homePageController);
    final controller = ref.read(homePageController);
    return Scaffold(
      body:  isLoading // Show loading indicator while fetching data
          ? const Center(child: CircularProgressIndicator())
          :SingleChildScrollView(
        child: Padding(
          padding: REdgeInsets.symmetric(horizontal: 18.0, vertical: 35),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              CustomTextWidget("Stories", textColor: context.appTheme.secondary, fontSize: 24),
              SizedBox(
                height: 150,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: model2?.results?.length ?? 0, // Use the length from model2 safely
                  itemBuilder: (context, index) {
                    log("length ${model2?.results?.length }");
                    final movie = model2!.results![index]; // Use Result type
                    log(movie.backdropPath!);
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        height: 80.h,
                        width: 100.h,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          gradient: const LinearGradient(
                            colors: [Colors.deepOrange, Colors.red, Colors.deepPurple],
                          ),
                        ),
                        child: Container(
                          margin: const EdgeInsets.all(2),
                          decoration: BoxDecoration(
                            color: context.appTheme.primary, // Background color of the inner container
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Container(
                                height: 60, // Set the height of the container
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15), // Set a border radius of 15
                                  image: DecorationImage(
                                    image: NetworkImage(
                                      movie.backdropPath != null && movie.backdropPath!.isNotEmpty
                                          ? "https://image.tmdb.org/t/p/w500${movie.backdropPath}"
                                          : "https://i0.wp.com/sigmamaleimage.com/wp-content/uploads/2023/03/placeholder-1-1.png?resize=300%2C200&ssl=1",
                                    ),
                                    fit: BoxFit.cover, // Adjust the image fitting
                                  ),
                                ),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(15), // Clip the container to have rounded corners
                                  child: Image.network(
                                    movie.backdropPath != null && movie.backdropPath!.isNotEmpty
                                        ? "https://image.tmdb.org/t/p/w500${movie.backdropPath}"
                                        : "https://i0.wp.com/sigmamaleimage.com/wp-content/uploads/2023/03/placeholder-1-1.png?resize=300%2C200&ssl=1",
                                    fit: BoxFit.cover,
                                    errorBuilder: (context, error, stackTrace) {
                                      return Container(
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(15), // Same border radius
                                          image: const DecorationImage(
                                            image: NetworkImage(
                                              "https://i0.wp.com/sigmamaleimage.com/wp-content/uploads/2023/03/placeholder-1-1.png?resize=300%2C200&ssl=1",
                                            ),
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                                ),
                              ),



                              CustomTextWidget("${movie.originalTitle}", textColor: context.appTheme.secondary, fontSize: 12), // Ensure this matches
                              // your Result class properties
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
              CustomTextWidget("Movies", textColor: context.appTheme.secondary, fontSize: 24),
              MaterialButton(
                onPressed: () async {
                  await getData();
                },
                shape: const StadiumBorder(
                  side: BorderSide(color: Colors.deepOrange),
                ),
                child: const Text("Press"),
              ),
              CustomTextWidget("Genres", textColor: context.appTheme.secondary, fontSize: 24),
              CustomTextWidget("Serial", textColor: context.appTheme.secondary, fontSize: 24),
              CustomTextWidget("Indian movies", textColor: context.appTheme.secondary, fontSize: 24),
              CustomTextWidget("Turkish movies", textColor: context.appTheme.secondary, fontSize: 24),
              CustomTextWidget("Stories", textColor: context.appTheme.secondary, fontSize: 24),
              SizedBox(
                height: 75,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: model2?.results?.length ?? 0,
                    itemBuilder: (context, index) {
                      log("length ${model2?.results?.length }");
                      final movie = model2!.results![index]; // Use Result type
                      log(movie.backdropPath!);
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
                          child:   Container(
                            height: 45,
                            margin: EdgeInsets.all(4),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(150), // Set a border radius of 15
                              image: DecorationImage(
                                image: NetworkImage(
                                  movie.backdropPath != null && movie.backdropPath!.isNotEmpty
                                      ? "https://image.tmdb.org/t/p/w500${movie.backdropPath}"
                                      : "https://i0.wp.com/sigmamaleimage.com/wp-content/uploads/2023/03/placeholder-1-1.png?resize=300%2C200&ssl=1",
                                ),
                                fit: BoxFit.cover, // Adjust the image fitting
                              ),
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(150), // Clip the container to have rounded corners
                              child: Image.network(
                                movie.backdropPath != null && movie.backdropPath!.isNotEmpty
                                    ? "https://image.tmdb.org/t/p/w500${movie.backdropPath}"
                                    : "https://i0.wp.com/sigmamaleimage.com/wp-content/uploads/2023/03/placeholder-1-1.png?resize=300%2C200&ssl=1",
                                fit: BoxFit.cover,
                                errorBuilder: (context, error, stackTrace) {
                                  return Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15), // Same border radius
                                      image: const DecorationImage(
                                        image: NetworkImage(
                                          "https://i0.wp.com/sigmamaleimage.com/wp-content/uploads/2023/03/placeholder-1-1.png?resize=300%2C200&ssl=1",
                                        ),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),
                          ),
                        ),
                      );
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
