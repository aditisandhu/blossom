class LoginUserModel {
  String? userId;
  String? displayName;
  String? email;

  LoginUserModel(
    {
      this.userId = 'Anonymous',
      this.displayName = "Anonymous User",
      this.email = "Anonymous@test.com",
    }
  );
}