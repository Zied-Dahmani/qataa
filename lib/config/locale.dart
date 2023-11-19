import 'package:get/get.dart';

class Locale implements Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        'ar': {
          'appName': 'قاطع',
          'scanTitle': 'ثبت قبل ماتشري',
          'scanSubtitle': 'تنجم تكون سبب في تمويل الإبادة الي قاعد يقوم بها الكيان',
          'blacklistedTitle': 'قاطع',
          'blacklistSubtitle': 'الماركة تابعة الكيان بطريقة مباشرة ولا غير مباشرة',
          'notBlacklistedTitle': 'تنجم تشري',
          'notBlacklistSubtitle': 'كانك شاكك زيد ثبت و إسأل',
          'problemTitle': 'مشكلة',
          'productNotKnown': 'منتج معناش عليه معلومات',
          'connectivityProblem': 'ثبت في الإنترنت متاعك',
          'scanOnBoardingTitle': 'سكاني المنتج',
          'scanOnBoardingBody': 'بش تعرفو ضمن القائمة السوداء ولا تنجم تشريه',
          'emailOnBoardingTitle': 'استفسارات',
          'emailOnBoardingBody': 'كان تحب تسأل على حاجة تنجم تبعثلنا بريد إلكتروني',
        },
      };
}
