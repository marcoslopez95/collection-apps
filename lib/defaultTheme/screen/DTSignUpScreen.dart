import 'package:access_maketicket/constants.dart';
import 'package:access_maketicket/helper.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:access_maketicket/fullApps/smartDeck/Screens/SDHomePageScreen.dart';
import 'package:access_maketicket/main/utils/AppColors.dart';
import 'package:access_maketicket/main/utils/AppWidget.dart';
import 'package:access_maketicket/src/auth/LoginController.dart';

import '../../main.dart';
import 'DTDrawerWidget.dart';

class DTSignUpScreen extends StatefulWidget {
  static String tag = '/DTSignUpScreen';

  @override
  DTSignUpScreenState createState() => DTSignUpScreenState();
}

class DTSignUpScreenState extends State<DTSignUpScreen> {
  Helper helper = Helper();
  bool obscureText = true;
  bool autoValidate = false;
  bool isTaped = false;
  var emailCont = TextEditingController(text: '');
  var passCont = TextEditingController(text: '');
  var nameCont = TextEditingController();
  String? messageError;

  var emailFocus = FocusNode();
  var passFocus = FocusNode();

  final LoginController _loginController = LoginController();

  Future<void> _login() async {
    setState(() {
      messageError = null;
    });
    bool success = await _loginController.login(
      emailCont.text,
      passCont.text,
    );
    setState(() {
      isTaped = success;
    });
    print('success ${success}');
    if (success) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => SDHomePageScreen()),
      );
    } else {
      setState(() {
        messageError = 'Fallo al iniciar sesión. Intente de nuevo';
      });
    }
  }

  @override
  void initState() {
    super.initState();
    init();
  }

  init() async {
    //
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    helper.context = context;
    return PopScope(
        canPop: false,
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          //appBar: appBar(context, 'Sign Up'),
          drawer: DTDrawerWidget(),
          body: Center(
            child: Container(
              width: dynamicWidth(context),
              child: SingleChildScrollView(
                padding: EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text('Iniciar Sesión', style: boldTextStyle(size: 24)),
                    30.height,
                    if (messageError != null)
                      Text('${messageError}',
                              style: boldTextStyle(color: appColorPrimary))
                          .center(),
                    16.height,
                    TextFormField(
                      controller: emailCont,
                      focusNode: emailFocus,
                      style: primaryTextStyle(),
                      decoration: InputDecoration(
                        labelText: 'Correo Electrónico',
                        labelStyle: secondaryTextStyle(),
                        contentPadding: EdgeInsets.all(16),
                        border: OutlineInputBorder(),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.0),
                            borderSide: BorderSide(color: appColorPrimary)),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.0),
                            borderSide: BorderSide(
                                color: appStore.textSecondaryColor!)),
                      ),
                      keyboardType: TextInputType.emailAddress,
                      onFieldSubmitted: (s) =>
                          FocusScope.of(context).requestFocus(passFocus),
                      textInputAction: TextInputAction.next,
                    ),
                    16.height,
                    TextFormField(
                      obscureText: obscureText,
                      focusNode: passFocus,
                      controller: passCont,
                      style: primaryTextStyle(),
                      decoration: InputDecoration(
                        labelText: 'Contraseña',
                        contentPadding: EdgeInsets.all(16),
                        labelStyle: secondaryTextStyle(),
                        border: OutlineInputBorder(),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.0),
                            borderSide: BorderSide(color: appColorPrimary)),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.0),
                            borderSide: BorderSide(
                                color: appStore.textSecondaryColor!)),
                        suffix: Icon(!obscureText
                                ? Icons.visibility
                                : Icons.visibility_off)
                            .onTap(() {
                          obscureText = !obscureText;
                          setState(() {});
                        }),
                      ),
                    ),
                    20.height,
                    Container(
                      alignment: Alignment.center,
                      padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                      decoration: BoxDecoration(
                          color: appColorPrimary,
                          borderRadius: BorderRadius.circular(8),
                          boxShadow: defaultBoxShadow()),
                      child: Text('${isTaped ? 'Iniciando...' : 'Iniciar'}',
                          style: boldTextStyle(color: white, size: 18)),
                    ).onTap(() {
                      finish(context);
                      if (!isTaped) {
                        _login();
                      }
                    }),
                    30.height,
                    Text(APP_VERSION, style: boldTextStyle(color: Colors.black))
                        .center(),
                  ],
                ),
              ).center(),
            ),
          ),
        ));
  }
}
