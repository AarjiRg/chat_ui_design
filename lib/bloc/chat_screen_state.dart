part of 'chat_screen_bloc.dart';

 class ChatScreenState {}

class ChatScreenInitial extends ChatScreenState {
  final List<Map<String, String>> messages;

  ChatScreenInitial({this.messages = const []});
}
