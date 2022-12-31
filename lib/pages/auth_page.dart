import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:movie2_app/pages/register_page.dart';
import 'login_page.dart';

//check if want to show login page or register page

class AuthPage extends StatefulWidget {
  const AuthPage({super.key});

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  bool isLogin=true;

  void toggle()
  {
    setState(() {
      isLogin=!isLogin;
    });
  }

  @override
  Widget build(BuildContext context) {
    return isLogin? LogIn(showRegisterPage:toggle)
    :SignUp(showLoginPage:toggle);
  }
}