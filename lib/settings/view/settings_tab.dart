import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/home/view_model/cubit/theme_cubit.dart';
import 'package:news/shared/app_theme.dart';

class SettingsTab extends StatelessWidget {
  const SettingsTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Mode',
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    color: context.read<ThemeCubit>().state.isDark
                        ? AppTheme.white
                        : AppTheme.black),
              ),
              Switch(
                  activeTrackColor: AppTheme.darkPrimaryColor,
                  value: context.read<ThemeCubit>().state.isDark,
                  onChanged: (v) {
                    context.read<ThemeCubit>().toggleTheme();
                  })
            ],
          ),
        ],
      ),
    );
  }
}
