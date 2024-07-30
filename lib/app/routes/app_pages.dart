import 'package:cfo_app/app/modules/account_payables/binding/account_payables_binding.dart';
import 'package:cfo_app/app/modules/account_payables/view/account_payables_view.dart';
import 'package:cfo_app/app/modules/account_reclassification/binding/account_reclassification_binding.dart';
import 'package:cfo_app/app/modules/all_creditors/binding/all_creditor_binding.dart';
import 'package:cfo_app/app/modules/all_creditors/view/all_creditor_view.dart';
import 'package:cfo_app/app/modules/ar_with_credit_balance/binding/ar_with_credit_balance_binding.dart';
import 'package:cfo_app/app/modules/ar_with_credit_balance/view/ar_with_credit_balance_view.dart';
import 'package:cfo_app/app/modules/cash_flow/bindings/cash_flow_binding.dart';
import 'package:cfo_app/app/modules/cash_flow/view/cash_flow_screen.dart';
import 'package:cfo_app/app/modules/financial_projection/binding/financial_projection_binding.dart';
import 'package:cfo_app/app/modules/financial_projection/view/financial_projection_view.dart';
import 'package:cfo_app/app/modules/financial_projection_summary/view/financial_projection_summary.dart';
import 'package:cfo_app/app/modules/forgot_password/binding/forgot_password_binding.dart';
import 'package:cfo_app/app/modules/key_ratio_analysis/binding/key_ratio_analysis_binding.dart';
import 'package:cfo_app/app/modules/key_ratio_analysis/view/key_ratio_analysis_view.dart';
import 'package:cfo_app/app/modules/notification/binding/notification_binding.dart';
import 'package:cfo_app/app/modules/notification/view/notification_view.dart';
import 'package:cfo_app/app/modules/profile/binding/profile_binding.dart';
import 'package:cfo_app/app/modules/profile/controller/profile_controller.dart';
import 'package:cfo_app/app/modules/profile/view/profile_view.dart';
import 'package:cfo_app/app/modules/purchase_order_list/binding/purchase_order_list_binding.dart';
import 'package:cfo_app/app/modules/purchase_order_list/view/purchase_order_list_view.dart';
import 'package:cfo_app/app/modules/purchase_orders/binding/purchase_order_binding.dart';
import 'package:cfo_app/app/modules/purchase_orders/view/purchase_order_view.dart';
import 'package:cfo_app/app/modules/tds_check/binding/tds_check_binding.dart';
import 'package:cfo_app/app/modules/tds_check/view/tds_check_view.dart';
import 'package:cfo_app/app/modules/top_10_debtors_creditors/binding/top_debtors_creditors_binding.dart';
import 'package:cfo_app/app/modules/variance_analysis/binding/variance_analysis_binding.dart';
import 'package:cfo_app/app/modules/variance_analysis/view/variance_analysis_view.dart';
import 'package:get/get.dart';
import '../modules/Splash/bindings/splash_binding.dart';
import '../modules/Splash/views/splash_view.dart';
import '../modules/accountVerfiy/bindings/account_verfiy_binding.dart';
import '../modules/accountVerfiy/views/account_verfiy_view.dart';
import '../modules/account_reclassification/view/account_reclassification_view.dart';
import '../modules/dashBoard/bindings/dash_board_binding.dart';
import '../modules/dashBoard/views/dash_board_view.dart';
import '../modules/financial_projection_summary/binding/financial_projection_summary_binding.dart';
import '../modules/forgot_password/view/forgot_password_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/onBoarding/bindings/on_boarding_binding.dart';
import '../modules/onBoarding/views/on_boarding_view.dart';
import '../modules/signIn/bindings/sign_in_binding.dart';
import '../modules/signIn/views/sign_in_view.dart';
import '../modules/signUp/bindings/sign_up_binding.dart';
import '../modules/signUp/views/sign_up_view.dart';
import '../modules/top_10_debtors_creditors/view/top_debtors_creditors_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.SPLASH;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.SPLASH,
      page: () => const SplashView(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: _Paths.ON_BOARDING,
      page: () => OnBoardingView(),
      binding: OnBoardingBinding(),
    ),
    GetPage(
      name: _Paths.SIGN_IN,
      page: () => SignInView(),
      binding: SignInBinding(),
    ),
    GetPage(
      name: _Paths.SIGN_UP,
      page: () => SignUpView(),
      binding: SignUpBinding(),
    ),
    GetPage(
      name: _Paths.ACCOUNT_VERFIY,
      page: () => const AccountVerfiyView(),
      binding: AccountVerfiyBinding(),
    ),
    GetPage(
      name: _Paths.DASH_BOARD,
      page: () => DashBoardView(),
      binding: DashBoardBinding(),
    ),
    GetPage(
      name: _Paths.CASH_FLOW,
      page: () => CashFlowScreen(),
      binding: CashflowBinding(),
    ),
    GetPage(
      name: _Paths.ALL_CREDITOR,
      page: () => AllCreditorView(),
      binding: AllCreditorBinding(),
    ),
    GetPage(
      name: _Paths.ACCOUNT_PAYABLES,
      page: () => AccountPayablesView(),
      binding: AccountPayablesBinding(),
    ),
    GetPage(
      name: _Paths.KEY_RATIO_ANALYSIS,
      page: () => KeyRatioAnalsisView(),
      binding: KeyRatioAnalsisBinding(),
    ),
    GetPage(
      name: _Paths.AR_WITH_CREDIT_BALANCE,
      page: () => ArWithCreditBalanceView(),
      binding: ArWithCreditBalanceBinding(),
    ),
    GetPage(
      name: _Paths.TOP_DEBTORS_CREDITORS,
      page: () => TopDebtorsCreditorsView(),
      binding: TopDetorsCreditorsBinding(),
    ),
    GetPage(
      name: _Paths.PURCHASE_ORDER,
      page: () => PurchaseOrderView(),
      binding: PurchaseOrderBinding(),
    ),
    GetPage(
      name: _Paths.FINACIAL_PROJECTION,
      page: () => FinancialProjectionView(),
      binding: FinancialProjectionBinding(),
    ),
    GetPage(
      name: _Paths.FINACIAL_PROJECTION_SUMMARY,
      page: () => FinancialProjectionSummary(),
      binding: FinancialProjectionSummaryBinding(),
    ),
    GetPage(
      name: _Paths.NOTIFICATION,
      page: () => NotificationView(),
      binding: NotificationBinding(),
    ),
    GetPage(
      name: _Paths.FORGOT_PASSWORD,
      page: () => ForgotPasswordView(),
      binding: ForgotPasswordBinding(),
    ),
    GetPage(
      name: _Paths.PROFILE,
      page: () => ProfileView(),
      binding: ProfileBinding(),
    ),
    GetPage(
      name: _Paths.PURCHASE_ORDER_LIST,
      page: () => PurchaseOrderListView(),
      binding: PurchaseOrderListBinding(),
    ),
    GetPage(
      name: _Paths.ACCOUNT_RECLASSIFICATION,
      page: () => AccountReclassificationView(),
      binding: AccountReclassificationBinding(),
    ),
    GetPage(
      name: _Paths.VARIANCE_ANALYSIS,
      page: () => VarianceAnalysisView(),
      binding: VarianceAnalysisBinding(),
    ),
    GetPage(
      name: _Paths.TDS_CHECK,
      page: () => TdsCheckView(),
      binding: TdsCheckBinding(),
    ),
  ];
}
