part of '../registration_page.dart';

class _CreateUserPart extends StatelessWidget {
  const _CreateUserPart({
    required this.firstnameController,
    required this.lastnameController,
    required this.birthDateNotifier,
    required this.dateFormat,
    required this.tabController,
  });

  final TextEditingController firstnameController;
  final TextEditingController lastnameController;
  final ValueNotifier<DateTime?> birthDateNotifier;
  final DateFormat dateFormat;
  final TabController tabController;

  @override
  Widget build(BuildContext context) {
    return _ScrollViewPart(
      children: [
        const SizedBox(
          height: Dimensions.margin4x,
        ),
        const CircleAvatar(
          radius: Dimensions.size4x,
          child: Icon(
            Icons.person,
            size: Dimensions.size4x,
          ),
        ),
        const SizedBox(
          height: Dimensions.marginBig,
        ),
        const SizedBox(
          height: Dimensions.marginDefault,
        ),
        GiveAwayTextFormField.name(
          labelText: context.localization.firstname,
          controller: firstnameController,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return context.localization.field_must_be_filled;
            }
            return null;
          },
        ),
        const SizedBox(
          height: Dimensions.marginDefault,
        ),
        GiveAwayTextFormField.name(
          labelText: context.localization.lastname,
          controller: lastnameController,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return context.localization.field_must_be_filled;
            }
            return null;
          },
        ),
        const SizedBox(
          height: Dimensions.marginDefault,
        ),
        GestureDetector(
          onTap: () async {
            final selectedDate = await showDatePicker(
              context: context,
              firstDate: MagicDefaults.firstDatePossible,
              lastDate: DateTime.now(),
              currentDate: birthDateNotifier.value,
              initialDate: birthDateNotifier.value ?? DateTime.now(),
            );
            if (selectedDate != null) {
              birthDateNotifier.value = selectedDate;
            }
          },
          child: ValueListenableBuilder(
            valueListenable: birthDateNotifier,
            builder: (context, value, child) => GiveAwayTextFormField.date(
              labelText: context.localization.birth_date,
              controller: TextEditingController(
                text: birthDateNotifier.value != null
                    ? dateFormat.format(
                        birthDateNotifier.value!,
                      )
                    : '',
              ),
            ),
          ),
        ),
        const SizedBox(
          height: Dimensions.marginRegular,
        ),
        Row(
          children: [
            Expanded(
              child: GiveAwayButton.text(
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
                text: context.localization.back,
              ),
            ),
            const SizedBox(
              width: Dimensions.marginDefault,
            ),
            Expanded(
              child: GiveAwayButton.text(
                onPressed: () {
                  tabController.animateTo(tabController.index + 1);
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
                text: context.localization.create_user,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
