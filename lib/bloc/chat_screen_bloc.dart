import 'package:bloc/bloc.dart';


part 'chat_screen_event.dart';
part 'chat_screen_state.dart';

class ChatScreenBloc extends Bloc<ChatScreenEvent, ChatScreenState> {
  ChatScreenBloc() : super(ChatScreenInitial()) {
    on<MsgSendEvent>((event, emit) {
      final updatedMessages = List<Map<String, String>>.from(
          (state as ChatScreenInitial).messages)
        ..add({"msg": event.message});
      
      emit(ChatScreenInitial(messages: updatedMessages));
    });
  }
}
