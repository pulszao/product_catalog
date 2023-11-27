import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:product_catalog/constants.dart';

class SearchTextField extends StatelessWidget {
  final Function(String)? onChanged;
  final dynamic searchController;
  final String hintText;
  final List<TextInputFormatter>? inputFormatters;

  const SearchTextField({
    Key? key,
    this.onChanged,
    required this.searchController,
    required this.hintText,
    this.inputFormatters,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.9,
      margin: const EdgeInsets.fromLTRB(0, 16, 0, 3),
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        borderRadius: const BorderRadius.all(Radius.circular(20)),
      ),
      child: TextField(
        onChanged: onChanged,
        controller: searchController,
        autofocus: false,
        textAlign: TextAlign.left,
        cursorColor: Theme.of(context).colorScheme.surface,
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: kBaseTextStyle(
            color: Colors.grey,
            fontSize: 14.0,
          ),
          border: InputBorder.none,
          prefixIcon: const Icon(
            Icons.search_outlined,
            color: Colors.grey,
          ),
        ),
      ),
    );
  }
}
