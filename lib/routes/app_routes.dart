import 'package:Kios/views/pages/begin/begin_order_page.dart';
import 'package:Kios/views/pages/member/member_no_page.dart';
import 'package:get/get.dart';

class AppRoutes {
  static const INITIAL = '/begin';
  static final routes = [
    GetPage(
      name: '/begin',
      page: () => const BeginPage(),
    ),
    GetPage(
      name: '/memberNo',
      page: () => const MemberNoPage(),
    ),
  ];
}
