// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'theme.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Theme _$ThemeFromJson(Map<String, dynamic> json) => Theme(
      mode: $enumDecodeNullable(_$ThemeModeEnumMap, json['mode']) ??
          ThemeMode.system,
      primaryColor: json['primaryColor'] == null
          ? const Color(0xff5e6ce7)
          : const _ColorConverter().fromJson(json['primaryColor'] as int),
    );

Map<String, dynamic> _$ThemeToJson(Theme instance) => <String, dynamic>{
      'mode': _$ThemeModeEnumMap[instance.mode],
      'primaryColor': const _ColorConverter().toJson(instance.primaryColor),
    };

const _$ThemeModeEnumMap = {
  ThemeMode.system: 'system',
  ThemeMode.light: 'light',
  ThemeMode.dark: 'dark',
};
