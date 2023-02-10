import 'package:edu_lens/helper/app_constants.dart';
import 'package:edu_lens/helper/app_constants.dart';
import 'package:edu_lens/view/widget/custom_app_bar.dart';
import 'package:edu_lens/view/widget/custom_image_url_view.dart';
import 'package:edu_lens/view/widget/custom_list_view.dart';
import 'package:edu_lens/view/widget/custom_text.dart';
import 'package:flutter/material.dart';

class HomeWorkView extends StatelessWidget {
  const HomeWorkView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomAppBar(
        title: "عنوان الواجب",
        widget: Padding(
          padding: const EdgeInsets.only(top: 5.0, right: 5, left: 5,bottom: 5),

          child: CustomListView(
            itemCount: 10,
            itemBuilder: (context, index) {
              return Container(

                decoration: BoxDecoration(
                  border: Border.all(color: AppConstants.primaryColor, width: 2.0),
                  borderRadius: BorderRadius.circular(30),
                ),
                //              height: 400,
                child: Padding(
                  padding: const EdgeInsets.only(top: 4.0, right: 5, left: 5,),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const SizedBox(
                          height: 10,
                        ),
                        //رقم السوال
                        CustomText(
                          text: "( ${
                              // index+
                              1} )",
                          fontSize: 30,
                        ),
                        const SizedBox(
                          height: 10,
                        ),

                        //الصوره
                        CustomImageUrlView(
                          image:
                              "https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80",
                          colorLodingIcon: AppConstants.primaryColor,
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        //السوال
                        CustomText(
                          text: "السوال السوال السوال السوال",
                          textDirection: TextDirection.ltr,
                          fontSize: 20,
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        //الازرار
                        for (int i = 0; i < 4; i++)
                          Padding(
                            padding: const EdgeInsets.only(left: 10.0, right: 10),
                            child: InkWell(
                                onTap: () async {},
                                child: Container(
                                    width: 300,
                                    padding: const EdgeInsets.only(
                                        top: 9, bottom: 9, right: 7, left: 7),
                                    margin: const EdgeInsets.only(top: 20),
                                    decoration: BoxDecoration(
                                      color: AppConstants.primaryColor,
                                      border: Border.all(
                                          color: AppConstants.primaryColor, width: 2.0),
                                      borderRadius: BorderRadius.circular(30.0),
                                    ),
                                    child: Center(
                                        child: CustomText(
                                      text: "الاجابة $i",
                                      fontSize: 18,
                                      textDirection: TextDirection.ltr,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                    )))),
                          ),
                        const SizedBox(
                          height: 20,
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ));
  }
}
