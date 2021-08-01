import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:judostore/storage/data-preferences.dart';
import 'package:judostore/ui/custom-views/edit-text.dart';
import 'package:judostore/ui/login/login-controller.dart';
import 'package:judostore/ui/register/regsiter-screen.dart';
import 'package:judostore/utils/ui-helper.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final LoginController loginController = Get.put(LoginController());

  final TextEditingController emailController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();
  final dataPreference = Get.find<DataPreferences>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: SafeArea(
            child: Padding(
          padding: EdgeInsets.only(top: 35.0, left: 20.0, right: 20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              RichText(
                text: TextSpan(
                    text: 'Judo\nStore',
                    style: TextStyle(
                        fontSize: Get.height * 0.1,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                    children: [
                      TextSpan(
                        text: '.',
                        style: TextStyle(
                            fontSize: Get.height * 0.1,
                            color: Colors.green,
                            fontWeight: FontWeight.bold),
                      )
                    ]),
              ),
              SizedBox(
                height: Get.height * 0.05,
              ),
              Column(children: [
                EditText(
                  textController: emailController,
                  labelText: 'Email',
                ),
                SizedBox(height: 20.0),
                EditText(
                  textController: passwordController,
                  isPassword: true,
                  labelText: 'Password',
                ),
                SizedBox(height: 5.0),
                Container(
                  alignment: Alignment(1.0, 0.0),
                  padding: EdgeInsets.only(top: 15.0, left: 20.0),
                  child: InkWell(
                    child: Text(
                      'Forgot Password',
                      style: TextStyle(
                          color: Colors.green,
                          fontWeight: FontWeight.bold,
                          decoration: TextDecoration.underline),
                    ),
                  ),
                ),
                SizedBox(height: 40.0),
                InkWell(
                  onTap: () {
                    Map<String, dynamic> body = {
                      "email": emailController.text,
                      "password": passwordController.text
                    };
                    loginController.verifyLogin(body);
                  },
                  child: Container(
                    height: 40.0,
                    child: Material(
                      borderRadius: BorderRadius.circular(20.0),
                      shadowColor: Colors.greenAccent,
                      color: Colors.green,
                      elevation: 7.0,
                      child: Center(
                        child: Text(
                          'LOGIN',
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 15.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'New to JudoStore ?',
                      style: TextStyle(),
                    ),
                    SizedBox(width: 5.0),
                    InkWell(
                      onTap: () {
                        var dataPreferences = Get.find<DataPreferences>();
                        print(dataPreferences
                            .readPreference(dataPreferences.kUserKey));
                        Get.to(() => RegisterScreen());
                      },
                      child: Text(
                        'Register',
                        style: TextStyle(
                            color: Colors.green,
                            fontWeight: FontWeight.bold,
                            decoration: TextDecoration.underline),
                      ),
                    )
                  ],
                )
              ]),
              Spacer(),
              Align(
                  alignment: Alignment.centerRight,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: GestureDetector(
                      onTap: () {
                        final text = dataPreference
                            .readPreference(dataPreference.kIpAddressKey);
                        final ipAddressController = TextEditingController(
                            text: text == null ? "" : text);
                        showMyDialog(
                            view: Column(
                              mainAxisSize: MainAxisSize.min,
                          children: [
                            Align(
                              alignment: Alignment.topRight,
                              child: GestureDetector(
                                  onTap: (){
                                    Get.back();
                                  },
                                  child: Icon(Icons.close)),
                            ),
                            EditText(
                              textController: ipAddressController,
                              labelText: 'IP Address',
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            ElevatedButton(
                                onPressed: () {
                                  dataPreference.savePreference(
                                      dataPreference.kIpAddressKey,
                                      ipAddressController.text);
                                  Get.back();
                                },
                                child: Text('Save'))
                          ],
                        ));
                      },
                      child: Icon(
                        Icons.dns,
                        color: Colors.black,
                      ),
                    ),
                  ))
            ],
          ),
        )));
  }
}
