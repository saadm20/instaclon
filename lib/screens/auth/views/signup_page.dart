import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:instaclon/screens/auth/auth_components/custom_textfield.dart';
import 'package:instaclon/screens/auth/auth_components/error_dialogs.dart';
import 'package:instaclon/screens/auth/views/login_page.dart';
import 'package:instaclon/screens/components/widgets/buttons.dart';
import 'package:instaclon/screens/components/widgets/icon_container.dart';
import 'package:instaclon/screens/components/widgets/text_widgets.dart';
import 'package:instaclon/screens/components/responsive_wrapper.dart';
import 'package:instaclon/screens/constants/size.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:instaclon/screens/homepage.dart';
import 'package:instaclon/state/auth/exceptions/textFieldException.dart';
import 'package:instaclon/state/auth/provider/auth_state_provider.dart';
import 'package:instaclon/state/auth/provider/correct_user_name_provider.dart';
import 'package:instaclon/utils/theme.dart';

class SignupPage extends StatelessWidget {
  const SignupPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: ResponsiveWrapper(
        child: SignupBody(),
      ),
    );
  }
}

class SignupBody extends HookConsumerWidget {
  const SignupBody({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final _emailController = useTextEditingController(text: "");
    final _passwordController = useTextEditingController(text: "");
    final _userNameController = useTextEditingController(text: "");

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Image.asset('assets/images/instaclon.png'),
        const SizedBox(
          height: Sizes.defaultPadding,
        ),
        Consumer(
          builder: ((context, ref, child) {
            return CustomTextField(
              controller: _userNameController,
              hintText: 'Username',
              errorText: ref.watch(correctUserNameProvider),
            );
          }),
        ),
        const SizedBox(height: Sizes.defaultPadding),
        CustomTextField(
          controller: _emailController,
          hintText: 'Email Address',
        ),
        const SizedBox(height: Sizes.defaultPadding),
        CustomTextField(
          controller: _passwordController,
          hintText: 'Password',
        ),
        const SizedBox(
          height: Sizes.defaultPadding,
        ),
        CustomElevatedButton(
          onPressed: () {
            String textFieldErrorText = ref
                .read(correctUserNameProvider.notifier)
                .val(_userNameController.text);

            if (textFieldErrorText == "") {
              ref
                  .read(authStateProvider.notifier)
                  .signUp(
                    email: _emailController.text,
                    password: _passwordController.text,
                    name: _userNameController.text,
                  )
                  .onError((error, stackTrace) => error.runtimeType ==
                          TextFieldErrorTextException
                      ? ErrorMaterialBanner.show(
                          context,
                          error.toString(),
                        )
                      : ErrorSnackBar.show(
                          context,
                          error.toString(),
                        )) //!have to fix this problem with navgation.remove this navigator
                  .whenComplete(() => Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(builder: (context) => const HomePage()),
                      (route) => false));
            }
          },
          padding:
              const EdgeInsets.symmetric(vertical: Sizes.defaultPadding / 2),
          child: const CustomText(text: "Sign up"),
        ),
        const SizedBox(
          height: Sizes.defaultPadding * 2,
        ),
        const CustomText(
          text: "- Or sign up with -",
          fontWeight: FontWeight.bold,
          fontSize: Sizes.defaultLabeltSize,
          textAlign: TextAlign.center,
        ),
        const SizedBox(
          height: Sizes.defaultPadding,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IconContainer(
              color: AppColors.backGroundGreyColor,
              child: SvgPicture.asset(
                'assets/icons/icons8-facebook.svg',
                height: 24,
                width: 24,
              ),
            ),
            IconContainer(
                color: AppColors.backGroundGreyColor,
                child: SvgPicture.asset(
                  'assets/icons/icons8-google.svg',
                  height: 24,
                  width: 24,
                )),
          ],
        ),
        const SizedBox(
          height: Sizes.defaultPadding * 1.5,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const CustomText(text: 'Already have an Account? '),
            TextButton(
                onPressed: () {
                  Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute(
                          builder: (context) => const LoginPage()),
                      (route) => false);
                },
                child: const Text("Signin"))
          ],
        )
      ],
    );
  }
}
