import '../DioClient/DioClient.dart';

class ServerPageeService {
  const ServerPageeService({
    required this.apiService,
  });

  final DioClient apiService;
  Future GettingQuestion(String lang) async {
    try {

      final response = await apiService.get(
          "https://1quizitsagame.live/api/info.php?a=203&lang=$lang");
      print("Domain:  ${response.data}");
      return response;
    } catch (e) {
      print("Domain + ${e.toString()}");
    }
  }
  Future GettingAnswers(String lang) async {
    try {
      final response = await apiService.get(
          "https://1quizitsagame.live/api/user.php?a=203&lang=$lang");
      print("Domain:  ${response.data}");
      return response;
    } catch (e) {
      print("Domain + ${e.toString()}");
    }
  }
}
