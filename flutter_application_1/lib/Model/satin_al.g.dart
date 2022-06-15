// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'satin_al.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class SatinAlModelAdapter extends TypeAdapter<SatinAlModel> {
  @override
  final int typeId = 1;

  @override
  SatinAlModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return SatinAlModel(
      fields[0] as String,
      fields[1] as String,
      fields[2] as double,
      fields[3] as String,
    );
  }

  @override
  void write(BinaryWriter writer, SatinAlModel obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.isim)
      ..writeByte(2)
      ..write(obj.para)
      ..writeByte(3)
      ..write(obj.imgyol);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SatinAlModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
