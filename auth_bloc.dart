import 'dart:async';

void main() {
  
  final AuthBloc bloc = AuthBloc();
//   bloc.emailController.close();
  bloc.addEmail("you@example.com");
  bloc.emailStream.listen(
    (data){
      print("Email is $data");
    }
  );
}

class AuthBloc {
  final StreamController<String> _emailController = StreamController();
  final StreamController<String> passwordController = StreamController();
  final StreamController<String> genderController = StreamController();

  Function(String val) get addEmail => _emailController.sink.add;
  
  Stream<String> get emailStream => _emailController.stream;
  
  void dispose() {
    _emailController.close();
    passwordController.close();
    genderController.close();
  }
}