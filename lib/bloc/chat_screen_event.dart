part of 'chat_screen_bloc.dart';

class ChatScreenEvent {}

class MsgSendEvent extends ChatScreenEvent {
  final String message;

  MsgSendEvent(this.message);
}
