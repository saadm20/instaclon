// ! this code is old
// ! have to write to new one
// !! Curretly This code Does Not Work
import 'package:instaclon/screens/auth/auth_components/custom_textfield.dart';
import 'package:instaclon/screens/auth/views/email_send_page.dart';
import 'package:instaclon/screens/components/widgets/buttons.dart';

import 'package:instaclon/screens/components/widgets/text_widgets.dart';
import 'package:instaclon/screens/components/responsive_wrapper.dart';
import 'package:instaclon/screens/constants/size.dart';
import 'package:flutter/material.dart';

class ForgotPasswordPage extends StatelessWidget {
  const ForgotPasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    //  double _height = MediaQuery.sizeOf(context).height;
    //double _width = MediaQuery.sizeOf(context).width;
    return Scaffold(body: ResponsiveWrapper(child: ForgotPasswordBody()));
  }
}

class ForgotPasswordBody extends StatelessWidget {
  const ForgotPasswordBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Image.asset('assets/images/forgot_password_icon.png',
            width: 128, height: 128),
        SizedBox(
          height: Sizes.defaultPadding * 1.5,
        ),
        const CustomText(
          text: 'Forgot Password?',
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
        SizedBox(
          height: Sizes.defaultPadding / 2,
        ),
        CustomText(
          text: 'Enter your Email Address to recive a Password reset email',
          color: Theme.of(context).textTheme.bodyLarge!.color!.withOpacity(.7),
          textAlign: TextAlign.center,
          fontSize: 12,
        ),
        SizedBox(
          height: Sizes.defaultPadding * 2,
        ),
        CustomTextField(
          controller: TextEditingController(),
          hintText: 'Email Address',
        ),
        SizedBox(
          height: Sizes.defaultPadding * 4,
        ),
        CustomElevatedButton(
          onPressed: () {
            Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => EmailSendPage()),
                (route) => false);
          },
          child: Text(
            "Send Email",
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }
}
