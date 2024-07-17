//import 'package:ajrli/views/screens/onboarding/onboarding.dart';
import 'package:get/get.dart';
import 'package:petcare/core/constants/routes_names.dart';
import 'package:petcare/views/screens/add/addanimal.dart';
import 'package:petcare/views/screens/add/adddoctor.dart';
import 'package:petcare/views/screens/add/addshop.dart';
import 'package:petcare/views/screens/auth/addpet.dart';
import 'package:petcare/views/screens/auth/auth.dart';
import 'package:petcare/views/screens/auth/forgetpass.dart';
import 'package:petcare/views/screens/auth/newpass.dart';
import 'package:petcare/views/screens/auth/signup.dart';
import 'package:petcare/views/screens/auth/verifyOTP.dart';
import 'package:petcare/views/screens/home/seeall/details.dart';
import 'package:petcare/views/screens/home/seeall/dissapeared.dart';
import 'package:petcare/views/screens/home/seeall/find.dart';
import 'package:petcare/views/screens/homepage.dart';
import 'package:petcare/views/screens/infos/docinfo.dart';
import 'package:petcare/views/screens/infos/petinfo.dart';
import 'package:petcare/views/screens/permissions/location.dart';
import 'package:petcare/views/screens/permissions/notifications.dart';
import 'package:petcare/views/screens/scan/nfcscan.dart';
import 'package:petcare/views/screens/scan/qrcodescan.dart';
import 'package:petcare/views/screens/scan/scan.dart';
import 'package:petcare/views/screens/settings/changepass.dart';
import 'package:petcare/views/screens/settings/editprofile.dart';
import 'package:petcare/views/screens/settings/settings.dart';

List<GetPage<dynamic>> routes = [
  GetPage(name: '/', page: () => const Auth()),
  GetPage(name: AppRoutesNames.signup, page: () => const Signup()),
  GetPage(name: AppRoutesNames.addpet, page: () => const Addpet()),
  GetPage(
      name: AppRoutesNames.enablelocation, page: () => const EnableLocation()),
  GetPage(name: AppRoutesNames.enablenotify, page: () => const EnableNotify()),
  GetPage(name: AppRoutesNames.homepage, page: () => const Homepage()),
  GetPage(name: AppRoutesNames.addanimal, page: () => const Addanimal()),
  GetPage(name: AppRoutesNames.adddoctor, page: () => const Adddoctor()),
  GetPage(name: AppRoutesNames.addshop, page: () => const Addshop()),
  GetPage(name: AppRoutesNames.docinfo, page: () => const Docinfo()),
  GetPage(name: AppRoutesNames.petinfo, page: () => const Petinfo()),
  GetPage(name: AppRoutesNames.settings, page: () => const Settings()),
  GetPage(name: AppRoutesNames.editprofile, page: () => const Editprofile()),
  GetPage(name: AppRoutesNames.changepass, page: () => const Changepass()),
  GetPage(name: AppRoutesNames.forgetPass, page: () => const Forgetpass()),
  GetPage(name: AppRoutesNames.verifyOtp, page: () => const Verifyotp()),
  GetPage(name: AppRoutesNames.successReset, page: () => const Newpass()),
  GetPage(name: AppRoutesNames.seeallD, page: () => const SeeallD()),
  GetPage(name: AppRoutesNames.seeallF, page: () => const SeeallF()),
  GetPage(name: AppRoutesNames.details, page: () => const Details()),
  GetPage(name: AppRoutesNames.scanScreen, page: () => const Scan()),
  GetPage(name: AppRoutesNames.nfcScan, page: () => const NFCScannerPage()),
  GetPage(
      name: AppRoutesNames.qrcodeScan, page: () => const QRCodeScannerPage()),
];
