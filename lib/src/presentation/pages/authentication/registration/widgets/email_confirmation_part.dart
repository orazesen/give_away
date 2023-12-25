part of '../registration_page.dart';

class _EmailConfirmationPart extends StatelessWidget {
  const _EmailConfirmationPart({
    super.key,
    required this.tabController,
  });

  final TabController tabController;

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
            context.localization
                .email_confirmation_text('esenow.orazgeldi@gmail.com'),
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
              tabController.animateTo(tabController.index - 1);
              // if (_formKey.currentState!.validate()) {
              //   _signUp();
              // } else {
              //   ScaffoldMessenger.of(context).showSnackBar(
              //     const SnackBar(
              //       content: Text(
              //         'Complete form!',
              //       ),
              //     ),
              //   );
              // }
            },
          ),
          Spacer(),
          Row(
            children: [
              Expanded(
                child: GiveAwayButton.text(
                  text: context.localization.edit_email,
                  onPressed: () {
                    tabController.animateTo(tabController.index - 1);
                    // if (_formKey.currentState!.validate()) {
                    //   _signUp();
                    // } else {
                    //   ScaffoldMessenger.of(context).showSnackBar(
                    //     const SnackBar(
                    //       content: Text(
                    //         'Complete form!',
                    //       ),
                    //     ),
                    //   );
                    // }
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
