import 'dart:math';
import 'package:bui/bui.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BUIMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
          useMaterial3: true,
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.blueAccent)),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<int> list = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: [
          IconButton(
              onPressed: () => setState(() {
                    list.remove(list.last);
                  }),
              icon: const Icon(Icons.close)),
          IconButton(
              onPressed: () => setState(() {
                    list.insert(0, Random().nextInt(2000));
                  }),
              icon: const Icon(Icons.add)),
        ],
      ),
      body: ChatIndexListView(
        shrinkWrap: true,
        reverse: true,
        addSemanticIndexes: false,
        itemCount: list.length,
        itemBuilder: (context, index) => index.isEven
            ? ChatVoiceListTile(
                isFromMe: Random().nextBool(),
                chatSendStatus: ChatSendStatus.sent,
                dateTimeText: "20:00",
                text:
                    "indexadsadawdsadwadsadawdadadasdawdwadsadawdasdwdasadsadawdsadwadsadawdadadasdawdwadsadawdasdwdas $index = ${list[index]}",
              )
            : ChatFileListTile(
                isFromMe: false,
                chatSendStatus: ChatSendStatus.sent,
                dateTimeText: "20:00",
                text:
                    "indexadsadawdsadwadsadawdadadasdawdwadsadawdasdwdas: adsadawdsadwadsadawdadadasdawdwadsadawdasdwdasadsadawdsadwadsadawdadadasdawdwadsadawdasdwdas $index = ${list[index]}",
              ),
      ),
    );
  }
}
