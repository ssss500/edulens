import 'package:edu_lens/helper/app_constants.dart';
import 'package:edu_lens/helper/app_constants.dart';
import 'package:edu_lens/view/quiz/question_view.dart';
import 'package:edu_lens/view/widget/custom_list_view.dart';
import 'package:edu_lens/view/widget/custom_text.dart';
import 'package:expansion_tile_card/expansion_tile_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class QuestionBank extends StatelessWidget {
  QuestionBank({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return SingleChildScrollView(
      child: Column(
        children: [
          const SizedBox(
            height: 10,
          ),
          SizedBox(
            height: 60,
            child: CustomListView(
                itemCount: 10,
                axis: Axis.horizontal,
                scroll: true,
                itemBuilder: (context, index) {
                  return Container(
                    width: 130,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      color: AppConstants.primaryColor,
                    ),
                    margin:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                    child: const Center(
                        child: Text(
                      "عربي",
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    )),
                  );
                }),
          ),
          CustomListView(
        itemCount: 3,
            itemBuilder:(context,index){
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12.0,vertical: 5),
                child: ExpansionTileCard(
                  borderRadius: BorderRadius.circular(20),
                  title: CustomText(
                    text: 'الفصل الاول',
                    fontSize: 28,
                    alignment: Alignment.centerRight,
                  ),
                  // subtitle: const Text('I expand, too!'),
                  children: <Widget>[
                    const Divider(
                      thickness: 1.0,
                      height: 1.0,
                    ),
                    CustomListView(
                        itemCount: 3,
                        itemBuilder: (context, index) {
                          return InkWell(
                            onTap: (){
                              Get.to(()=>QuestionView());
                            },
                            child: Card(
                              borderOnForeground: false,
                              // pad: EdgeInsets.all(15),
                              semanticContainer: true,
                              child: Padding(
                                padding: const EdgeInsets.all(20.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    CustomText(
                                      text: "الدرس $index",
                                      fontSize: 24,
                                      alignment: Alignment.centerRight,
                                    ),
                                    const Icon(Icons.chevron_right,size: 30,color: Colors.black,),
                                  ],
                                ),
                              ),
                            ),
                          );
                        })
                  ],
                ),
              );}
           ,
          ),
        ],
      ),
    );
  }
}
