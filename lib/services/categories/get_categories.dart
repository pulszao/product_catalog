import 'package:product_catalog/utils/constants.dart';
import 'package:product_catalog/services/get_data.dart';

Future<Map<String, dynamic>> getAllCategories() async {
  String url = '$kUrl/api/services/app/Categoria/GetAll';

  Map<String, dynamic> data = {};

  GetData networkHelper = GetData(
    url: Uri.parse(url),
  );
  data = await networkHelper.getData();

  return data;
}

Future<Map<String, dynamic>> getCategory({required int id}) async {
  String url = '$kUrl/api/services/app/Categoria/Get?id=$id';

  Map<String, dynamic> data = {};

  GetData networkHelper = GetData(
    url: Uri.parse(url),
  );
  data = await networkHelper.getData();

  return data;
}
