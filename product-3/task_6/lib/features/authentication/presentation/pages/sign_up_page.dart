import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/params/auth_params.dart';
import '../bloc/auth_bloc.dart';
import '../widgets/custom_button.dart';
import '../widgets/custom_text.dart';
import '../widgets/custom_text_field.dart';


class SignUpPage extends StatelessWidget {
  
   SignUpPage({super.key});

  final TextEditingController emailEditingController = TextEditingController();
  final TextEditingController nameEditingController = TextEditingController();
  final TextEditingController passwordEditingController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        automaticallyImplyLeading: false,
        title: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(Icons.navigate_before)),
              Image.asset(
                "assets/img/Ecom.png",
                width: 78,
                height: 25,
              )
            ],
          ),
        ),
      ),
      body: BlocConsumer<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is AuthSuccess) {
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text(state.message)));

            Navigator.pushNamed(context, "/sign_in");
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
              padding: const EdgeInsets.symmetric(horizontal: 28.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Align(
                      alignment: Alignment.bottomCenter,
                      child: CustomTextWidget(
                          text :"Create your account", 
                          weight:  FontWeight.w600, 
                          size : 26)),
                  CustomTextFieldWidget(
                          label: 'Name',
                          fillColor: Color(0xffF3F3F3),
                          enableBorderColor: Colors.transparent,
                          labelSize: 16,
                          controller: nameEditingController,
                          hintText: 'john',
                          sizedBox: 18,
                          
                          ),
                  CustomTextFieldWidget(
                          label: 'Email',
                          fillColor: Color(0xffF3F3F3),
                          enableBorderColor: Colors.transparent,
                          labelSize: 16,
                          controller: emailEditingController,
                          hintText: 'ex: jon.smith@gmail.com',
                          sizedBox: 18,
                          
                          ),
                 CustomTextFieldWidget(
                          label: 'password',
                          fillColor: Color(0xffF3F3F3),
                          enableBorderColor: Colors.transparent,
                          labelSize: 16,
                          controller: passwordEditingController,
                          hintText: '******',
                          sizedBox: 18,
                          
                          ),
                  CustomTextFieldWidget(
                          label: 'Confirm password',
                          fillColor: Color(0xffF3F3F3),
                          enableBorderColor: Colors.transparent,
                          labelSize: 16,
                          controller: confirmPasswordController,
                          hintText: '******',
                          sizedBox: 18,
                          
                          ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Checkbox(
                        value: true,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5)),
                        onChanged: (value) {},
                      ),
                      RichText(
                        text: const TextSpan(
                            text: "I understood the ",
                            style: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 16,
                                color: Colors.grey),
                            children: [
                              TextSpan(
                                  text: "terms & policy.",
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400,
                                      color: Color(0xff3F51F3)))
                            ]),
                      ),
                    ],
                  ),
                  GestureDetector(
                      onTap: () {
                      
                        final signUpParams = SignUpParams(
                                    name: nameEditingController.text, 
                                    password: passwordEditingController.text, 
                                    email: emailEditingController.text);
                    
                   
                        context.read<AuthBloc>().add(SignUpEvent(email:signUpParams.email,name: signUpParams.name, password:signUpParams.password ));
                      },
                      child: const SizedBox(
                          width: double.infinity,
                          height: 43,
                          
                          child: CustomElevatedButtonWidget(
                                              text: "SIGN Up",
                                              backgroundColor: Color(0xff3F51F3),
                                              textColor: Colors.white,
                                              borderRadius: 10,
                                              textSize: 14,),
                        )),
                  
                  Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: RichText(
                        text: TextSpan(
                            text: "Have an account? ",
                            style: const TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 16,
                                color: Colors.grey),
                            children: [
                              TextSpan(
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () => Navigator.pushNamed(
                                        context, "/sign_in"),
                                  text: "SIGN IN",
                                  style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400,
                                      color: Color(0xff3F51F3)))
                            ]),
                      ),
                    ),
                  )
                ],
              ),
            );
          }
        },
      ),
    );
  }
}

Text reusableText(String text, FontWeight wight, double size,
    [Color color = Colors.black]) {
  return Text(
    text,
    overflow: TextOverflow.clip,
    style: TextStyle(fontWeight: wight, fontSize: size, color: color),
  );
}