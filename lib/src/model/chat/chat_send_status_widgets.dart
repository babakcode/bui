import 'package:flutter/material.dart';

class ChatSendStatusWidgets{
  Widget sent,
  seen,
  sending,
  unsuccessful;

  ChatSendStatusWidgets({
    this.seen = const Icon(Icons.done_all_rounded),
    this.sent = const Icon(Icons.check_rounded),
    this.sending = const Icon(Icons.access_time_rounded),
    this.unsuccessful = const Icon(Icons.error_outline_rounded),
});
}