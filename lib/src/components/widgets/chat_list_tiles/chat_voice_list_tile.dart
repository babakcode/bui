import 'package:flutter/material.dart';

import '../../../model/chat/chat_send_status_widgets.dart';
import '../../enum/chat/chat_send_status.dart';

class ChatVoiceListTile extends StatelessWidget {
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
  final Widget? playerButton;
  final VoidCallback? onPressedPlayerButton;
  final IconData? playerButtonIcon;
  final Color? playerButtonColor;
  final Widget? slider;
  final double? sliderValue;
  final ValueSetter<double>? sliderOnChange;
  final double? sliderMaxValue;
  final Color? backgroundColor;
  final Color? foregroundColor;
  final BoxConstraints? boxConstraints;

  const ChatVoiceListTile({
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
    this.chatSendStatusSize = 12,
    this.backgroundColor,
    this.foregroundColor,
    this.chatSendStatusWidgets,
    this.dateTimeText,
    this.playerButton,
    this.onPressedPlayerButton,
    this.playerButtonIcon,
    this.playerButtonColor,
    this.slider,
    this.sliderValue,
    this.sliderMaxValue,
    this.sliderOnChange,
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
                      color: playerButtonColor ??
                          Theme.of(context).colorScheme.primaryContainer,
                      margin:
                          const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                      child: playerButton ??
                          IconButton(
                              onPressed: onPressedPlayerButton,
                              icon: Icon(playerButtonIcon ?? Icons.play_arrow,
                                color: bg,
                              )),
                    ),
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: isFromMe
                          ? CrossAxisAlignment.end
                          : CrossAxisAlignment.start,
                      children: [
                        if (senderName != null) senderName!,
                        slider ??
                            Slider(
                              value: sliderValue ?? 0,
                              onChanged: sliderMaxValue == null
                                  ? null
                                  : sliderOnChange,
                              min: 0,
                              max: sliderMaxValue ?? 1,
                              divisions: (sliderMaxValue ?? 1).toInt(),
                            ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 6, vertical: 2),
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
                                        return chatSendStatusWidgets
                                                ?.unsuccessful ??
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
                        ),
                      ],
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
