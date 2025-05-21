import 'package:flutter/material.dart';
import '../constants/app_colors.dart';

class TabSelector extends StatelessWidget {
  final List<String> tabs;
  final int selectedIndex;
  final Function(int)? onTabSelected;

  const TabSelector({
    super.key,
    required this.tabs,
    required this.selectedIndex,
    this.onTabSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: Row(
        children: List.generate(
          tabs.length,
          (index) => Expanded(
            child: Padding(
              padding: EdgeInsets.only(
                right: index < tabs.length - 1 ? 12.0 : 0.0,
              ),
              child: _buildTab(index),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTab(int index) {
    final isSelected = index == selectedIndex;
    
    return GestureDetector(
      onTap: () {
        if (onTabSelected != null) {
          onTabSelected!(index);
        }
      },
      child: Container(
        height: 40,
        decoration: BoxDecoration(
          color: isSelected ? AppColors.primary : AppColors.tabBackground,
          borderRadius: BorderRadius.circular(8),
        ),
        alignment: Alignment.center,
        child: Text(
          tabs[index],
          style: TextStyle(
            color: isSelected ? Colors.white : AppColors.primary,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}