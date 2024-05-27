import 'package:atma_bakery_mobile/constraints.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class CustomerController {
  static Future<void> sendEmail() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    var emailPref = pref.getString('email');
    var url =
        '${kAPiName}change-password'; // Apakah kAPiName sudah didefinisikan sebelumnya?
    var data = {'email': emailPref}; // Mengubah `const` menjadi `var`

    try {
      final response = await http.post(Uri.parse(url),
          body: data); // Menambahkan `body` parameter dengan data yang dikirim
      if (response.statusCode == 200) {
        // Tambahkan logika di sini jika request berhasil (status code 200)
      } else {
        throw Exception('Failed to send email');
      }
    } catch (e) {
      throw Exception('Failed to send email');
    }
  }
}
