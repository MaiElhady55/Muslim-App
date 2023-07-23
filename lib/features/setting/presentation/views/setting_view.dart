import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';
import 'package:muslim_app_2/core/app_widgets/black_container.dart';
import 'package:muslim_app_2/core/app_widgets/custom_arrow_back.dart';
import 'package:muslim_app_2/core/app_widgets/custom_container.dart';
import 'package:muslim_app_2/core/database/sqldb.dart';
import 'package:muslim_app_2/core/utils/app_colors.dart';
import 'package:muslim_app_2/core/utils/styles.dart';
import 'package:share_plus/share_plus.dart';

class SettingView extends StatelessWidget {
  final TextEditingController feed = TextEditingController();
  final SqlDb sqlDb = SqlDb();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: CustomContainer(
            child: Column(
          children: [
            const CustomArrowBack(),
            const SizedBox(height: 20),
            GestureDetector(
              onTap: () {
                Share.share(
                    'https://drive.google.com/file/d/182Gm9CQrU-5PZlsejASupgrG23rBQlTq/view');
              },
              child: const BlackContainer(
                text: 'مشاركة التطبيق',
                color: Colors.white,
                textColor: Colors.black,
                iconColor: Colors.black,
                icon: Icons.share,
                fontSize: 25,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  padding: const EdgeInsets.all(10),
                  margin: const EdgeInsets.symmetric(horizontal: 10),
                  decoration: BoxDecoration(
                      color: AppColors.kSettingContainerColor,
                      borderRadius: BorderRadius.circular(20)),
                  child: Text('تواصل معنا',
                      textAlign: TextAlign.end,
                      style:
                          Styles.textStyle25Ar.copyWith(color: Colors.white)),
                ),
              ],
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(20)),
              child: TextFormField(
                textDirection: TextDirection.rtl,
                maxLines: 5,
                decoration: InputDecoration(
                  hintTextDirection: TextDirection.rtl,
                  contentPadding: const EdgeInsets.all(15),
                  hintStyle: Styles.textStyle25Ar.copyWith(color: Colors.black),
                  hintText: "أدخل تعليقك",
                  border: InputBorder.none,
                ),
                controller: feed,
              ),
            ),
            Align(
              alignment: Alignment.centerRight,
              child: GestureDetector(
                onTap: () {
                  if (feed.text.isEmpty) {
                    var snackBar = SnackBar(
                      elevation: 0,
                      behavior: SnackBarBehavior.floating,
                      backgroundColor: Colors.transparent,
                      content: AwesomeSnackbarContent(
                        title: 'FeedBack',
                        message: 'Please enter some text !',
                        contentType: ContentType.failure,
                      ),
                    );
                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  } else {
                    var snackBar = SnackBar(
                      elevation: 0,
                      behavior: SnackBarBehavior.floating,
                      backgroundColor: Colors.transparent,
                      content: AwesomeSnackbarContent(
                        title: 'FeedBack',
                        message: 'Sended Successfully !',
                        contentType: ContentType.success,
                      ),
                    );
                    sqlDb.insertData(
                        table: 'Contact', values: {'note': feed.text});
                    feed.text = '';
                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  }
                },
                child: Container(
                  padding: const EdgeInsets.all(10),
                  margin: const EdgeInsets.symmetric(horizontal: 10),
                  decoration: BoxDecoration(
                      color: AppColors.kSettingContainerColor,
                      borderRadius: BorderRadius.circular(20)),
                  child: Text('إرسال',
                      style:
                          Styles.textStyle25Ar.copyWith(color: Colors.white)),
                ),
              ),
            )
          ],
        )),
      ),
    );
  }
}
