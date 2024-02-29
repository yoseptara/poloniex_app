import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:poloniex_app/core/blocs/auth-session/auth_session_cubit.dart';
import 'package:poloniex_app/core/components/form_button.dart';
import 'package:poloniex_app/core/components/input_field.dart';
import 'package:poloniex_app/core/repositories/auth_repository.dart';
import 'package:poloniex_app/core/utils/dialog_manager.dart';
import 'package:poloniex_app/core/utils/loader_manager.dart';
import 'package:poloniex_app/features/register/register_cubit.dart';

class RegisterPage extends StatelessWidget {
  static const route = '/register_page';

  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: ListView(
          children: [
            SizedBox(height: screenHeight * .12),
            const Text(
              'Create Account,',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: screenHeight * .01),
            Text(
              'Sign up to get started!',
              style: TextStyle(
                fontSize: 18,
                color: Colors.black.withOpacity(.6),
              ),
            ),
            SizedBox(height: screenHeight * .12),
            BlocProvider(
              create: (_) => RegisterCubit(
                authRepo: context.read<AuthRepository>(),
                authSessionCubit: context.read<AuthSessionCubit>(),
              ),
              child: _Form(screenHeight: screenHeight),
            ),
            SizedBox(
              height: screenHeight * .125,
            ),
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: RichText(
                text: const TextSpan(
                  text: "I'm already a member, ",
                  style: TextStyle(color: Colors.black),
                  children: [
                    TextSpan(
                      text: 'Sign In',
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
    return BlocListener<RegisterCubit, RegisterState>(
      listener: (context, state) {
        if (state.showProgressLoader) {
          LoaderManager().showLoader(context);
        }

        if (state.dismissProgressLoader) {
          LoaderManager().dismissLoader();
        }

        if (state.errMsg != null) {
          DialogManager().show(context, message: state.errMsg!);
        }

        if (state.returnToLoginPage) {
          DialogManager().show(
            context,
            message: 'Account has been successfully registered',
            onDismiss: context.pop,
          );
          return;
        }
      },
      child: Column(
        children: [
          InputField(
            autovalidateMode: AutovalidateMode.onUserInteraction,
            onChanged: (value) {
              context.read<RegisterCubit>().updateState(firstName: value);
            },
            labelText: 'First name',
            validator: (String? val) {
              if (val == null || val.isEmpty) {
                return 'This field is required';
              }

              return null;
            },
            textInputAction: TextInputAction.next,
            autoFocus: true,
          ),
          SizedBox(height: screenHeight * .025),
          InputField(
            autovalidateMode: AutovalidateMode.onUserInteraction,
            onChanged: (value) {
              context.read<RegisterCubit>().updateState(lastName: value);
            },
            labelText: 'Last name',
            validator: (String? val) {
              if (val == null || val.isEmpty) {
                return 'This field is required';
              }

              return null;
            },
            textInputAction: TextInputAction.next,
            autoFocus: true,
          ),
          SizedBox(height: screenHeight * .025),
          InputField(
            autovalidateMode: AutovalidateMode.onUserInteraction,
            onChanged: (value) {
              context.read<RegisterCubit>().updateState(email: value);
            },
            labelText: 'Email',
            validator: (String? val) {
              if (val == null || val.isEmpty) {
                return 'This field is required';
              }

              return null;
            },
            keyboardType: TextInputType.emailAddress,
            textInputAction: TextInputAction.next,
            autoFocus: true,
          ),
          SizedBox(height: screenHeight * .025),
          InputField(
            autovalidateMode: AutovalidateMode.onUserInteraction,
            onChanged: (value) {
              context.read<RegisterCubit>().updateState(password: value);
            },
            labelText: 'Password',
            validator: (String? val) {
              if (val == null || val.isEmpty) {
                return 'This field is required';
              }

              return null;
            },
            obscureText: true,
            textInputAction: TextInputAction.next,
          ),
          SizedBox(height: screenHeight * .025),
          const _InputConfirmPass(),
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
    return BlocBuilder<RegisterCubit, RegisterState>(
        buildWhen: (previous, current) =>
            previous.firstName != current.firstName ||
            previous.lastName != current.lastName ||
            previous.email != current.email ||
            previous.password != current.password ||
            previous.confirmPassword != current.confirmPassword,
        builder: (context, state) {
          return SizedBox(
            width: double.maxFinite,
            child: FormButton(
              text: 'Sign Up',
              enable: state.firstName.isNotEmpty &&
                  state.lastName.isNotEmpty &&
                  state.email.isNotEmpty &&
                  state.password.isNotEmpty &&
                  state.confirmPassword == state.password,
              onPressed: context.read<RegisterCubit>().register,
            ),
          );
        });
  }
}

class _InputConfirmPass extends StatelessWidget {
  const _InputConfirmPass();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RegisterCubit, RegisterState>(
        buildWhen: (previous, current) => previous.password != current.password,
        builder: (context, state) {
          return InputField(
            autovalidateMode: AutovalidateMode.onUserInteraction,
            onChanged: (value) {
              context.read<RegisterCubit>().updateState(confirmPassword: value);
            },
            validator: (String? val) {
              if (val == null || val.isEmpty) {
                return 'This field is required';
              }

              if (state.password != val) {
                return 'Confirm password doesn\'t match';
              }

              return null;
            },
            labelText: 'Confirm Password',
            obscureText: true,
            textInputAction: TextInputAction.done,
          );
        });
  }
}
