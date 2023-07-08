import 'package:chatting/screen/local_dto/chat_dto.dart';
import 'package:chatting/screen/local_widgets/send_screen.dart';
import 'package:chatting/screen/local_widgets/text_screen.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';



class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

  class _MainPageState extends State<MainPage> {
    List<ChatDto>? list;
    final String name = DateTime.now().millisecondsSinceEpoch.toString();
    late final SupabaseClient client;
    late final Stream stream;

    @override
    void initState() {
      // TODO: implement initState
      client = Supabase.instance.client;
      stream = client.from('chat').stream(primaryKey: ['id'])..order('time', ascending: false).limit(1);
      super.initState();
    }


    @override
    Widget build(BuildContext context) {
      return SafeArea(
        child: Column(
          children: [
            Divider(height: 1, thickness: 1, color: Colors.grey.shade400,),
            Expanded(child: StreamBuilder(
                stream: stream,
                builder: (context, data) {
                  if (data.connectionState == ConnectionState.active){
                    var d = (data.data as List);
                    if (d.isNotEmpty) {
                      if (list != null) {
                        var dto = ChatDto.fromJson(d[0]);
                        if (list!.isEmpty) {
                          list!.add(dto);
                        }else {
                          list!.insert(0, dto);
                        }
                      }else {
                        list = [];
                      }
                    }
                  }
                  return TextScreen(list: list ?? [], myName: name, client: client);
                }
            )),
            Divider(height: 1, thickness: 1, color: Colors.grey.shade400,),
            SendScreen(myName: name, client: client),
            Divider(height: 1, thickness: 1, color: Colors.grey.shade400,),
          ],
        ),
      );
    }
  }