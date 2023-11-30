import 'package:product_catalog/constants.dart';
import 'package:product_catalog/services/get_data.dart';

Future<Map<String, dynamic>> getAllProducts() async {
  String url = '$kUrl/api/services/app/Produto/GetAll';

  Map<String, dynamic> data = {};

  GetData networkHelper = GetData(
    url: Uri.parse(url),
  );
  data = await networkHelper.getData();

  return data;
}

Future<Map<String, dynamic>> getProduct({required int id}) async {
  String url = '$kUrl/api/services/app/Produto/Get?id=$id';

  Map<String, dynamic> data = {};

  GetData networkHelper = GetData(
    url: Uri.parse(url),
  );
  data = await networkHelper.getData();

  return data;
}
