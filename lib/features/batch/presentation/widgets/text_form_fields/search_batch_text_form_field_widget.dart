import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';

class SearchBatchTextFormFieldWidget extends StatelessWidget {
  const SearchBatchTextFormFieldWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: const InputDecoration(
        hintText: 'Search batch, product',
        suffixIcon: Icon(Ionicons.search),
      ),
      maxLines: 1,
      onTapOutside: (_) => FocusManager.instance.primaryFocus?.unfocus(),
    );
  }
}
