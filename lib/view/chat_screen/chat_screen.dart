import 'package:chat_ui_design/bloc/chat_screen_bloc.dart';
import 'package:chat_ui_design/utils/colors/colors_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';



class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController msgsendingcontroller = TextEditingController();

    return BlocProvider(
      create: (context) => ChatScreenBloc(),
      child: Scaffold(
        backgroundColor: Colors.green.shade900.withGreen(21),
        appBar: AppBar(
          backgroundColor: ColorsConstants().mianblack,
          leading: Padding(
            padding: const EdgeInsets.all(6.0),
            child: CircleAvatar(
              backgroundImage: NetworkImage(
                  "https://tse1.mm.bing.net/th?id=OIP.RCZWqB9X5Ro9RujeqdyyMQHaEr&pid=Api&P=0&h=180"),
            ),
          ),
          title: Text(
            "Danny Hopkins",
            style: TextStyle(
                color: ColorsConstants().mianwhhite,
                fontWeight: FontWeight.w500),
          ),
          actions: [
            Icon(
              Icons.search,
              color: ColorsConstants().mianwhhite,
              size: 35,
            ),
            SizedBox(
              width: 10,
            )
          ],
        ),
        body: Column(
          children: [
            Expanded(
              child: BlocBuilder<ChatScreenBloc, ChatScreenState>(
                builder: (context, state) {
                  if (state is ChatScreenInitial && state.messages.isNotEmpty) {
                    return ListView.separated(
                      itemBuilder: (context, index) {
                        final message = state.messages[index]["msg"];
                        return Padding(
                          padding: const EdgeInsets.only(
                              right: 50, left: 10, top: 8, bottom: 8),
                          child: message!.isEmpty
                              ? null
                              : Container(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    message,
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  decoration: BoxDecoration(
                                    color: Color(0xff04cc82).withOpacity(0.70),
                                    border: Border.all(
                                      width: 1,
                                      color: Color(0xff013220),
                                    ),
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                ),
                        );
                      },
                      separatorBuilder: (context, index) => Padding(
                        padding: const EdgeInsets.only(
                            top: 8, bottom: 8, left: 50, right: 10),
                        child: Container(
                          height: 60,
                          width: 400,
                          decoration: BoxDecoration(
                            color: Color(0xff026c45).withOpacity(0.75),
                            border: Border.all(
                              width: 1,
                              color: Color(0xff013220),
                            ),
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),
                      ),
                      itemCount: state.messages.length,
                    );
                  }
                  return Center(
                    child: Text(
                      "No messages yet.",
                      style: TextStyle(color: Colors.white),
                    ),
                  );
                },
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.only(bottom: 20, left: 10, right: 10, top: 5),
              child: TextFormField(
                controller: msgsendingcontroller,
                decoration: InputDecoration(
                  
                  prefixIcon: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: CircleAvatar(
                      radius: 18,
                      child: Icon(Icons.camera_alt_outlined),
                    ),
                  ),
                  suffixIcon: IconButton(
                    icon: Icon(
                      Icons.send_outlined,
                      size: 28,
                      color: ColorsConstants().mianwhhite,
                    ),
                    onPressed: () {
                      if (msgsendingcontroller.text.isNotEmpty) {
                        context.read<ChatScreenBloc>().add(
                              MsgSendEvent(msgsendingcontroller.text),
                            );
                        msgsendingcontroller.clear();
                      }
                    },
                  ),
                  hintText: "Message",
                  hintStyle: TextStyle(color: Colors.white.withOpacity(0.50)),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(width: 2, color: Colors.white),
                    borderRadius: BorderRadius.circular(40),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
