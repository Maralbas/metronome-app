// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tempo_type.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class TempoTypeAdapter extends TypeAdapter<TempoType> {
  @override
  final int typeId = 0;

  @override
  TempoType read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return TempoType(
      fields[0] as String,
      fields[1] as int,
      fields[2] as int,
      (fields[3] as List)?.cast<BeatBar>(),
    );
  }

  @override
  void write(BinaryWriter writer, TempoType obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.defaultBpm)
      ..writeByte(2)
      ..write(obj.numBars)
      ..writeByte(3)
      ..write(obj.beatBars);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TempoTypeAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
