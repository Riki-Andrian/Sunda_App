// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hasil.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class HasilAdapter extends TypeAdapter<Hasil> {
  @override
  final int typeId = 0;

  @override
  Hasil read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Hasil(
      level: fields[0] as int,
      score: fields[1] as int,
      questions: (fields[2] as List).cast<String>(),
      selectedAnswers: (fields[3] as List).cast<String>(),
      isCorrect: (fields[4] as List).cast<bool>(),
    );
  }

  @override
  void write(BinaryWriter writer, Hasil obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.level)
      ..writeByte(1)
      ..write(obj.score)
      ..writeByte(2)
      ..write(obj.questions)
      ..writeByte(3)
      ..write(obj.selectedAnswers)
      ..writeByte(4)
      ..write(obj.isCorrect);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is HasilAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
