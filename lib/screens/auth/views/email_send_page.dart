// ! this code is old
// ! have to write to new one
// !! Curretly This code Does Not Work
import 'package:instaclon/screens/components/widgets/buttons.dart';
import 'package:instaclon/screens/components/widgets/icon_container.dart';
import 'package:instaclon/screens/components/widgets/text_widgets.dart';
import 'package:instaclon/screens/components/responsive_wrapper.dart';

import 'package:instaclon/screens/constants/size.dart';
import 'package:flutter/material.dart';

class EmailSendPage extends StatelessWidget {
  const EmailSendPage({super.key});

  @override
  Widget build(BuildContext context) {
    //  double _height = MediaQuery.sizeOf(context).height;
    //double _width = MediaQuery.sizeOf(context).width;
    return Scaffold(
      body: ResponsiveWrapper(
        child: EmailSendBody(),
      ),
    );
  }
}

class EmailSendBody extends StatelessWidget {
  const EmailSendBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        IconContainer(
          child: Icon(
            Icons.mark_email_read_outlined,
            size: 86,
          ),
        ),
        const CustomText(
          text: 'Check your Inbox',
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
        SizedBox(
          height: Sizes.defaultPadding / 2,
        ),
        CustomText(
          text:
              'We have send you a password reset email,Please reset your password',
          color: Theme.of(context).textTheme.bodyLarge!.color!.withOpacity(.7),
          textAlign: TextAlign.center,
          fontSize: 12,
        ),
        SizedBox(
          height: Sizes.defaultPadding * 3,
        ),
        CustomElevatedButton(
          onPressed: () {},
          child: Text(
            "Login",
            overflow: TextOverflow.ellipsis,
          ),
        ),
        SizedBox(
          height: Sizes.defaultPadding,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomText(text: "Did not Recived Email?"),
            CustomTextButton(
              onPressed: () {},
              child: Text(
                "Resend Email",
                style: TextStyle(fontSize: 12),
              ),
            )
          ],
        )
      ],
    );
  }
}
