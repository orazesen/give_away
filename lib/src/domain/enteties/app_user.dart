import 'package:give_away/src/core/const.dart';
import 'package:give_away/src/data/models/app_user/app_user_model.dart';
import 'package:give_away/src/domain/types/auth_provider.dart';
import 'package:give_away/src/domain/types/name.dart';
import 'package:give_away/src/domain/types/email.dart';
import 'package:give_away/src/domain/types/phone.dart';
import 'package:give_away/src/domain/types/photo.dart';
import 'package:give_away/src/domain/types/id.dart';
import 'package:give_away/src/domain/types/tare_tag_date_time.dart';
import 'package:give_away/src/domain/types/common_date.dart';

class AppUser {
  const AppUser({
    required this.id,
    required this.name,
    required this.provider,
    required this.email,
    required this.emailVerified,
    required this.isAnonymous,
    required this.phone,
    required this.photo,
    required this.birthDate,
    required this.date,
  });
  final Id id;
  final Name name;
  final SignInAuthProvider provider;
  final Email email;
  final bool emailVerified;
  final bool isAnonymous;
  final Phone phone;
  final Photo photo;
  final GiveAwayDateTime birthDate;
  final CommonDate date;

  factory AppUser.fromModel(AppUserModel model) {
    return AppUser(
      id: Id(
        id: model.id ?? '',
      ),
      name: Name(
        firstname: model.firstname ?? '',
        lastname: model.lastname ?? '',
      ),
      provider: SignInAuthProvider(
        authProvider: model.provider ?? '',
      ),
      email: Email(
        email: model.email ?? '',
        password: model.password ?? '',
      ),
      emailVerified: model.emailVerified,
      isAnonymous: model.isAnonymous,
      phone: Phone(
        phoneNumber: model.phoneNumber ?? '',
      ),
      photo: Photo(
        photoPath: model.photoPath ?? '',
        photoUrl: model.photoUrl ?? '',
      ),
      birthDate: GiveAwayDateTime(
          date: model.birthDate ?? MagicDefaults.firstDatePossible),
      date: CommonDate(
        createdAt: GiveAwayDateTime(
            date: model.createdAt ?? MagicDefaults.firstDatePossible),
        updatedAt: GiveAwayDateTime(
            date: model.createdAt ?? MagicDefaults.firstDatePossible),
        deletedAt: GiveAwayDateTime(
            date: model.createdAt ?? MagicDefaults.firstDatePossible),
      ),
    );
  }
  AppUserModel toModel() {
    return AppUserModel(
      id: id.id,
      firstname: name.firstname.isEmpty ? null : name.firstname,
      lastname: name.firstname.isEmpty ? null : name.firstname,
      email: email.email.isEmpty ? null : email.email,
      password: email.password.isEmpty ? null : email.password,
      provider: provider.authProvider,
      emailVerified: emailVerified,
      isAnonymous: isAnonymous,
      phoneNumber: phone.phoneNumber,
      photoPath: photo.photoPath,
      photoUrl: photo.photoUrl,
      birthDate: birthDate.date == MagicDefaults.firstDatePossible
          ? null
          : birthDate.date,
      createdAt: date.createdAt.date == MagicDefaults.firstDatePossible
          ? null
          : date.createdAt.date,
      updatedAt: date.updatedAt.date == MagicDefaults.firstDatePossible
          ? null
          : date.updatedAt.date,
      deletedAt: date.deletedAt.date == MagicDefaults.firstDatePossible
          ? null
          : date.deletedAt.date,
    );
  }

  @override
  String toString() {
    return 'AppUser(id: $id, name: $name, provider: $provider, email: $email, emailVerified: $emailVerified, isAnonymous: $isAnonymous, photo: $photo, phone: $phone, date: $date,)';
  }
}
