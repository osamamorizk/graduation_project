import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:graduation_project/core/functions/show_warrning_dailog.dart';
import 'package:graduation_project/core/helpers/app_assets.dart';
import 'package:graduation_project/core/helpers/const.dart';
import 'package:graduation_project/core/helpers/extensions.dart';
import 'package:graduation_project/core/helpers/spacing.dart';
import 'package:graduation_project/core/routes/routes.dart';
import 'package:graduation_project/core/themes/colors_manger.dart';
import 'package:graduation_project/feature/chatbot/data/models/message_model.dart';
import 'package:graduation_project/feature/chatbot/presentation/views/widgets/chatboot_body.dart';
import 'package:hive_flutter/hive_flutter.dart';

class ChatbotView extends StatelessWidget {
  const ChatbotView({super.key});

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    final appBarColor =
        isDarkMode ? ColorsManger.neonPurple : ColorsManger.darkBlue;
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 40,
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
        actions: [
          IconButton(
              onPressed: () {
                warningDialog(context, () async {
                  await Hive.box<MessageModel>(kChatMessages).clear();
                  context.pop();
                  Navigator.popAndPushNamed(context, Routes.chatbot);
                }, 'Start new session?',
                    details: 'You will lost details of current session');
              },
              icon: const Icon(Icons.settings_backup_restore_outlined))
        ],
        title: Row(
          children: [
            SvgPicture.asset(
              Assets.svgsChatbotLogo,
              width: 40,
              height: 40,
              fit: BoxFit.fill,
            ),
            horizontalSpace(15),
            Text(
              'Chatbot',
              style: Theme.of(context)
                  .textTheme
                  .headlineLarge
                  ?.copyWith(color: Colors.white),
            ),
          ],
        ),
        backgroundColor: appBarColor,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: ChatbotBody(messages1: getMessages()),
      ),
    );
  }
}

List<MessageModel> getMessages() {
  var box = Hive.box<MessageModel>(kChatMessages);
  List<MessageModel> messages = box.values.toList();
  if (messages.isEmpty) {
    return [];
  }
  return messages;
}
