import 'package:get/get.dart';

class Locale implements Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        'ar': {
          'appName': 'قاطع',
          'scanTitle': 'ثبت قبل ماتشري',
          'scanSubtitle': 'تنجم تكون سبب في تمويل الإبادة الي قاعد يقوم بها الكيان',
          'boycottedTitle': 'قاطع',
          'boycottedSubtitle': 'المنتج تابع الكيان بطريقة مباشرة أو غير مباشرة',
          'supportedTitle': 'تنجم تشري',
          'supportedSubtitle': 'كانك شاكك زيد ثبت و إسأل',
          'productNotKnownTitle': 'منتج',
          'productNotKnownSubtitle': 'معناش عليه معلومات',
          'connectivityProblemTitle': 'إنترنت',
          'connectivityProblemSubtitle': 'ثبت عندك إنترنت ولا',
          'scanOnBoardingTitle': 'سكاني المنتج',
          'scanOnBoardingBody': 'بش تعرفو موجود في قائمة المقاطعة ولا تنجم تشريه',
          'emailOnBoardingTitle': 'استفسارات',
          'emailOnBoardingBody': 'كان تحب تسأل على حاجة تنجم تبعثلنا بريد إلكتروني',
          'alertTitle': 'تنبيه',
          'alertSubtitle': 'كل مرة قاعدين نزيدو في منتج إلى قائمة المقاطعة.',
          'ok': 'مفهوم',
        },
      };
}
