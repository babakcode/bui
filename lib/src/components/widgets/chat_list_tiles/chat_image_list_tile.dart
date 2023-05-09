import 'package:bui/bui.dart';
import 'package:bui/src/model/chat/chat_send_status_widgets.dart';
import 'package:flutter/material.dart';

class ChatImageListTile extends StatelessWidget {
  final VoidCallback? onTap;
  final VoidCallback? onLongPress;
  final bool isFromMe;
  final Widget? senderName;
  final BoxConstraints? constraints;
  final String? dateTimeText;
  final String? url;
  final ChatSendStatus? chatSendStatus;
  final ChatSendStatusWidgets? chatSendStatusWidgets;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final EdgeInsetsGeometry? textPadding;
  final String? text;
  final TextStyle? textStyle;
  final Color? chatSendStatusColor;
  final double? chatSendStatusSize;
  final TextStyle? dateTimeTextStyle;
  final Widget? child;
  final double? aspectRatio;
  final Color? backgroundColor;
  final Color? foregroundColor;
  final BoxConstraints? boxConstraints;

  const ChatImageListTile({
    Key? key,
    this.text,
    this.isFromMe = true,
    this.senderName,
    this.onTap,
    this.onLongPress,
    this.url,
    this.child,
    this.padding,
    this.constraints,
    this.margin,
    this.textPadding,
    this.textStyle,
    this.aspectRatio,
    this.chatSendStatus,
    this.chatSendStatusColor,
    this.chatSendStatusSize = 12,
    this.backgroundColor,
    this.foregroundColor,
    this.chatSendStatusWidgets,
    this.dateTimeText,
    this.dateTimeTextStyle,
    this.boxConstraints,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Color bg = backgroundColor ??
        (isFromMe
            ? Theme.of(context).colorScheme.primary
            : Theme.of(context).colorScheme.onPrimary);

    Color fg = foregroundColor ??
        (isFromMe
            ? Theme.of(context).colorScheme.onPrimary
            : Theme.of(context).colorScheme.primary);

    bool urlExist = url != null;

    return Container(
      // color: Colors.red,
      width: double.infinity,
      alignment: isFromMe ? Alignment.centerRight : Alignment.centerLeft,
      child: ConstrainedBox(
        constraints: boxConstraints ??
            BoxConstraints(maxWidth: MediaQuery.of(context).size.width * .8),
        child: Card(
          color: bg,
          margin: margin,
          clipBehavior: Clip.antiAliasWithSaveLayer,
          child: InkWell(
            onTap: onTap,
            onLongPress: onLongPress,
            child: Padding(
              padding: padding ??
                  const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: isFromMe
                    ? CrossAxisAlignment.end
                    : CrossAxisAlignment.start,
                children: [
                  if (senderName != null) senderName!,
                  Padding(
                    padding: textPadding ??
                        const EdgeInsets.symmetric(
                            horizontal: 6.0, vertical: 4.0),
                    child: ConstrainedBox(
                      constraints: constraints ??
                          BoxConstraints(
                              maxHeight: 300,
                              maxWidth: MediaQuery.of(context).size.width * .8),
                      child: child ??
                          (urlExist
                              ? const Center(
                                  child: Text(
                                      "add the url property or the child property!"))
                              : aspectRatio == null
                                  ? Image.network(url!)
                                  : AspectRatio(
                                      aspectRatio: aspectRatio!,
                                      child: Image.network(url!),
                                    )),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        if (dateTimeText != null)
                          Text(
                            dateTimeText!,
                            textDirection: TextDirection.ltr,
                            style: dateTimeTextStyle ??
                                TextStyle(
                                    fontSize: 10,
                                    fontWeight: FontWeight.bold,
                                    color: fg),
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
                                      Icon(
                                        Icons.access_time_rounded,
                                        color: chatSendStatusColor ?? fg,
                                        size: chatSendStatusSize,
                                      );
                                case ChatSendStatus.unsuccessful:
                                  return chatSendStatusWidgets?.unsuccessful ??
                                      Icon(
                                        Icons.error_outline_rounded,
                                        color: chatSendStatusColor ?? fg,
                                        size: chatSendStatusSize,
                                      );
                                case ChatSendStatus.seen:
                                  return chatSendStatusWidgets?.seen ??
                                      Icon(
                                        Icons.done_all_rounded,
                                        color: chatSendStatusColor ?? fg,
                                        size: chatSendStatusSize,
                                      );
                                case ChatSendStatus.sent:
                                  return chatSendStatusWidgets?.sent ??
                                      Icon(
                                        Icons.check_rounded,
                                        color: chatSendStatusColor ?? fg,
                                        size: chatSendStatusSize,
                                      );
                                default:
                                  return Icon(
                                    Icons.check_rounded,
                                    color: chatSendStatusColor ?? fg,
                                    size: chatSendStatusSize,
                                  );
                              }
                            },
                          ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
