import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tracker/contants/image_string.dart';
import 'package:tracker/services/login_class.dart';
import 'package:tracker/widgets/custom_alert_dialog.dart';
import 'package:tracker/widgets/custom_elevated_bottom.dart';
import 'package:tracker/widgets/custom_text_form_field.dart';

import '../../utils/theme.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  //Global Key
  final _formKey = GlobalKey<FormState>();
  // LoginClass
  LoginClass loginClass = LoginClass();
  // Text Controllers
  final TextEditingController dnsController = TextEditingController();
  final TextEditingController portController = TextEditingController();
  final TextEditingController userController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  void initState() {
    _loadSavedValues();
    super.initState();
  }

  Future<void> _loadSavedValues() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      dnsController.text = prefs.getString('DNSText') ?? '';
      portController.text = prefs.getString('PortText') ?? '';
    });
  }

  @override
  Widget build(BuildContext context) {
    //Custom Text theme
    TextTheme textTheme = TextThemeData.textTheme;
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            'Tracker'.toUpperCase(),
            style: textTheme.displayLarge,
          ),
        ),
      ),
      body: SingleChildScrollView(
        keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          height: size.height,
          child: Form(
            key: _formKey,
            child: ListView(
              shrinkWrap: true,
              children: [
                _logo(textTheme),
                _spacer(10),
                _dnsField(),
                _spacer(10),
                _portField(),
                _spacer(10),
                _userField(),
                _spacer(10),
                _passwordField(),
                _spacer(10),
                _buttomField(size),
                _spacer(50),
                Center(
                  child: Image.asset(
                    ImageString.logoDjango,
                    width: 50,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  SizedBox _spacer(double heigth) {
    return SizedBox(
      height: heigth,
    );
  }

  Widget _logo(TextTheme textTheme) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Image.asset(
            ImageString.logo,
            width: 140,
            height: 160,
          ),
          Text(
            'Powered by TFProtocol',
            style: textTheme.displaySmall,
            textAlign: TextAlign.end,
          )
        ],
      ),
    );
  }

  Widget _dnsField() {
    return CustomTextFormField(
      controller: dnsController,
      textInputType: TextInputType.text,
      icon: Icons.dns_outlined,
      label: 'DNS',
      validated: (value) {
        if (value!.isEmpty) {
          return 'DNS field is required';
        }
        return null;
      },
    );
  }

  Widget _portField() {
    return CustomTextFormField(
      controller: portController,
      textInputType: TextInputType.text,
      icon: Icons.compare_arrows_sharp,
      label: 'Port',
      validated: (value) {
        if (value!.isEmpty) {
          return 'Port field is required';
        }
        return null;
      },
    );
  }

  Widget _userField() {
    return CustomTextFormField(
      controller: userController,
      textInputType: TextInputType.text,
      icon: LineAwesomeIcons.user,
      label: 'User',
      validated: (value) {
        if (value!.isEmpty) {
          return 'User field is required';
        }
        return null;
      },
    );
  }

  Widget _passwordField() {
    return CustomTextFormField(
      controller: passwordController,
      textInputType: TextInputType.visiblePassword,
      icon: Icons.lock_outline_rounded,
      label: 'Password',
      obscureText: true,
      validated: (value) {
        if (value!.isEmpty) {
          return 'Password field is required';
        }
        return null;
      },
    );
  }

  Widget _buttomField(Size size) {
    return SizedBox(
      width: size.width,
      child: CustomElevatedBottom(
          text: 'LOGIN',
          onPressed: () {
            bool validated = _formKey.currentState?.validate() ?? false;
            if (validated) {
              _formKey.currentState!.save();
              String token = loginClass.getHash(
                  userController.text, passwordController.text);
              loginClass.login(token, dnsController.text, portController.text);
              if (loginClass.loggedIn) {
                Get.offAllNamed('/map');
              } else {
                CustomAlertDialog(
                  mensaje: 'Incorrect server or credentials',
                  onTap: () => Get.back(),
                );
              }
            }
          }),
    );
  }
}
