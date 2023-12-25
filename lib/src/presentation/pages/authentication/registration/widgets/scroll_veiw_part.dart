part of '../registration_page.dart';

class _ScrollViewPart extends StatelessWidget {
  const _ScrollViewPart({required this.children, this.formKey});
  final List<Widget> children;
  final GlobalKey<FormState>? formKey;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(
        horizontal: Dimensions.marginDefault,
      ),
      child: Form(
        key: formKey,
        child: Column(
          children: children,
        ),
      ),
    );
  }
}
