part of '../registration_page.dart';

class _EmailConfirmationPart extends StatelessWidget {
  const _EmailConfirmationPart({
    required this.email,
    required this.tabController,
    required this.registrationCubit,
    required this.timer,
  });

  final TabController tabController;
  final RegistrationCubit registrationCubit;
  final String email;
  final Timer? timer;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: Dimensions.marginDefault,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Spacer(),
          Text(
            context.localization.email_confirmation,
            style: context.theme.h3,
          ),
          const SizedBox(
            height: Dimensions.marginMiddle,
          ),
          Text(
            context.localization.email_confirmation_text(email),
            style: context.theme.base.copyWith(
              color: GiveAwayColors.black,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: Dimensions.marginMiddle,
          ),
          GiveAwayButton.text(
            text: context.localization.resent_confirmation_email,
            textColor: context.theme.theme.primaryColor,
            backgroundColor: Colors.transparent,
            onPressed: () {
              registrationCubit.resendEmail(email: email);
            },
          ),
          const Spacer(),
          Row(
            children: [
              Expanded(
                child: GiveAwayButton.text(
                  text: context.localization.edit_email,
                  onPressed: () {
                    timer?.cancel();
                    tabController.animateTo(tabController.index - 1);
                  },
                ),
              ),
              const SizedBox(
                width: Dimensions.marginDefault,
              ),
              Expanded(
                child: GiveAwayButton.animated(
                  text: context.localization.waiting,
                  iconName: Icons.sync,
                  onPressed: () {},
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
