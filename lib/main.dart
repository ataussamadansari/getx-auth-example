import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:getx_auth_example/bindings/home_binding.dart';
import 'package:getx_auth_example/bindings/initial_binding.dart';
import 'package:getx_auth_example/bindings/splash_binding.dart';
import 'package:getx_auth_example/middlewares/auth_middleware.dart';
import 'package:getx_auth_example/utils/messages.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'screens/auth/sign_in_screen.dart';
import 'screens/auth/sign_up_screen.dart';
import 'screens/splash/splash_screen.dart';
import 'screens/home/home_screen.dart';
import 'services/app_settings_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: '.env');
  await GetStorage.init();
  await Supabase.initialize(
    url: dotenv.env['SUPABASE_URL']!,
    anonKey: dotenv.env['SUPABASE_ANON_KEY']!,
  );
  Get.put(AppSettingsService(), permanent: true);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialBinding: InitialBinding(),
      translations: Messages(),
      locale: Locale(AppSettingsService.to.language),
      fallbackLocale: const Locale('en'),
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      themeMode: AppSettingsService.to.themeMode,
      getPages: [
        GetPage(
          name: '/',
          page: () => SplashScreen(),
          binding: SplashBinding(),
        ),
        GetPage(
          name: '/signin',
          page: () => SignInScreen(),
          middlewares: [AuthMiddleware()],
        ),
        GetPage(
          name: '/signup',
          page: () => SignUpScreen(),
          middlewares: [AuthMiddleware()],
        ),
        GetPage(
          name: '/home',
          page: () => HomeScreen(),
          binding: HomeBinding(),
          middlewares: [AuthMiddleware()],
        ),
      ],
    );
  }
}
