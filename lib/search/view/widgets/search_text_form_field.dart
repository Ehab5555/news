import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/search/view_model/cubit/search_cubit.dart';
import 'package:news/shared/app_theme.dart';

class SearchTextFormField extends StatefulWidget {
  const SearchTextFormField({super.key});

  @override
  State<SearchTextFormField> createState() => _SearchTextFormFieldState();
}

class _SearchTextFormFieldState extends State<SearchTextFormField> {
  final controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.sizeOf(context).width * 0.75,
      height: MediaQuery.sizeOf(context).height * 0.05,
      child: TextFormField(
        controller: controller,
        onChanged: (value) {
          controller.text = value;
        },
        decoration: InputDecoration(
          prefixIcon: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.close,
              color: AppTheme.primaryColor,
            ),
          ),
          suffixIcon: IconButton(
            onPressed: () {
              context.read<SearchCubit>().newsSearch(controller.text);
            },
            icon: Icon(
              Icons.search,
              color: AppTheme.primaryColor,
            ),
          ),
          hintText: 'Search News...',
          hintStyle: Theme.of(context).textTheme.titleSmall,
          fillColor: AppTheme.white,
          filled: true,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(25),
            borderSide: BorderSide(
              color: AppTheme.white,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(25),
            borderSide: BorderSide(
              color: AppTheme.white,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(25),
            borderSide: BorderSide(
              color: AppTheme.white,
            ),
          ),
        ),
      ),
    );
  }
}
