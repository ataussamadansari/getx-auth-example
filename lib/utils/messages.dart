import 'package:get/get.dart';

class Messages extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
    'en': {
      'app_name': 'My App',
      'signin': 'Sign In',
      'signup': 'Sign Up',
      'logout': 'Logout',
      'email': 'Email',
      'password': 'Password',
      'home': 'Home',
      'welcome': 'Welcome',
      'no_user': 'No User Found',
    },
    'hi': {
      'app_name': 'मेरा ऐप',
      'signin': 'साइन इन',
      'signup': 'साइन अप',
      'logout': 'लॉगआउट',
      'email': 'ईमेल',
      'password': 'पासवर्ड',
      'home': 'होम',
      'welcome': 'स्वागत है',
      'no_user': 'कोई यूज़र नहीं मिला',
    },
    'ur': {
      'app_name': 'میرا ایپ',
      'signin': 'لاگ ان',
      'signup': 'سائن اپ',
      'logout': 'لاگ آؤٹ',
      'email': 'ای میل',
      'password': 'پاس ورڈ',
      'home': 'ہوم',
      'welcome': 'خوش آمدید',
      'no_user': 'کوئی صارف نہیں ملا',
    }
  };
}