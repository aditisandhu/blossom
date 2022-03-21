class LoginUserModel {
  String? displayName;
  String? email;

  LoginUserModel(
    {
      this.displayName = "Anonymous User",
      this.email = "Anonymous@test.com",
    }
  );
}