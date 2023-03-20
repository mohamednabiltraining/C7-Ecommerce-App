import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:route_ecommerce_c7_online/api/api_manager.dart';
import 'package:route_ecommerce_c7_online/base/base_state.dart';
import 'package:route_ecommerce_c7_online/provider/app_config_provider.dart';
import 'package:route_ecommerce_c7_online/ui/di.dart';
import 'package:route_ecommerce_c7_online/ui/dialog_utils.dart';
import 'package:route_ecommerce_c7_online/ui/home/home_screen.dart';
import 'package:route_ecommerce_c7_online/ui/register/register_navigator.dart';
import 'package:route_ecommerce_c7_online/ui/register/register_viewModel.dart';
import 'package:route_ecommerce_c7_online/ui/widgets/custom_form_field.dart';
import 'package:route_ecommerce_c7_online/ui/widgets/form_label.dart';
import 'package:route_ecommerce_c7_online/ui/widgets/form_submit_button.dart';

class RegisterScreen extends StatefulWidget {
  static const String routeName = 'register';

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends BaseState<RegisterScreen, RegisterViewModel>
    implements RegisterNavigator {
  var formKey = GlobalKey<FormState>();

  TextEditingController nameController = TextEditingController();

  TextEditingController emailController = TextEditingController();

  TextEditingController phoneController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  TextEditingController passwordConfirmationController =
      TextEditingController();

  @override
  RegisterViewModel initViewModel() {
    return RegisterViewModel(
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
            children: [
              Image.asset('assets/images/route_logo.png'),
              Expanded(
                child: SingleChildScrollView(
                  child: Form(
                    key: formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        FormLabel('Full Name'),
                        CustomFormField(
                          'Enter your full name',
                          keyboardType: TextInputType.name,
                          controller: nameController,
                          validator: (text) {
                            if (text == null || text.trim().isEmpty) {
                              return 'please enter full name';
                            }
                          },
                        ),
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
                        FormLabel('Phone'),
                        CustomFormField(
                          'Enter your phone',
                          keyboardType: TextInputType.phone,
                          controller: phoneController,
                          validator: (text) {
                            if (text == null || text.trim().isEmpty) {
                              return 'please enter phone';
                            }
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
                        FormLabel('Password Confirmation'),
                        CustomFormField('re-enter your Password',
                            hideText: true,
                            controller: passwordConfirmationController,
                            validator: (text) {
                          if (text == null || text.trim().isEmpty) {
                            return 'please re-enter password';
                          }
                          if (passwordController.text != text) {
                            return "password dosn't macth";
                          }
                        }),
                        FormSubmitButton('Sign Up', () {
                          register();
                        })
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

  void register() async {
    // validate form
    if (formKey.currentState?.validate() == false) {
      return;
    }
    viewModel.register(
        nameController.text,
        emailController.text,
        passwordController.text,
        passwordConfirmationController.text,
        phoneController.text);
  }

  @override
  void gotoHome() {
    Navigator.pushReplacementNamed(context, HomeScreen.routeName);
  }
}
