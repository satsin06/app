import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../api/api.dart';
import '../../../../providers/auth.dart';
import '../../../../providers/user.dart';
import '../providers/update_profile.dart';

class GenderTile extends ConsumerWidget {
  const GenderTile({Key? key}) : super(key: key);

  List<DropdownMenuItem<UserGender>> get items => UserGender.values
      .map((gender) => _GenderDropdownMenuItem(gender))
      .toList();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final String userId = ref.read($AuthProvider)!;
    final UserGender gender =
        ref.watch($UserProvider(userId).select((value) => value.gender));

    return ListTile(
      dense: true,
      title: const Text('性别'),
      trailing: DropdownButton<UserGender>(
        items: items,
        value: gender,
        onChanged: (UserGender? gender) => onChangeAuthGender(ref, gender),
      ),
    );
  }

  void onChangeAuthGender(WidgetRef ref, UserGender? gender) {
    if (gender == null) return;

    final Future<User> Function(
        {String? bio,
        int? birthday,
        UserGender? gender}) updater = updateAuthProfile(ref);

    updater(gender: gender);
  }
}

class _GenderDropdownMenuItem extends DropdownMenuItem<UserGender> {
  _GenderDropdownMenuItem(UserGender gender)
      : super(child: _GenderDisplay(gender), value: gender);
}

class _GenderDisplay extends StatelessWidget {
  const _GenderDisplay(this.gender, {Key? key}) : super(key: key);

  final UserGender gender;

  Map<UserGender, IconData> get genderIcons => {
        UserGender.man: Icons.male,
        UserGender.woman: Icons.female,
      };

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(genderIcons[gender]),
        const SizedBox(width: 2),
        buildGenderText(context),
      ],
    );
  }

  Widget buildGenderText(BuildContext context) {
    String text;
    switch (gender) {
      case UserGender.man:
        text = '男性';
        break;
      case UserGender.woman:
        text = '女性';
        break;
      case UserGender.unknown:
        text = '隐私';
        break;
    }

    return Text(
      text,
      style: Theme.of(context)
          .textTheme
          .button
          ?.copyWith(color: Theme.of(context).primaryColor),
    );
  }
}
