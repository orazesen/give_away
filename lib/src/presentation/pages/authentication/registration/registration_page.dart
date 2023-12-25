import 'package:auto_route/auto_route.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:give_away/app/di/injector.dart';
import 'package:give_away/app/localization/localizations.dart';
import 'package:give_away/src/core/const.dart';
import 'package:give_away/src/core/enums.dart';
import 'package:give_away/src/domain/enteties/app_user.dart';
import 'package:give_away/src/domain/types/common_date.dart';
import 'package:give_away/src/domain/types/email.dart';
import 'package:give_away/src/domain/types/auth_provider.dart';
import 'package:give_away/src/domain/types/id.dart';
import 'package:give_away/src/domain/types/name.dart';
import 'package:give_away/src/domain/types/phone.dart';
import 'package:give_away/src/domain/types/photo.dart';
import 'package:give_away/src/domain/types/tare_tag_date_time.dart';
import 'package:give_away/src/presentation/pages/authentication/login/cubit/login_cubit.dart';
import 'package:give_away/src/presentation/pages/authentication/registration/cubit/registration_cubit.dart';
import 'package:give_away/src/presentation/shared/utils/validator.dart';
import 'package:give_away/src/presentation/shared/widgets/give_away_app_bar.dart';
import 'package:give_away/src/presentation/shared/widgets/give_away_button.dart';
import 'package:give_away/src/presentation/shared/widgets/give_away_sign_in_with_button.dart';
import 'package:give_away/src/presentation/shared/widgets/give_away_text_form_field.dart';
import 'package:give_away/src/presentation/theme/constants/dimensions.dart';
import 'package:give_away/src/presentation/theme/give_away_theme.dart';
import 'package:give_away/src/presentation/theme/palette/give_away_colors.dart';
import 'package:give_away/src/presentation/theme/theme_extensions.dart';
import 'package:intl/intl.dart';

part './widgets/sign_up_part.dart';
part './widgets/create_user_part.dart';
part './widgets/scroll_veiw_part.dart';
part './widgets/email_confirmation_part.dart';

@RoutePage()
class RegistrationPage extends StatefulWidget {
  const RegistrationPage({super.key});

  @override
  State<RegistrationPage> createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage>
    with SingleTickerProviderStateMixin {
  final TextEditingController _emailController = TextEditingController();

  final TextEditingController _passwordController = TextEditingController();

  final TextEditingController _confirmPasswordController =
      TextEditingController();

  final TextEditingController _firstnameController = TextEditingController();

  final TextEditingController _lastnameController = TextEditingController();

  final TextEditingController _phoneController = TextEditingController();

  AuthProvider _authProvider = AuthProvider.password;

  final ValueNotifier<DateTime?> _birthDateNotifier = ValueNotifier(null);
  final DateFormat _dateFormat = DateFormat('dd.MM.yyyy');

  final _registrationCubit = i<RegistrationCubit>();

  final _loginCubit = i<LoginCubit>();

  late TabController _tabController;

  late List<String> _menus;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(
      length: 3,
      vsync: this,
      initialIndex: 0,
    );
  }

  @override
  void dispose() {
    _registrationCubit.close();
    _loginCubit.close();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    _firstnameController.dispose();
    _lastnameController.dispose();
    _phoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _menus = [
      context.localization.sign_up,
      context.localization.confirmation,
      context.localization.create_user,
    ];
    return Scaffold(
      appBar: GiveAwayAppBar(
        pageName: context.localization.back,
      ),
      body: SafeArea(
        child: BlocConsumer<RegistrationCubit, RegistrationState>(
          bloc: _registrationCubit,
          listener: (context, state) {
            state.whenOrNull(
              signedUp: () {
                _tabController.animateTo(_tabController.index + 1);
              },
            );
          },
          builder: (context, state) {
            return Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: Dimensions.marginDefault,
                    vertical: Dimensions.marginDefault,
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      for (int i = 0; i < _menus.length; i++)
                        Row(
                          children: [
                            Text(
                              _menus[i],
                              style: context.theme.base.copyWith(
                                color: i < _tabController.index
                                    ? GiveAwayColors.black
                                    : i > _tabController.index
                                        ? GiveAwayColors.neutral.shade500
                                        : GiveAwayColors.primary.shade500,
                              ),
                            ),
                            if (i < _menus.length - 1)
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: Dimensions.marginMicro,
                                ),
                                child: Icon(
                                  Icons.arrow_forward_ios,
                                  size: Dimensions.xxSmallSize,
                                  color: i < _tabController.index
                                      ? GiveAwayColors.black
                                      : i > _tabController.index
                                          ? GiveAwayColors.neutral.shade500
                                          : GiveAwayColors.primary.shade500,
                                ),
                              ),
                          ],
                        ),
                    ],
                  ),
                ),
                Expanded(
                  child: TabBarView(
                    controller: _tabController,
                    physics: const NeverScrollableScrollPhysics(),
                    children: [
                      _SignUpPart(
                        registrationCubit: _registrationCubit,
                        loginCubit: _loginCubit,
                        emailController: _emailController,
                        passwordController: _passwordController,
                        confirmPasswordController: _confirmPasswordController,
                        tabController: _tabController,
                      ),
                      _EmailConfirmationPart(
                        email: _emailController.text,
                        tabController: _tabController,
                        registrationCubit: _registrationCubit,
                      ),
                      _CreateUserPart(
                        firstnameController: _firstnameController,
                        lastnameController: _lastnameController,
                        birthDateNotifier: _birthDateNotifier,
                        dateFormat: _dateFormat,
                        tabController: _tabController,
                      ),
                    ],
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  void _signUp() {
    // final appUser = AppUser(
    //   id: Id.none(),
    //   name: Name(
    //       firstname: _firstnameController.text,
    //       lastname: _lastnameController.text),
    //   provider: SignInAuthProvider(authProvider: _authProvider.name),
    //   email: Email(
    //       email: _emailController.text, password: _passwordController.text),
    //   emailVerified: false,
    //   isAnonymous: false,
    //   phone: Phone(phoneNumber: _phoneController.text),
    //   photo: Photo(
    //     photoPath: '',
    //     photoUrl: '',
    //   ),
    //   birthDate: GiveAwayDateTime(date: _birthDateNotifier.value!),
    //   date: CommonDate(
    //     createdAt: GiveAwayDateTime(date: DateTime.now()),
    //     updatedAt: GiveAwayDateTime(date: MagicDefaults.firstDatePossible),
    //     deletedAt: GiveAwayDateTime(date: MagicDefaults.firstDatePossible),
    //   ),
    // );
    _registrationCubit.singUp(_emailController.text, _passwordController.text);
  }
}
