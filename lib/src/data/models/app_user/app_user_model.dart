import 'package:freezed_annotation/freezed_annotation.dart';

part 'app_user_model.freezed.dart';
part 'app_user_model.g.dart';

@freezed
class AppUserModel with _$AppUserModel {
  const factory AppUserModel({
    required String? id,
    required String? email,
    String? firstname,
    String? lastname,
    String? provider,
    @JsonKey(includeFromJson: false, includeToJson: false) String? password,
    @Default(false) @JsonKey(name: 'email_verified') bool emailVerified,
    @Default(true) @JsonKey(name: 'is_anonymous') bool isAnonymous,
    @JsonKey(name: 'photo_path') String? photoPath,
    @JsonKey(name: 'photo_url') String? photoUrl,
    @JsonKey(name: 'phone_number') String? phoneNumber,
    @JsonKey(name: 'birth_date') DateTime? birthDate,
    @JsonKey(name: 'created_at') DateTime? createdAt,
    @JsonKey(name: 'updated_at') DateTime? updatedAt,
    @JsonKey(name: 'deleted_at') DateTime? deletedAt,
  }) = _AppUserModel;

  factory AppUserModel.fromJson(Map<String, Object?> json) =>
      _$AppUserModelFromJson(json);
}
