import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:judostore/ui/custom-views/edit-text.dart';
import 'package:judostore/ui/register/register-controller.dart';

class RegisterScreen extends StatelessWidget {
  final registerController = Get.put(RegisterController());
  final nameTxtController = TextEditingController();
  final emailTxtController = TextEditingController();
  final passwordTxtController = TextEditingController();
  final cPasswordTxtController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(top: 35.0, left: 20.0, right: 20.0),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  RichText(
                    text: TextSpan(
                        text: 'Register',
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
                  Column(
                    children: <Widget>[
                      EditText(
                          textController: nameTxtController, labelText: 'Name'),
                      SizedBox(height: 10.0),
                      EditText(
                          textController: emailTxtController,
                          labelText: 'Email'),
                      SizedBox(height: 10.0),
                      EditText(
                        textController: passwordTxtController,
                        labelText: 'Password',
                        isPassword: true,
                      ),
                      SizedBox(height: 10.0),
                      EditText(
                        textController: cPasswordTxtController,
                        labelText: 'Confirm Password',
                        isPassword: true,
                      ),
                      SizedBox(height: 50.0),
                      InkWell(
                        onTap: () {
                          final map = {
                            "name": nameTxtController.text,
                            "email": emailTxtController.text,
                            "password": passwordTxtController.text,
                            "confirmpassword": cPasswordTxtController.text,
                            "isSeller": registerController.isSellerEnabled.value
                          };
                          registerController.registerUser(map);
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
                                  'SIGNUP',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            )),
                      ),
                      SizedBox(height: 20.0),
                      Container(
                        height: 40.0,
                        color: Colors.transparent,
                        child: Container(
                          decoration: BoxDecoration(
                              border: Border.all(
                                  color: Colors.black,
                                  style: BorderStyle.solid,
                                  width: 1.0),
                              color: Colors.transparent,
                              borderRadius: BorderRadius.circular(20.0)),
                          child: InkWell(
                            onTap: () {
                              Get.back();
                            },
                            child: Center(
                              child: Text('Go Back',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                  )),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Spacer()
                ]),
          ),
        ));
  }
}
