abstract class IAuthRepository {
  Future getUser();
  Future getEmailPasswordLogin();
  Future<String> getToken();
}