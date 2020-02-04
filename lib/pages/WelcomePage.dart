import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wuhan2020/Constant.dart';


void jumpToLoginPage(BuildContext context) {
   Navigator.of(context).pushReplacementNamed("login_page");
}


void startTimer(BuildContext context){
  new Timer(Constant.WELCOME_TIMEOUT, (){jumpToLoginPage(context);});
}

class WelcomePage extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _WelcomePageState();
  }

}

class _WelcomePageState extends State<WelcomePage> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    startTimer(context);
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, width: Constant.VIRTUAL_DEV_WIDTH,
        height: Constant.VIRTUAL_DEV_HEIGHT,
        allowFontScaling: false);

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(top: ScreenUtil().setHeight(150)),
            ),
            Center(
              child: SizedBox(
                width: ScreenUtil().setWidth(150),
                height: ScreenUtil().setWidth(150),
                child: Image.asset(Constant.WELCOME_IMAGE_PATH, fit: BoxFit.cover,),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: ScreenUtil().setHeight(30)),
            ),
            Text(Constant.WELCOME_SLOGAN,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 30),
            ),
            Padding(
              padding: EdgeInsets.only(top: ScreenUtil().setHeight(150)),
            ),
            Text(Constant.WELCOME_PLATFORM_NAME,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 10),
            )
          ],
        ),
      ),
    );
  }
}

