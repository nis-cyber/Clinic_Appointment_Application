import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
class MessagePage extends StatelessWidget {
  const MessagePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Message Page"),
      ),
    );
  }
}
