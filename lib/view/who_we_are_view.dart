import 'package:edu_lens/helper/app_constants.dart';
import 'package:edu_lens/view/widget/custom_app_bar.dart';
import 'package:edu_lens/view/widget/custom_text.dart';
import 'package:flutter/material.dart';

class HowWeAreView extends StatelessWidget {
  const HowWeAreView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomAppBar(
      title: "من نحن",
      widget: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        physics: const BouncingScrollPhysics(),
        child: Column(
            children: [
              BiuldMyCard(
                title: "رؤيتنا",
                details: "نتطلع إلى وجود بصمة ولمسة مؤثرة لنا في مجال التعليم والبرمجة والتكنولوجيا لتغيير مفهوم العالم عن التعليم الأونلاين و مجالات التكنولوجيا المختلفة",
              ),
              BiuldMyCard(
                  title: "هدفنا",
                  details: " تقديم كافة وسائل الراحة للطالب لأداء العملية التعليمية ."

              ),
              BiuldMyCard(
                  title: "خدماتنا التعليمية",
                  details: "نهتم بـ إدارة المحتوى الخاص بالمدرس عن طريق خطة كاملة للتسويق و إدارة الصفحات الخاصة به "


              ),
              BiuldMyCard(
                  title: "خدماتنا التقنية",
                  details: "نبدأ بتوصيل المعلومات عن طريق عدسة كاميراتنا ليستطيع الطالب الارتقاء بمستوى المنظومة التعليمية ، عن طريق منصة متخصصة في مجالات التعليم المختلفة من تصوير المحتوى وتقديمه عبر الموقع والتطبيق الخاصين بالمنصة"


              ),
const SizedBox(height: 30,),

            ]),
      ),
    );
  }
  Widget BiuldMyCard({required String title , required String details})=>Padding(
    padding: const EdgeInsets.all(20),
    child: Container(
      width: double.infinity,
      height: 210,
      decoration: BoxDecoration(
        boxShadow: const [
          BoxShadow(
            color: AppConstants.lightPrimaryColor,
            spreadRadius: 2,
            blurRadius: 10,
            offset: Offset(4, 4),
          ),
          BoxShadow(
            color: Colors.white,
            spreadRadius: 2,
            blurRadius: 10,
            offset: Offset(-4, -4),
          )
        ],
        color: Colors.white,
        borderRadius: BorderRadius.circular(25),
      ),
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomText(
                  text: title,
                  fontSize: 40,
                ),
                // const SizedBox(
                //   width: 20,
                // ),
                // const Icon(Icons.ac_unit, color: primaryColor, size: 30),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              width: double.infinity,
              height: 2,
              color: AppConstants.lightPrimaryColor,
            ),
            const SizedBox(
              height: 10,
            ),
            Expanded(
              child: CustomText(
                fontSize: 30,
                text:
                details
                ,
              ),
            )
          ],
        ),
      ),
    ),
  );
}