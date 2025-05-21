import 'package:flutter/material.dart';
import '../constants/app_colors.dart';
import '../models/mentor.dart';
import '../widgets/mentor_card.dart';
import '../widgets/search_bar.dart';
import '../widgets/tab_selector.dart';
import '../widgets/custom_app_bar.dart';
import '../widgets/bottom_nav_bar.dart';

class MentorsScreen extends StatefulWidget {
  const MentorsScreen({super.key});

  @override
  State<MentorsScreen> createState() => _MentorsScreenState();
}

class _MentorsScreenState extends State<MentorsScreen> {
  final TextEditingController _searchController = TextEditingController();
  final List<Mentor> _mentors = Mentor.getMockMentors();
  int _selectedTabIndex = 1; // Default to "Explore"
  
  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  void _onTabSelected(int index) {
    setState(() {
      _selectedTabIndex = index;
    });
  }

  void _onSearch(String query) {
    // Implement search functionality here
    // This would filter the mentors list based on the query
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const CustomAppBar(),
            _buildHeader(),
            TabSelector(
              tabs: const ['My Mentors', 'Explore'],
              selectedIndex: _selectedTabIndex,
              onTabSelected: _onTabSelected,
            ),
            CustomSearchBar(
              controller: _searchController,
              onChanged: _onSearch,
            ),
            Expanded(
              child: _buildMentorsList(),
            ),
            BottomNavBar(selectedIndex: 1),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return const Padding(
      padding: EdgeInsets.all(24.0),
      child: Text(
        "Mentors",
        style: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold,
          color: AppColors.textPrimary,
        ),
      ),
    );
  }

  Widget _buildMentorsList() {
    return ListView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      itemCount: _mentors.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 16.0),
          child: MentorCard(mentor: _mentors[index]),
        );
      },
    );
  }
}