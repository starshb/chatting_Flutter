import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SendScreen extends StatefulWidget {
  const SendScreen({Key? key, required this.myName, required this.client}) : super(key: key);
  final String myName;
  final SupabaseClient client;

  @override
  State<SendScreen> createState() => _SendScreenState();
}

class _SendScreenState extends State<SendScreen> {
  final tc = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(
        maxHeight: MediaQuery.of(context).size.height * .4,
      ),
      child: IntrinsicHeight(
        child: Row(
          children: [
            Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 5),
                  child: TextField(
                    controller: tc,
                    maxLines: null,
                    onSubmitted: (str) async {
                      submit(str);
                    },
                    decoration: const InputDecoration(border: InputBorder.none),
                  ),
                )),
              GestureDetector(
                behavior: HitTestBehavior.translucent,
                onTap: (){
                  submit(tc.text);
                },
                child: Container(
                  height: double.infinity,
                  color: Colors.grey.shade700,
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: Icon(
                    Icons.send,
                    color: Colors.grey.shade200,
                  ),
                ),
              )
          ],),
      )
      );
    }
    Future submit(String str) async {
      if (str.isNotEmpty) {
        await widget.client.from('chat').insert({
          'name': widget.myName,
          'text': str,
        });
        print('2222');
        tc.clear();
      }
    }
  }
