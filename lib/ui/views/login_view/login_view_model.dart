import 'package:cupertino_stackview/misc.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_book_reloaded/app/locator.dart';
import 'package:my_book_reloaded/app/router.gr.dart';
import 'package:my_book_reloaded/core/services/auth/auth_service.dart';
import 'package:my_book_reloaded/core/services/auth/facebook_auth.dart';
import 'package:my_book_reloaded/core/services/auth/google_auth.dart';
import 'package:my_book_reloaded/core/services/navigation/navigation_service.dart';
import 'package:stacked/stacked.dart';

class LoginViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();
  final _authService = locator<AuthService>();

  BuildContext _context;

  final TextEditingController emailController = new TextEditingController();
  final TextEditingController passwordController = new TextEditingController();

  void init(BuildContext context) {
    _context = context;
    cupertinoStackViewController.initialise(
        MediaQuery.of(context).size.height, MediaQuery.of(context).size.width);
  }

  openForgotPassword() async {
    cupertinoStackViewController.navigate("ForgotPassword", _context, null);
  }

  void openMainView() {
    _navigationService.pushNamedAndRemoveUntil(Routes.MainView,
        predicate: (route) => false);
  }

  void loginInWithGoogle() async {
   // await GoogleAuth().signIn();
    openMainView();
  }

  void loginInWithFaceBook() async {
    //await FacebookAuth().signIn();
    openMainView();
  }

  void login() async {
    openMainView();
   /* String email = emailController.text;
    String password = passwordController.text;
    if(email.isNotEmpty && password.isNotEmpty){
      final res = await _authService.login(email, password);
    } else {
      Get.log("Email or Password is empty", isError: true);
    }*/

  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }
}
