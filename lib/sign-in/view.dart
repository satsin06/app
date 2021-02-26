import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'controller.dart';
import 'widgets/agreement.dart';

class SignInView extends GetView<SignInController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      extendBodyBehindAppBar: false,
      backgroundColor: Theme.of(context).appBarTheme.color,
      appBar: AppBar(
        title: Text('SIGN_IN'.tr),
        automaticallyImplyLeading: true,
        centerTitle: true,
      ),
      body: Container(
        padding: context.mediaQuery.padding.copyWith(left: 24.0, right: 24.0),
        width: context.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'APP_NAME'.tr,
              style: context.textTheme.headline2.copyWith(
                color: context.theme.primaryColor,
              ),
              textAlign: TextAlign.center,
            ),
            Padding(
              padding: EdgeInsets.only(top: 24),
              child: TextField(
                keyboardType: TextInputType.text,
                autofocus: false,
                decoration: InputDecoration(
                  hintText: "请输入手机号码",
                ),
                onChanged: (String value) {
                  controller.account.value = value;
                },
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 24),
              child: TextField(
                keyboardType: TextInputType.visiblePassword,
                autofocus: false,
                decoration: InputDecoration(
                  hintText: "请输入验证码",
                  suffixIcon: UnconstrainedBox(
                    child: GestureDetector(
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: Padding(
                          padding: EdgeInsets.only(right: 24.0),
                          child: Text(
                            '获取验证码',
                            // style: TextStyle(
                            //   // color: textColorBuilder(context),
                            // ),
                          ),
                        ),
                      ),
                      onTap: () {},
                    ),
                  ),
                ),
                // onChanged: _createCodeChangedHandler(context),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 36.0),
              child: SizedBox(
                height: 48,
                child: RaisedButton(
                  child: Text('SIGN_IN'.tr),
                  color: context.theme.primaryColor,
                  colorBrightness: Brightness.dark,
                  onPressed: () {},
                  shape: StadiumBorder(),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 24.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                    onPressed: () {
                      print(controller.mode);
                      controller.switchMode(
                          controller.mode.value == SignInMode.PASSWORD
                              ? SignInMode.SMS_CODE
                              : SignInMode.PASSWORD);
                    },
                    child: Obx(
                      () => Text(controller.mode.value == SignInMode.PASSWORD
                          ? '快速登录'
                          : '使用密码登录'),
                    ),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: Text('忘记密码？'),
                  ),
                ],
              ),
            ),
            Expanded(
              child: SizedBox.shrink(),
            ),
            const SignInAgreement(),
          ],
        ),
      ),
    );
  }
}
