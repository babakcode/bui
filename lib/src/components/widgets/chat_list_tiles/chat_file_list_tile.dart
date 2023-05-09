import 'package:bui/bui.dart';
import 'package:bui/src/model/chat/chat_send_status_widgets.dart';
import 'package:flutter/material.dart';

class ChatFileListTile extends StatelessWidget {
  final bool isFromMe;
  final Widget? senderName;
  final String? dateTimeText;
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
  final Widget? textChild;
  final Widget? downloadWidget;
  final VoidCallback? clickDownload;
  final Color? backgroundColor;
  final Color? attachmentColor;
  final Color? foregroundColor;
  final BoxConstraints? boxConstraints;

  const ChatFileListTile({
    Key? key,
    this.text,
    this.isFromMe = true,
    this.senderName,
    this.textChild,
    this.padding,
    this.margin,
    this.textPadding,
    this.textStyle,
    this.chatSendStatus,
    this.chatSendStatusColor,
    this.downloadWidget,
    this.chatSendStatusSize = 12,
    this.chatSendStatusWidgets,
    this.dateTimeText,
    this.dateTimeTextStyle,
    this.clickDownload,
    this.backgroundColor,
    this.foregroundColor,
    this.attachmentColor,
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

    return Container(
      padding: padding,
      // color: Colors.red,
      width: double.infinity,
      alignment: isFromMe ? Alignment.centerRight : Alignment.centerLeft,
      child: ConstrainedBox(
        constraints: boxConstraints ??
            BoxConstraints(maxWidth: MediaQuery.of(context).size.width * .8),
        child: Card(
          margin: margin,
          color: bg,
          child: Padding(
            padding: padding ??
                const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
            child: Column(
              crossAxisAlignment: isFromMe
                  ? CrossAxisAlignment.end
                  : CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Card(
                      color: attachmentColor ?? Theme.of(context).colorScheme.primaryContainer,
                      // shape: const CircleBorder(),
                      child: downloadWidget ??
                          IconButton(
                              onPressed: clickDownload,
                              icon: Icon(Icons.download_rounded,
                                color: bg,)),
                    ),
                    Flexible(
                      child: Column(
                        crossAxisAlignment: isFromMe
                            ? CrossAxisAlignment.end
                            : CrossAxisAlignment.start,
                        children: [
                          if (senderName != null) senderName!,

                          Padding(
                            padding: textPadding ??
                                const EdgeInsets.symmetric(
                                    horizontal: 6.0, vertical: 4.0),
                            child:textChild ??
                                Text(
                                  text ?? "Put text property ...",
                                  style: textStyle ?? TextStyle(color: fg),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
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
                  ],
                ),

                if (text != null || textChild != null) Padding(
                  padding: textPadding ??
                      const EdgeInsets.symmetric(horizontal: 6.0, vertical: 4.0),
                  child: textChild ??
                      Text(
                        text ?? "Put text property ...",
                        style: textStyle ?? TextStyle(color: fg),
                      ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
