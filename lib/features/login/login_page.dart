import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:poloniex_app/core/blocs/auth-session/auth_session_cubit.dart';
import 'package:poloniex_app/core/components/form_button.dart';
import 'package:poloniex_app/core/components/input_field.dart';
import 'package:poloniex_app/core/repositories/auth_repository.dart';
import 'package:poloniex_app/core/routers/app_router.dart';
import 'package:poloniex_app/core/utils/dialog_manager.dart';
import 'package:poloniex_app/core/utils/loader_manager.dart';
import 'package:poloniex_app/features/login/login_cubit.dart';

class LoginPage extends StatelessWidget {
  static const route = '/login_page';

  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: ListView(
          children: [
            SizedBox(height: screenHeight * .12),
            const Text(
              'Welcome,',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: screenHeight * .01),
            Text(
              'Sign in to continue!',
              style: TextStyle(
                fontSize: 18,
                color: Colors.black.withOpacity(.6),
              ),
            ),
            SizedBox(height: screenHeight * .12),
            BlocProvider(
              create: (_) => LoginCubit(
                authRepo: context.read<AuthRepository>(),
                authSessionCubit: context.read<AuthSessionCubit>(),
              ),
              child: _Form(screenHeight: screenHeight),
            ),
            SizedBox(
              height: screenHeight * .15,
            ),
            TextButton(
              onPressed: () => const RegisterRoute().push(context),
              child: RichText(
                text: const TextSpan(
                  text: "I'm a new user, ",
                  style: TextStyle(color: Colors.black),
                  children: [
                    TextSpan(
                      text: 'Sign Up',
                      style: TextStyle(
                        color: Colors.blue,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class _Form extends StatelessWidget {
  const _Form({
    required this.screenHeight,
  });

  final double screenHeight;

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginCubit, LoginState>(
      listener: (context, state) {
        if(state.showProgressLoader) {
          LoaderManager().showLoader(context);
        }

        if(state.dismissProgressLoader) {
          LoaderManager().dismissLoader();
        }

        if(state.errMsg != null) {
          DialogManager().show(context, message: state.errMsg!);
        }
      },
      child: Column(
        children: [
          InputField(
            autovalidateMode: AutovalidateMode.onUserInteraction,
            onChanged: (value) {
              context.read<LoginCubit>().updateState(email: value);
            },
            validator: (String? val) {
              if (val == null || val.isEmpty) {
                return 'This field is required';
              }

              return null;
            },
            labelText: 'Email',
            keyboardType: TextInputType.emailAddress,
            textInputAction: TextInputAction.next,
            autoFocus: true,
          ),
          SizedBox(height: screenHeight * .025),
          InputField(
            autovalidateMode: AutovalidateMode.onUserInteraction,
            onChanged: (value) {
              context.read<LoginCubit>().updateState(password: value);
            },
            validator: (String? val) {
              if (val == null || val.isEmpty) {
                return 'This field is required';
              }

              return null;
            },
            labelText: 'Password',
            obscureText: true,
            textInputAction: TextInputAction.next,
          ),
          SizedBox(
            height: screenHeight * .075,
          ),
          const _SubmitButton(),
        ],
      ),
    );
  }
}

class _SubmitButton extends StatelessWidget {
  const _SubmitButton();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginCubit, LoginState>(
      buildWhen: (previous, current) => previous.email != current.email || previous.password != current.password,
      builder: (context, state) {
        return SizedBox(
          width: double.maxFinite,
          child: FormButton(
            text: 'Log In',
            enable: state.email.isNotEmpty && state.password.isNotEmpty,
            onPressed: context.read<LoginCubit>().login,
          ),
        );
      }
    );
  }
}
