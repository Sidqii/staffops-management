class ApiConfig {
  static const String defaultUrl = 'https://your-api-url.com';

  static String _url = defaultUrl;

  static String get baseUrl => _url;

  static void setUrl(String newUrl) {
    _url = newUrl;
  }
}
