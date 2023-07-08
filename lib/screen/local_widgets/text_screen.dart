import 'package:chatting/screen/local_dto/chat_dto.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class  TextScreen extends StatelessWidget {
  const TextScreen({Key? key, required this.myName, required this.list, required this.client }) : super(key: key);
  final String myName;
  final List<ChatDto> list;
  final SupabaseClient client;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: list.length,
        reverse: true,
        itemBuilder: (context, index) => _oneItem(list[index])
    );
  }

  Widget _oneItem(ChatDto dto) {
    var me = myName == dto.name;
    return Align(
      alignment: me ? Alignment.centerRight : Alignment.centerLeft,
        child: Container(
          margin: const EdgeInsets.fromLTRB(20, 5, 20, 5),
          padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              color: me ? Colors.green : Colors.blue),
          child: Text(dto.text, style: TextStyle(color: Colors.grey.shade200),),
      ),
    );
  }
}


