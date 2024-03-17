bool validateEmail(String email){
  return email.contains('@') && email.contains('.com');
}

bool validatePassword(String password){
  return password.length > 7;
}