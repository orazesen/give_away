// import 'package:give_away/src/data/models/app_user/app_user_model.dart';
// import 'package:give_away/src/domain/enteties/history.dart';
// import 'package:give_away/src/domain/types/firebase_auth_provider.dart';
// import 'package:give_away/src/domain/types/name.dart';
// import 'package:give_away/src/domain/types/email.dart';
// import 'package:give_away/src/domain/types/phone.dart';
// import 'package:give_away/src/domain/types/photo_url.dart';
// import 'package:give_away/src/domain/types/id.dart';
// import 'package:give_away/src/domain/types/tare_tag_date_time.dart';

// class AppUser {
//   const AppUser({
//     required this.id,
//     required this.firstname,
//     required this.lastname,
//     required this.provider,
//     required this.email,
//     required this.emailVerified,
//     required this.isAnonymous,
//     required this.isRegistered,
//     required this.phone,
//     required this.photoUrl,
//     required this.histories,
//     required this.createdAt,
//     required this.updatedAt,
//   });
//   final Id id;
//   final Name firstname;
//   final Name lastname;
//   final FirebaseAuthProvider provider;
//   final Email email;
//   final bool emailVerified;
//   final bool isAnonymous;
//   final bool isRegistered;
//   final Phone phone;
//   final PhotoUrl photoUrl;
//   final List<History> histories;
//   final give_awayDateTime createdAt;
//   final give_awayDateTime updatedAt;

//   factory AppUser.fromModel(AppUserModel model) {
//     return AppUser(
//       id: Id(
//         id: model.id,
//       ),
//       firstname: Name(
//         text: model.firstname ?? '',
//       ),
//       lastname: Name(
//         text: model.lastname ?? '',
//       ),
//       provider: FirebaseAuthProvider(
//         provider: model.provider,
//       ),
//       email: Email(
//         email: model.email ?? '',
//       ),
//       emailVerified: model.verified,
//       isAnonymous: model.anonymous,
//       isRegistered: model.registered,
//       phone: Phone(
//         phoneNumber: model.phoneNumber ?? '',
//       ),
//       photoUrl: PhotoUrl(
//         photoUrl: model.photoUrl ?? '',
//       ),
//       histories: (model.histories ?? [])
//           .map<History>((historyModel) => History.fromModel(historyModel))
//           .toList(),
//       createdAt: give_awayDateTime(
//         date: model.createdAt,
//       ),
//       updatedAt: give_awayDateTime(
//         date: model.updatedAt,
//       ),
//     );
//   }
//   AppUserModel toModel() {
//     return AppUserModel(
//       id: id.id,
//       firstname: firstname.text.isEmpty ? null : firstname.text,
//       lastname: lastname.text.isEmpty ? null : lastname.text,
//       email: email.email.isEmpty ? null : email.email,
//       verified: emailVerified,
//       anonymous: isAnonymous,
//       registered: isRegistered,
//       phoneNumber: phone.phoneNumber.isEmpty ? null : phone.phoneNumber,
//       photoUrl: photoUrl.photoUrl.isEmpty ? null : photoUrl.photoUrl,
//       histories:
//           histories.isEmpty ? null : histories.map((e) => e.toModel()).toList(),
//       createdAt: createdAt.date,
//       updatedAt: updatedAt.date,
//       provider: provider.provider,
//     );
//   }

//   @override
//   String toString() {
//     return 'AppUser(id: $id, firstname: $firstname, lastname:$lastname, provider: $provider, email: $email, emailVerified: $emailVerified, isAnonymous: $isAnonymous, isRegistered: $isRegistered, photoUrl: $photoUrl, phone: $phone, createdAt: $createdAt, updatedAt: $updatedAt)';
//   }
// }
