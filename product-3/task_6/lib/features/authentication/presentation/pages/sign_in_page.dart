import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/auth_bloc.dart';

import '../widgets/custom_button.dart';
import '../widgets/custom_text.dart';
import '../widgets/custom_text_field.dart';


class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formKey,
        child: BlocConsumer<AuthBloc, AuthState>(
          listener: (context, state) {
            if (state is AuthAuthenticated) {
              ScaffoldMessenger.of(context)
                  .showSnackBar(SnackBar(content: Text('logged in successfully')));

              Navigator.pushNamed(context, "/home");
            }
            if (state is AuthError) {
              ScaffoldMessenger.of(context)
                  .showSnackBar(SnackBar(content: Text(state.message)));
            }
          },
          builder: (context, state) {
            if (state is AuthLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: Column(children: [
                  const SizedBox(
                    height: 100,
                  ),
                  Image.asset("assets/img/Ecom.png", width: 144, height: 50),
                  const Padding(
                    padding:  EdgeInsets.only(top: 25.0, bottom: 65),
                    child: CustomTextWidget(
                        text: 'Sign into your account', 
                        weight:  FontWeight.w600, 
                        size:  26),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomTextFieldWidget(
                          label: 'Email',
                          fillColor: Color(0xffF3F3F3),
                          enableBorderColor: Colors.transparent,
                          labelSize: 16,
                          controller: emailController,
                          hintText: 'ex: jon.smith@gmail.com',
                          
                          ),
                      const SizedBox(
                        height: 35,
                      ),
                      CustomTextFieldWidget(
                          label: 'Password',
                          fillColor: Color(0xffF3F3F3),
                          enableBorderColor: Colors.transparent,
                          labelSize: 16,
                          controller: passwordController,
                          hintText: '******',
                          obscureText: true,
                          
                          ),
                    
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 28.0, bottom: 68),
                    child: GestureDetector(
                        onTap: () {
                          if (_formKey.currentState!.validate()) {
                            
                            final email = emailController.text;
                            final passwd = passwordController.text;
                            context
                                .read<AuthBloc>()
                                .add(LoginEvent(email: email, password: passwd));
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                    content: Text("Please Enter Valid Data")));
                          }
                        },
                        child:  const SizedBox(
                          width: double.infinity,
                          height: 43,
                          
                          child: CustomElevatedButtonWidget(
                                              text: "SIGN IN",
                                              backgroundColor: Color(0xff3F51F3),
                                              textColor: Colors.white,
                                              borderRadius: 10,
                                              textSize: 14,),
                        )),
                  ),
                  RichText(
                    text: TextSpan(
                        text: "Don’t have an account? ",
                        style: const TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 16,
                            color: Colors.grey),
                        children: [
                          TextSpan(
                              recognizer: TapGestureRecognizer()
                                ..onTap = () => Navigator.pushNamed(
                                    context, "/sign_up"),
                              text: "SIGN UP",
                              style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                  color: Color(0xff3F51F3)))
                        ]),
                  )
                ]),
              );
            }
          },
        ),
      ),
    );
  }
}

