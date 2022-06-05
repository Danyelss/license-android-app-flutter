class DataEndpoints {
  DataEndpoints._();

  // base url

  static const String baseUrl = "https://license-crypto-bank.herokuapp.com/api";

  // receiveTimeout
  static const int receiveTimeout = 15000;

  // connectTimeout
  static const int connectionTimeout = 30000;

  // booking endpoints
  static const String withdraw = baseUrl + "/withdraw";
  static const String deposit = baseUrl + "/deposit";
  static const String balance = baseUrl + "/balance";
  static const String register = baseUrl + "/register";
  static const String login = baseUrl + "/login";
}
