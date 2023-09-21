import 'package:flutter/material.dart';
import 'package:idukaan/controller/user/user_ctrl.dart';
import 'package:idukaan/model/user/util/user_icon.dart';
import 'package:idukaan/model/user/util/user_texts.dart';
import 'package:idukaan/view/util/app_bar.dart';
import 'package:idukaan/view/util/margins.dart';
import 'package:idukaan/view/widgets/buttons/elevated_button_widget.dart';
import 'package:idukaan/view/widgets/fields/text_form_field_widget.dart';
import 'package:provider/provider.dart';

class UserSignup3Screen extends StatelessWidget {
  const UserSignup3Screen({super.key});

  @override
  Widget build(BuildContext context) {
    final userSignup2Key = GlobalKey<FormState>();
    return Consumer<UserCtrl>(
      builder: (context, ctrl, _) {
        return Scaffold(
          appBar: appBar(
            context: context,
            title: UserSignupText.appBarTitle,
          ),
          body: SingleChildScrollView(
            child: Form(
              key: userSignup2Key,
              child: Container(
                margin: screenMargin(context),
                child: Column(
                  children: [
                    const ListTile(
                      title: Text(UserSignupText.title3),
                      subtitle: Text(UserSignupText.desc3),
                    ),
                    const Divider(),
                    TextFormFieldWidget(
                      prefixIcon: UserIcon.username.icon,
                      keyboardType: TextInputType.name,
                      labelText: 'Username',
                      onFieldSubmitted: ctrl.userSignUpReq.setUsername,
                    ),
                    TextFormFieldWidget(
                      prefixIcon: UserIcon.pwd.icon,
                      obscureText: true,
                      keyboardType: TextInputType.visiblePassword,
                      labelText: 'Password',
                      onFieldSubmitted: ctrl.userSignUpReq.setPwd,
                    ),
                    ElevatedButtonWidget(
                      title: 'Next',
                      onPressed: () {
                        if (userSignup2Key.currentState!.validate()) {
                          print(ctrl.userSignUpReq.getFirstName);
                          print(ctrl.userSignUpReq.getLastName);
                          print(ctrl.userSignUpReq.getContactNo);
                          print(ctrl.userSignUpReq.getEmail);
                          print(ctrl.userSignUpReq.getUsername);
                          print(ctrl.userSignUpReq.getPwd);
                        }
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
