import 'package:chat_simple_app/src/backend/entities/message.dart';
import 'package:dio/dio.dart';
import 'package:chat_simple_app/infrastructure/models/api_model.dart';

class GetApiAnswer {
  final _dio = Dio();
  Future<Message> getAnswer() async {
    final response = await _dio.get('https://yes-no-wtf.vercel.app/api');

    final apiModel = ApiModel.fromJsonMap(response.data);

    return apiModel.toMessageEntity();
  }
}
