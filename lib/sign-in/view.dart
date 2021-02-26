import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'controller.dart';
import 'widgets/agreement.dart';
import 'widgets/switch.dart';

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
                          child: Obx(() => Text(
                                '获取验证码',
                                style: TextStyle(
                                  color: controller.account.value.isPhoneNumber
                                      ? context.theme.primaryColor
                                      : context.theme.primaryColor
                                          .withOpacity(0.4),
                                ),
                              )),
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
            const SignInSwitchMode(),
            const Expanded(
              child: const SizedBox.shrink(),
            ),
            const SignInAgreement(),
          ],
        ),
      ),
    );
  }
}
