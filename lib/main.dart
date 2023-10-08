import 'package:give_away/app/app.dart';
import 'package:give_away/bootstrap.dart';

void main() {
  bootstrap((version) => App(androidSdkVersion: version));
}
