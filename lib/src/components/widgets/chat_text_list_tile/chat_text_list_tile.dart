import 'package:bui/bui.dart';
import 'package:bui/src/model/chat/chat_send_status_widgets.dart';
import 'package:flutter/material.dart';

class ChatTextListTile extends StatelessWidget {
  final bool isFromMe;
  final Widget? senderName;
  final String? dateTimeText;
  final ChatSendStatus? chatSendStatus;
  final ChatSendStatusWidgets? chatSendStatusWidgets;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? textPadding;
  final String? text;
  final TextStyle? textStyle;
  final TextStyle? dateTimeTextStyle;
  final Widget? textChild;

  const ChatTextListTile({
    Key? key,
    this.text,
    this.isFromMe = true,
    this.senderName,
    this.textChild,
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
      // color: Colors.red,
      width: double.infinity,
      alignment: isFromMe ? Alignment.centerRight : Alignment.centerLeft,
      child: Card(
        color: isFromMe
            ? Theme.of(context).colorScheme.primary
            : Theme.of(context).colorScheme.onPrimary,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment:
              isFromMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
          children: [
            if (senderName != null) senderName!,
            Padding(
              padding: textPadding ??
                  const EdgeInsets.symmetric(horizontal: 6.0, vertical: 4.0),
              child: textChild ?? Text(
                text ?? "Put text property ...",
                style: textStyle ??
                    TextStyle(
                        color: isFromMe
                            ? Theme.of(context).colorScheme.onPrimary
                            : Theme.of(context).colorScheme.primary),
              ),
            ),
            Padding(
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
                                  ? Theme.of(context).colorScheme.onPrimary
                                  : Theme.of(context).colorScheme.primary),
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
            )
          ],
        ),
      ),
    );
  }
}