import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_todo_c10_online/auth/custom_text_form_field.dart';
import 'package:flutter_app_todo_c10_online/auth/login/login_screen.dart';
import 'package:flutter_app_todo_c10_online/diaolg_utils.dart';
import 'package:flutter_app_todo_c10_online/home/home_screen.dart';
import 'package:flutter_app_todo_c10_online/my_theme.dart';

class RegisterScreen extends StatefulWidget {
  static const String routeName = 'register_screen';

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  TextEditingController nameController = TextEditingController(text: 'Amira');

  TextEditingController emailController =
      TextEditingController(text: 'amira@route.com');

  TextEditingController passwordController =
      TextEditingController(text: '123456');

  TextEditingController confirmPasswordController =
      TextEditingController(text: '123456');

  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
            color: MyTheme.backgroundColor,
            child: Image.asset(
              'assets/images/main_background.png',
              width: double.infinity,
              height: double.infinity,
              fit: BoxFit.fill,
            )),
        Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            title: Text(
              'Creat Account',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            centerTitle: true,
            backgroundColor: Colors.transparent,
          ),
          body: SingleChildScrollView(
            child: Column(
              children: [
                Form(
                    key: formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.25,
                        ),
                        CustomTextFormField(
                          label: 'User Name',
                          controller: nameController,
                          validator: (text) {
                            if (text == null || text.isEmpty) {
                              return 'Please enter user Name';
                            }
                            return null;
                          },
                        ),
                        CustomTextFormField(
                          label: 'Email',
                          keyboardType: TextInputType.emailAddress,
                          controller: emailController,
                          validator: (text) {
                            if (text == null || text.isEmpty) {
                              return 'Please enter email';
                            }
                            bool emailValid = RegExp(
                                    r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                .hasMatch(emailController.text);
                            if (!emailValid) {
                              return 'Please enter valid email';
                            }
                            return null;
                          },
                        ),
                        CustomTextFormField(
                          label: 'Password',
                          keyboardType: TextInputType.number,
                          controller: passwordController,
                          validator: (text) {
                            if (text == null || text.isEmpty) {
                              return 'Please enter Password';
                            }
                            if (text.length < 6) {
                              return 'Password should be at least 6 chars.';
                            }
                            return null;
                          },
                        ),
                        CustomTextFormField(
                          label: 'Confirm Password',
                          keyboardType: TextInputType.number,
                          controller: confirmPasswordController,
                          validator: (text) {
                            if (text == null || text.isEmpty) {
                              return 'Please enter Confirm Password';
                            }
                            if (text != passwordController.text) {
                              return "Confirm Password doesn't match Password";
                            }
                            return null;
                          },
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ElevatedButton(
                              onPressed: () {
                                register();
                              },
                              child: Text(
                                'Create Account',
                                style: Theme.of(context).textTheme.titleLarge,
                              )),
                        ),
                        TextButton(
                            onPressed: () {
                              Navigator.pushNamed(
                                  context, LoginScreen.routeName);
                            },
                            child: Text('Already have an account'))
                      ],
                    ))
              ],
            ),
          ),
        )
      ],
    );
  }

  void register() async {
    if (formKey.currentState?.validate() == true) {
      /// register
      try {
        // todo: show loading
        DialogUtils.showLoading(context: context, message: 'Loading...');
        final credential =
            await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: emailController.text,
          password: passwordController.text,
        );
        // todo: hide loading
        DialogUtils.hideLoading(context);
        // todo: show message
        DialogUtils.showMessage(
            context: context,
            message: 'Register Succssfully',
            title: 'Success',
            posActionName: 'OK',
            posAction: () {
              Navigator.pushNamed(context, HomeScreen.routeName);
            });
        print('register scuccessfully');
        print(credential.user?.uid ?? "");
      } on FirebaseAuthException catch (e) {
        if (e.code == 'weak-password') {
          // todo: hide loading
          DialogUtils.hideLoading(context);
          // todo: show message
          DialogUtils.showMessage(
              context: context,
              message: 'The password provided is too weak.',
              title: 'Error',
              posActionName: 'OK');
          print('The password provided is too weak.');
        } else if (e.code == 'email-already-in-use') {
          // todo: hide loading
          DialogUtils.hideLoading(context);
          // todo: show message
          DialogUtils.showMessage(
              context: context,
              message: 'The account already exists for that email.',
              title: 'Error',
              posActionName: 'OK');
          print('The account already exists for that email.');
        }
      } catch (e) {
        // todo: hide loading
        DialogUtils.hideLoading(context);
        // todo: show message
        DialogUtils.showMessage(
            context: context,
            message: '${e.toString()}',
            title: 'Error',
            posActionName: 'OK');
        print(e);
      }
    }
  }
}
