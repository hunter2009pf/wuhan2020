import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wuhan2020/Constant.dart';

class LoginPage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _LoginPageState();
  }
}

class _LoginPageState extends State<LoginPage>{
  TextEditingController _accountCtrl, _passwordCtrl;
  Timer timer;
  RaisedButton verifyButton;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _accountCtrl = new TextEditingController();
    _passwordCtrl = new TextEditingController();
    verifyButton= new RaisedButton(
        color: Colors.green,
        child: Text(Constant.LOGIN_VALIDATION_BUTTON, style: TextStyle(
        ),
        ),
        onPressed: sendVerificationCode
    );
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, width: Constant.VIRTUAL_DEV_WIDTH, height: Constant.VIRTUAL_DEV_HEIGHT, allowFontScaling: false);
    
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Padding(
                padding: EdgeInsets.only(top: ScreenUtil().setHeight(50))
            ),
            Row(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(right: ScreenUtil().setWidth(20))
                ),
                SizedBox(
                  width: ScreenUtil().setWidth(80),
                  height: ScreenUtil().setWidth(80),
                  child: Image.asset(Constant.WELCOME_IMAGE_PATH, fit: BoxFit.cover)
                ),
                Padding(
                  padding: EdgeInsets.only(right: ScreenUtil().setWidth(20))
                ),
                Text(
                  Constant.WELCOME_SLOGAN,
                  style: TextStyle(fontSize: 17, fontWeight: FontWeight.w700)
                )
              ],
            ),
            Padding(
              padding: EdgeInsets.only(top: 50)
            ),
            SizedBox(
              width: ScreenUtil().setWidth(300),
              height: ScreenUtil().setHeight(50),
              child: TextField(
                decoration: InputDecoration(
                  hintText: Constant.LOGIN_CELLPHONE_HINT
                ),
                controller: _accountCtrl
              ),
            ),
            Row(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(left: ScreenUtil().setWidth(Constant.VIRTUAL_DEV_WIDTH/2-150))
                ),
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: Constant.LOGIN_PASSWORD_HINT
                    ),
                    controller: _passwordCtrl,
                  ),
                ),
                verifyButton,
                Padding(
                  padding: EdgeInsets.only(right: ScreenUtil().setWidth(60))
                )
              ],
            ),
            Row(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.fromLTRB(0, ScreenUtil().setHeight(35), ScreenUtil().setWidth(260), 0)
                ),
                Text(
                  Constant.LOGIN_NO_VALIDATION_CODE,
                  style: TextStyle(
                    fontSize: 12
                  ),
                )
              ],
            ),
            Padding(
              padding: EdgeInsets.only(top: 30)
            ),
            Container(
              width: ScreenUtil().setWidth(300),
              child: RaisedButton(
                child: Text(Constant.LOGIN_BUTTON),
                onPressed: (){},
              ),
            ),
            Text(Constant.LOGIN_AUTO_REGISTRATION),
            Padding(
              padding: EdgeInsets.only(top: ScreenUtil().setHeight(100))
            ),
            Text(Constant.LOGIN_THIRD_PARTY),
            Padding(
              padding: EdgeInsets.only(top: ScreenUtil().setHeight(15))
            ),
            CircleAvatar(
              child: Image.asset(Constant.LOGIN_WECHAT_ICON_PATH)
            ),
            Padding(
                padding: EdgeInsets.only(top: ScreenUtil().setHeight(15))
            ),
            Row(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(left: ScreenUtil().setWidth(100))
                ),
                Text(Constant.LOGIN_NOTIFICATION_ONE, style: TextStyle(fontSize: 10, fontWeight: FontWeight.w100)),
                Text(Constant.LOGIN_NOTIFICATION_TWO, style: TextStyle(fontSize: 10, fontWeight: FontWeight.w700))
              ],
            )
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _accountCtrl.dispose();
    _passwordCtrl.dispose();
  }

  void sendVerificationCode() {
    setState(() {
      verifyButton=new RaisedButton(
          color: Colors.green,
          child: Text(Constant.LOGIN_VALIDATION_BUTTON, style: TextStyle(
          ),
          ),
          onPressed: null
      );
    });
    timer =new Timer(Constant.ONE_MINUTE, recoverVerificationButton);
  }

  void recoverVerificationButton() {
     setState(() {
       verifyButton=new RaisedButton(
           color: Colors.green,
           child: Text(Constant.LOGIN_VALIDATION_BUTTON, style: TextStyle(
           ),
           ),
           onPressed: sendVerificationCode
       );
     });
  }
}