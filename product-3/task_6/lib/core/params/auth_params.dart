class LoginParams{
  final String email, password;

  LoginParams({required this.email, required this.password});

  Map<String, dynamic> toJson(){
    return {
      'email' : email,
      'password' : password
    };
  }

}

class SignUpParams{
  final String name, password, email;

  SignUpParams({required this.name, required this.password, required this.email});

  Map<String, dynamic>toJson(){
    return {
      "email" : email,
      "password" : password,
      "name" : name
    };
  }

}

class GetMeParams{
  final String token;

  GetMeParams({required this.token});
}