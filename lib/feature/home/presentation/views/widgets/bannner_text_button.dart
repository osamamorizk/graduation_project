import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:graduation_project/core/functions/show_comming_soon_dialog.dart';
import 'package:graduation_project/core/helpers/spacing.dart';
import 'package:graduation_project/core/themes/text_styles.dart';
import 'package:url_launcher/url_launcher.dart';

class BannerTextButton extends StatelessWidget {
  const BannerTextButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        verticalSpace(20),
        Text(
          'Check our website \nfor more insights.',
          style: TextStyles.font16whiteRegular,
        ),
        verticalSpace(17),
        SizedBox(
          height: 39.h,
          width: 150.w,
          child: ElevatedButton(
              style: const ButtonStyle(
                backgroundColor: WidgetStatePropertyAll(Colors.white),
              ),
              onPressed: () async {
                showCommingSoonDialog(context);
              },
              child: Text(
                'Explore more',
                style: TextStyles.font14DarkBlueBold,
              )),
        )
      ],
    );
  }
}

void urlLauncher() async {
  final Uri url = Uri.parse('https://www.google.com/');
  if (!await launchUrl(url)) {
    throw Exception('Could not launch $url');
  }
}
