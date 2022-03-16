// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_theme.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class AppThemeAdapter extends TypeAdapter<AppTheme> {
  @override
  final int typeId = 2;

  @override
  AppTheme read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return AppTheme()
      .._primaryColor = fields[0] as int
      .._mode = fields[1] as int;
  }

  @override
  void write(BinaryWriter writer, AppTheme obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj._primaryColor)
      ..writeByte(1)
      ..write(obj._mode);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AppThemeAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
