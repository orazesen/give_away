enum GiveAwayOnboardingRoutes {
  main,
  signIn,
}

enum AuthProvider {
  password,
  google,
  apple,
  phone,
  facebook,
  twitter,
  github,
  yahoo,
  hotmail,
}

enum FirebaseAuthExceptionType {
  ///- **account-exists-with-different-credential**:
  ///  - Thrown if there already exists an account with the email address
  ///    asserted by the credential.
  ///    Resolve this by calling [fetchSignInMethodsForEmail] and then asking
  ///    the user to sign in using one of the returned providers.
  ///    Once the user is signed in, the original credential can be linked to
  ///    the user with [linkWithCredential].
  accountExistsWithDifferentCredential,

  /// - **user-disabled**:
  ///  - Thrown if the user corresponding to the given credential has been
  ///    disabled.
  userDisabled,

  /// - **user-not-found**:
  ///  - Thrown if signing in with a credential from [EmailAuthProvider.credential]
  ///    and there is no user corresponding to the given email.
  userNotFound,

  /// - **wrong-password**:
  ///  - Thrown if signing in with a credential from [EmailAuthProvider.credential]
  ///    and the password is invalid for the given email, or if the account
  ///    corresponding to the email does not have a password set.
  wrongPassword,

  /// - **invalid-verification-id**:
  ///  - Thrown if the credential is a [PhoneAuthProvider.credential] and the
  ///    verification ID of the credential is not valid.id.
  invalidVerificationId,

  /// - **provider-already-linked**:
  ///  - Thrown if the provider has already been linked to the user. This error
  ///    is thrown even if this is not the same provider's account that is
  ///    currently linked to the user.
  providerAlreadyLinked,

  /// - **invalid-credential**:
  ///  - Thrown if the provider's credential is not valid. This can happen if it
  ///    has already expired when calling link, or if it used invalid token(s).
  ///    See the Firebase documentation for your provider, and make sure you
  ///    pass in the correct parameters to the credential method.
  invalidCredential,

  /// - **credential-already-in-use**:
  ///  - Thrown if the account corresponding to the credential already exists
  ///    among your users, or is already linked to a Firebase User. For muratoraz,
  ///    this error could be thrown if you are upgrading an anonymous user to a
  ///    Google user by linking a Google credential to it and the Google
  ///    credential used is already associated with an existing Firebase Google
  ///    user. The fields `email`, `phoneNumber`, and `credential`
  ///    ([AuthCredential]) may be provided, depending on the type of
  ///    credential. You can recover from this error by signing in with
  ///    `credential` directly via [signInWithCredential]. Please note, you will
  ///    not recover from this error if you're using a [PhoneAuthCredential] to link
  ///    a provider to an account. Once an attempt to link an account has been made,
  ///    a new sms code is required to sign in the user.
  credentialAlreadyInUse,

  /// - **email-already-in-use**:
  ///  - Thrown if the email corresponding to the credential already exists
  ///    among your users. When thrown while linking a credential to an existing
  ///    user, an `email` and `credential` ([AuthCredential]) fields are also
  ///    provided. You have to link the credential to the existing user with
  ///    that email if you wish to continue signing in with that credential. To
  ///    do so, call [fetchSignInMethodsForEmail], sign in to `email` via one of
  ///    the providers returned and then [User.linkWithCredential] the original
  ///    credential to that newly signed in user.
  emailAlreadyInUse,

  /// - **operation-not-allowed**:
  ///  - Thrown if you have not enabled the provider in the Firebase Console. Go
  ///    to the Firebase Console for your project, in the Auth section and the
  ///    Sign in Method tab and configure the provider.
  operationNotAllowed,

  /// - **invalid-email**:
  ///  - Thrown if the password used in a [EmailAuthProvider.credential] is not
  ///    correct or when the user associated with the email does not have a
  ///    password.
  invalidEmail,

  /// - **invalid-verification-code**:
  ///  - Thrown if the credential is a [PhoneAuthProvider.credential] and the
  ///    verification code of the credential is not valid.
  invalidVerificationCode,
}
