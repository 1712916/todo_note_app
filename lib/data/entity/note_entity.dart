/*
* Nội dung ghi chú:
- mô tả của ghi chú
- trạng thái hoàn tất
- trạng thái xoá
- thời gian đánh dấu
- thời gian chỉnh sửa
- nội dung đính kèm
*
* */

import 'package:equatable/equatable.dart';

class NoteEntity extends Equatable {
  final int? id;

  ///[groupId] is id of [@NoteGroupEntity]
  final int? groupId;
  final String? description;
  final bool? isDone;
  final bool? isDeleted;
  final DateTime? date;
  final DateTime? updatedDateTime;
  final List<AttachmentEntity>? attachments;

  const NoteEntity({
    required this.id,
    required this.groupId,
    required this.description,
    required this.isDone,
    required this.isDeleted,
    required this.date,
    required this.updatedDateTime,
    required this.attachments,
  });

  @override
  List<Object?> get props => [
        id,
        groupId,
        description,
        isDone,
        isDeleted,
        date,
        updatedDateTime,
        attachments,
      ];

  NoteEntity copyWith({
    int? id,
    int? groupId,
    String? description,
    bool? isDone,
    bool? isDeleted,
    DateTime? date,
    DateTime? updatedDateTime,
    List<AttachmentEntity>? attachments,
  }) {
    return NoteEntity(
      id: id ?? this.id,
      groupId: groupId ?? this.groupId,
      description: description ?? this.description,
      isDone: isDone ?? this.isDone,
      isDeleted: isDeleted ?? this.isDeleted,
      date: date ?? this.date,
      updatedDateTime: updatedDateTime ?? this.updatedDateTime,
      attachments: attachments ?? this.attachments,
    );
  }
}

//Lưu thông tin đính kèm
class AttachmentEntity extends Equatable {
  final String? path;

  AttachmentEntity({required this.path});

  @override
  List<Object?> get props => [path];
}

class NoteGroupEntity extends Equatable {
  final int? id;
  final String? name;
  final DateTime? updatedDateTime;

  const NoteGroupEntity({
    required this.id,
    required this.name,
    required this.updatedDateTime,
  });

  @override
  List<Object?> get props => [
        id,
        name,
        updatedDateTime,
      ];

  NoteGroupEntity copyWith({
    int? id,
    String? name,
    DateTime? updatedDateTime,
  }) {
    return NoteGroupEntity(
      id: id ?? this.id,
      name: name ?? this.name,
      updatedDateTime: updatedDateTime ?? this.updatedDateTime,
    );
  }
}
