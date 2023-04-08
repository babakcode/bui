import 'package:bui/src/model/chat/chat_send_status_widgets.dart';
import 'package:flutter/material.dart';

import '../../../../bui.dart';

class ChatTextListTile extends StatelessWidget {
  final bool isFromMe;
  final Widget? senderName;
  final String? dateTimeText;
  final ChatSendStatus? chatSendStatus;
  final ChatSendStatusWidgets? chatSendStatusWidgets;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? textPadding;
  final String text;
  final TextStyle? textStyle;
  final TextStyle? dateTimeTextStyle;

  const ChatTextListTile({
    Key? key,
    required this.text,
    this.isFromMe = true,
    this.senderName,
    this.padding,
    this.textPadding,
    this.textStyle,
    this.chatSendStatus,
    this.chatSendStatusWidgets,
    this.dateTimeText,
    this.dateTimeTextStyle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment:
            isFromMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        children: [
          if (senderName != null) senderName!,
          Padding(
            padding: textPadding ??
                const EdgeInsets.symmetric(horizontal: 6.0, vertical: 4.0),
            child: Text(
              text,
              style: textStyle,
            ),
          ),
          IntrinsicWidth(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  if (dateTimeText != null)
                    Text(
                      dateTimeText!,
                      style: dateTimeTextStyle ??
                          TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.bold,
                              color: isFromMe
                                  ? Theme.of(context).colorScheme.primary
                                  : Theme.of(context).colorScheme.secondary),
                    ),
                  const SizedBox(
                    width: 4,
                  ),
                  if (chatSendStatus != null)
                    Builder(
                      builder: (context) {
                        switch (chatSendStatus!) {
                          case ChatSendStatus.sending:
                            return chatSendStatusWidgets?.sending ??
                                const Icon(Icons.access_time_rounded);
                          case ChatSendStatus.unsuccessful:
                            return chatSendStatusWidgets?.unsuccessful ??
                                const Icon(Icons.error_outline_rounded);
                          case ChatSendStatus.seen:
                            return chatSendStatusWidgets?.seen ??
                                const Icon(Icons.done_all_rounded);
                          case ChatSendStatus.sent:
                            return chatSendStatusWidgets?.sent ??
                                const Icon(Icons.check_rounded);
                          default:
                            return const Icon(Icons.check_rounded);
                        }
                      },
                    ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}