import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:route_ecommerce_c7_online/api/api_manager.dart';
import 'package:route_ecommerce_c7_online/base/base_state.dart';
import 'package:route_ecommerce_c7_online/provider/app_config_provider.dart';
import 'package:route_ecommerce_c7_online/ui/di.dart';
import 'package:route_ecommerce_c7_online/ui/dialog_utils.dart';
import 'package:route_ecommerce_c7_online/ui/home/home_screen.dart';
import 'package:route_ecommerce_c7_online/ui/login/login_navigator.dart';
import 'package:route_ecommerce_c7_online/ui/login/login_viewModel.dart';
import 'package:route_ecommerce_c7_online/ui/register/register_screen.dart';
import 'package:route_ecommerce_c7_online/ui/widgets/custom_form_field.dart';
import 'package:route_ecommerce_c7_online/ui/widgets/form_label.dart';
import 'package:route_ecommerce_c7_online/ui/widgets/form_submit_button.dart';

class LoginScreen extends StatefulWidget {
  static const String routeName = 'login';

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends BaseState<LoginScreen, LoginViewModel>
    implements LoginNavigator {
  var formKey = GlobalKey<FormState>();

  TextEditingController emailController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  @override
  LoginViewModel initViewModel() {
    return LoginViewModel(
        injectAuthRepository(), getAppConfigProvider(context));
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => viewModel,
      child: Scaffold(
        appBar: AppBar(),
        body: Container(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Image.asset('assets/images/route_logo.png'),
              SizedBox(height: 64),
              Text(
                'Welcome Back To Route',
                style: TextStyle(fontSize: 24, color: Colors.white),
              ),
              Text('Please sign in with your mail',
                  style: TextStyle(fontSize: 16, color: Colors.white)),
              SizedBox(height: 32),
              Expanded(
                child: SingleChildScrollView(
                  child: Form(
                    key: formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        FormLabel('Email'),
                        CustomFormField(
                          'Enter your email',
                          keyboardType: TextInputType.emailAddress,
                          controller: emailController,
                          validator: (text) {
                            if (text == null || text.trim().isEmpty) {
                              return 'please enter email';
                            }
                            // email formatted ?
                          },
                        ),
                        FormLabel('Password'),
                        CustomFormField('Enter your Password',
                            hideText: true,
                            controller: passwordController, validator: (text) {
                          if (text == null || text.trim().isEmpty) {
                            return 'please enter password';
                          }
                        }),
                        Text('Forget Password',
                            textAlign: TextAlign.end,
                            style:
                                TextStyle(fontSize: 16, color: Colors.white)),
                        SizedBox(height: 32),
                        FormSubmitButton('Sign In', () {
                          login();
                        }),
                        SizedBox(height: 16),
                        InkWell(
                          onTap: () {
                            Navigator.pushNamed(
                                context, RegisterScreen.routeName);
                          },
                          child: Text('Don’t have an account? Create Account',
                              textAlign: TextAlign.center,
                              style:
                                  TextStyle(fontSize: 18, color: Colors.white)),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void login() async {
    // validate form
    if (formKey.currentState?.validate() == false) {
      return;
    }
    viewModel.login(
      emailController.text,
      passwordController.text,
    );
  }

  @override
  void gotoHome() {
    Navigator.pushReplacementNamed(context, HomeScreen.routeName);
  }
}
