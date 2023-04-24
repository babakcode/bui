import 'package:bui/bui.dart';
import 'package:bui/src/model/chat/chat_send_status_widgets.dart';
import 'package:flutter/material.dart';

class ChatFileListTile extends StatefulWidget {
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
  final VoidCallback? clickDownload;
  final Color? backgroundColor;
  final Color? foregroundColor;
  final Color? testColor;
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
    this.chatSendStatusSize,
    this.chatSendStatusWidgets,
    this.dateTimeText,
    this.dateTimeTextStyle,
    this.clickDownload,
    this.backgroundColor,
    this.foregroundColor,
    this.testColor,
    this.boxConstraints,
  }) : super(key: key);

  @override
  State<ChatFileListTile> createState() => _ChatFileListTileState();
}

class _ChatFileListTileState extends State<ChatFileListTile> {
  @override
  Widget build(BuildContext context) {
    Color bg = widget.backgroundColor ??
        (widget.isFromMe
            ? Theme.of(context).colorScheme.primary
            : Theme.of(context).colorScheme.onPrimary);

    Color fg = widget.foregroundColor ??
        (widget.isFromMe
            ? Theme.of(context).colorScheme.onPrimary
            : Theme.of(context).colorScheme.primary);

    return Container(
      padding: widget.padding,
      // color: Colors.red,
      width: double.infinity,
      alignment: widget.isFromMe ? Alignment.centerRight : Alignment.centerLeft,
      child: ConstrainedBox(
        constraints: widget.boxConstraints ??
            BoxConstraints(
                minWidth: MediaQuery.of(context).size.width > 360
                    ? 300
                    : MediaQuery.of(context).size.width * .6,
                maxWidth: MediaQuery.of(context).size.width * .8),
        child: Card(
          margin: widget.margin,
          color: bg,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Card(
                color: widget.testColor,
                // shape: const CircleBorder(),
                child: IconButton(
                    onPressed: () {}, icon: const Icon(Icons.download_rounded)),
              ),
              Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: widget.isFromMe
                    ? CrossAxisAlignment.end
                    : CrossAxisAlignment.start,
                children: [
                  if (widget.senderName != null) widget.senderName!,
                  Padding(
                    padding: widget.textPadding ??
                        const EdgeInsets.symmetric(
                            horizontal: 6.0, vertical: 4.0),
                    child: widget.textChild ??
                        Text(
                          widget.text ?? "Put text property ...",
                          style: widget.textStyle ?? TextStyle(color: fg),
                        ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        if (widget.dateTimeText != null)
                          Text(
                            widget.dateTimeText!,
                            style: widget.dateTimeTextStyle ??
                                TextStyle(
                                    fontSize: 10,
                                    fontWeight: FontWeight.bold,
                                    color: fg),
                          ),
                        const SizedBox(
                          width: 4,
                        ),
                        if (widget.chatSendStatus != null)
                          Builder(
                            builder: (context) {
                              switch (widget.chatSendStatus!) {
                                case ChatSendStatus.sending:
                                  return widget
                                          .chatSendStatusWidgets?.sending ??
                                      Icon(Icons.access_time_rounded,
                                          color:
                                              widget.chatSendStatusColor ?? fg,
                                          size: widget.chatSendStatusSize);
                                case ChatSendStatus.unsuccessful:
                                  return widget.chatSendStatusWidgets
                                          ?.unsuccessful ??
                                      Icon(Icons.error_outline_rounded,
                                          color:
                                              widget.chatSendStatusColor ?? fg,
                                          size: widget.chatSendStatusSize);
                                case ChatSendStatus.seen:
                                  return widget.chatSendStatusWidgets?.seen ??
                                      Icon(Icons.done_all_rounded,
                                          color:
                                              widget.chatSendStatusColor ?? fg,
                                          size: widget.chatSendStatusSize);
                                case ChatSendStatus.sent:
                                  return widget.chatSendStatusWidgets?.sent ??
                                      Icon(Icons.check_rounded,
                                          color:
                                              widget.chatSendStatusColor ?? fg,
                                          size: widget.chatSendStatusSize);
                                default:
                                  return Icon(Icons.check_rounded,
                                      color: widget.chatSendStatusColor ?? fg,
                                      size: widget.chatSendStatusSize);
                              }
                            },
                          ),
                      ],
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
