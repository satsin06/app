import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../models/user_profile.dart';
import '../../../../providers/auth.dart';
import '../../../../providers/user.dart';
import '../providers/update_profile.dart';

class BirthdayTile extends ConsumerWidget {
  const BirthdayTile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final String userId = ref.watch(authProvider)!;
    final int? birthday = ref
        .watch(userProfileProvider(userId).select((value) => value.birthday));

    return ListTile(
      dense: true,
      title: const Text('生日'),
      trailing: TextButton(
        onPressed: () => onChangeBirthday(context, ref, birthday),
        child: buildBirthdayText(context, birthday),
      ),
    );
  }

  /// Build birthday text.
  Widget buildBirthdayText(BuildContext context, int? birthday) {
    return Text(convertBirthdayToString(context, birthday));
  }

  /// Convert birthdat to string.
  ///
  /// The [birthday] is the birthday 8 length number,
  /// e.g. 20220410.
  ///
  /// Return the birthday string, e.g. 2022-04-10.
  String convertBirthdayToString(BuildContext context, int? birthday) {
    if (birthday == null) {
      return '设置';
    }

    final DateTime date = DateTime.parse(birthday.toString());
    final MaterialLocalizations localizations =
        MaterialLocalizations.of(context);

    return localizations.formatShortDate(date);
  }

  /// convert birthday to int.
  /// Return the birthday int, e.g. 20220410.
  int convertBirthdayToInt(DateTime birthday) {
    final int year = birthday.year;
    final int month = birthday.month;
    final int day = birthday.day;

    return year * 10000 + month * 100 + day;
  }

  /// On change birthday.
  ///
  /// show date picker.
  void onChangeBirthday(
      BuildContext context, WidgetRef ref, int? birthday) async {
    final DateTime? selected = await showDatePicker(
      context: context,
      initialDate: birthday == null
          ? DateTime.now()
          : DateTime.parse(birthday.toString()),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
      currentDate: DateTime.now(),
    );
    if (selected == null) return;

    final Future<UserProfile> Function(
        {String? bio,
        int? birthday,
        UserGender? gender}) updater = updateAuthProfile(ref);
    updater(birthday: convertBirthdayToInt(selected));
  }
}
