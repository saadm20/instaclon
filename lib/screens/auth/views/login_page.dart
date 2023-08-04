import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:instaclon/screens/auth/auth_components/custom_textfield.dart';
import 'package:instaclon/screens/auth/auth_components/error_dialogs.dart';
import 'package:instaclon/screens/auth/views/signup_page.dart';
import 'package:instaclon/screens/components/widgets/buttons.dart';
import 'package:instaclon/screens/components/widgets/icon_container.dart';
import 'package:instaclon/screens/components/widgets/text_widgets.dart';
import 'package:instaclon/screens/components/responsive_wrapper.dart';
import 'package:instaclon/screens/constants/size.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:instaclon/state/auth/exceptions/textFieldException.dart';
import 'package:instaclon/state/auth/provider/auth_state_provider.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: ResponsiveWrapper(
        child: LoginBody(),
      ),
    );
  }
}

class LoginBody extends HookConsumerWidget {
  const LoginBody({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final _emailController = useTextEditingController(text: "");
    final _passwordController = useTextEditingController(text: "");

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Image.asset('assets/images/instaclon.png'),
        const SizedBox(
          height: Sizes.defaultPadding,
        ),
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
          onPressed: () async {
            await ref
                .read(authStateProvider.notifier)
                .signIn(
                  email: _emailController.text,
                  password: _passwordController.text,
                )
                .onError((error, stackTrace) =>
                    error.runtimeType == TextFieldErrorTextException
                        ? ErrorMaterialBanner.show(
                            context,
                            error.toString(),
                          )
                        : ErrorSnackBar.show(
                            context,
                            error.toString(),
                          ));
          },
          padding:
              const EdgeInsets.symmetric(vertical: Sizes.defaultPadding / 2),
          child: const CustomText(text: "Sign in"),
        ),
        GestureDetector(
          onTap: () {},
          child: const CustomText(
            text: "Forgot Password?",
            fontSize: Sizes.defaultLabeltSize,
            textAlign: TextAlign.center,
          ),
        ),
        const SizedBox(
          height: Sizes.defaultPadding * 2,
        ),
        const CustomText(
          text: "- Or sign in with -",
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
              child: SvgPicture.asset(
                'assets/icons/icons8-facebook.svg',
                height: 24,
                width: 24,
              ),
            ),
            IconContainer(
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
            const CustomText(text: 'Dont have an Account? '),
            TextButton(
                onPressed: () {
                  Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute(
                          builder: (context) => const SignupPage()),
                      (route) => false);
                },
                child: const Text("Signup"))
          ],
        )
      ],
    );
  }
}
