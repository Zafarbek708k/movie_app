final class ApiConst {
  const ApiConst._();

  static const Duration connectionTimeout = Duration(minutes: 1);
  static const Duration sendTimeout = Duration(minutes: 1);
  static const Duration receiveTimeout = Duration(minutes: 1);

  // Base URL for the API
  static const String baseUrl = "https://api.themoviedb.org/3";

  // Dynamic API Endpoints
  static String apiGetMovieLis = "/account/$accountId/lists";
  static String apiGetWatchListMovies = "/account/$accountId/watchlist/movies";

  // Static Endpoint (for general trending movies with pagination)
  static const String apiGetMovieWithPage = "/trending/all/day";

  // Account and API Keys
  static const String accountId = "21460780";
  static const String apiKey = "c310d0f072e64a61d4097736dfc040c6";
}

final class ApiParams {
  const ApiParams._();

  // Method to generate authorization header
  static Map<String, String> authorizationHeader() => {
        "Authorization": "Bearer ${ApiConst.apiKey}",
        "Content-Type": "application/json",
      };

  // Parameters for sending SMS verification code
  static Map<String, dynamic> cabinetSmsCheckParams({
    required String phone,
    required String code,
  }) =>
      <String, dynamic>{
        "phone": phone,
        "code": code,
      };

  // Empty parameter map when no additional parameters are needed
  static Map<String, dynamic> emptyParams() => <String, dynamic>{};

  // Query parameters for requesting a movie list with pagination
  static Map<String, dynamic> movieListParams({required int page}) => {
        "api_key": ApiConst.apiKey,
        "account_id": ApiConst.accountId,
        "page": page,
      };
}
