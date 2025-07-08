import 'package:flutter/material.dart';
import 'package:graduation_project/core/helpers/app_assets.dart';
import 'package:graduation_project/core/helpers/spacing.dart';
import 'package:graduation_project/core/themes/colors_manger.dart';
import 'package:graduation_project/core/themes/text_styles.dart';

class ContacUsView extends StatelessWidget {
  const ContacUsView({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final Color upperColor =
        isDark ? ColorsManger.neonPurple : ColorsManger.darkBlue;
    return Scaffold(
        appBar: AppBar(
          iconTheme: const IconThemeData(color: Colors.white),
          automaticallyImplyLeading: true,
          backgroundColor: upperColor,
        ),
        backgroundColor: upperColor,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Image.asset(
              Assets.imagesContactApp,
              scale: .5,
              height: 120,
            ),
            Text(
              'Welcome to NUTRIX Support !',
              style: TextStyles.font16whiteBold.copyWith(fontSize: 20),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * .1,
            ),
            Container(
              decoration: BoxDecoration(
                  color: Theme.of(context).scaffoldBackgroundColor,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(24),
                    topRight: Radius.circular(24),
                  )),
              height: MediaQuery.of(context).size.height * .6,
              width: double.infinity,
              child: const ContactInfoSection(),
            )
          ],
        ));
  }
}

class ContactInfoSection extends StatelessWidget {
  const ContactInfoSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          verticalSpace(20),
          const InfoTitle(title: "Contact Information"),
          verticalSpace(20),
          const InfoRow(label: " Website", value: "www.nutrix.com"),
          const InfoRow(label: " Email", value: "support@nutrix.com"),
          const InfoRow(label: " Phone", value: "+20 1063198136"),
          const InfoRow(label: " Social", value: "nutrix_solutions"),
        ],
      ),
    );
  }
}

class InfoTitle extends StatelessWidget {
  final String title;

  const InfoTitle({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: Theme.of(context)
          .textTheme
          .bodyLarge!
          .copyWith(fontSize: 16, fontWeight: FontWeight.w900),
    );
  }
}

class InfoRow extends StatelessWidget {
  final String label;
  final String value;

  const InfoRow({super.key, required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        children: [
          SizedBox(
            width: 80,
            child: Text(
              "$label:",
              style: Theme.of(context)
                  .textTheme
                  .headlineLarge!
                  .copyWith(fontSize: 16),
            ),
          ),
          Flexible(
              child: Text(
            value,
            style:
                Theme.of(context).textTheme.bodyLarge!.copyWith(fontSize: 16),
          )),
        ],
      ),
    );
  }
}
