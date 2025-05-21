import 'package:flutter/material.dart';
import '../models/mentor.dart';
import '../constants/app_colors.dart';

class MentorCard extends StatelessWidget {
  final Mentor mentor;
  
  const MentorCard({
    super.key,
    required this.mentor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildMentorHeader(),
          const SizedBox(height: 12),
          _buildMentorMetadata(),
          const SizedBox(height: 12),
          _buildMentorBio(),
          const SizedBox(height: 12),
          _buildCompatibilityScore(),
        ],
      ),
    );
  }

  Widget _buildMentorHeader() {
    return Row(
      children: [
        CircleAvatar(
          radius: 30,
                        backgroundImage: mentor.profileImage != null 
              ? AssetImage(mentor.profileImage!) 
              : null,
          backgroundColor: Colors.grey.shade200,
          child: mentor.profileImage == null 
              ? const Icon(Icons.person, color: Colors.grey, size: 30) 
              : null,
        ),
        const SizedBox(width: 16),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const Icon(Icons.star, color: Colors.amber, size: 18),
                const SizedBox(width: 4),
                Text(
                  mentor.rating.toString(),
                  style: const TextStyle(
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(width: 8),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 2,
                  ),
                  decoration: BoxDecoration(
                    color: const Color(0xFFF5F5F5),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Text(
                    mentor.sector,
                    style: const TextStyle(
                      fontSize: 12,
                      color: Color(0xFFFF9800),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 4),
            Text(
              mentor.name,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildMentorMetadata() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            _buildInfoItem(Icons.access_time, "${mentor.experienceYears} years"),
            const SizedBox(width: 16),
            _buildInfoItem(Icons.business, mentor.qualification),
          ],
        ),
        const SizedBox(height: 8),
        _buildInfoItem(Icons.star_border, "${mentor.reviewCount} Reviews"),
      ],
    );
  }

  Widget _buildMentorBio() {
    return Text(
      mentor.bio,
      style: const TextStyle(
        fontSize: 12,
        color: Colors.grey,
      ),
    );
  }

  Widget _buildCompatibilityScore() {
    final compatibilityColor = mentor.compatibilityPercentage >= 90 
        ? AppColors.highCompatibility // Green for high compatibility
        : AppColors.mediumCompatibility; // Yellow for medium compatibility
    
    return Row(
      children: [
        Text(
          "${mentor.compatibilityPercentage}%",
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: compatibilityColor,
          ),
        ),
        const SizedBox(width: 8),
        Text(
          "compatibility",
          style: TextStyle(
            fontSize: 14,
            color: compatibilityColor,
          ),
        ),
      ],
    );
  }

  Widget _buildInfoItem(IconData icon, String text) {
    return Row(
      children: [
        Icon(
          icon,
          size: 16,
          color: Colors.grey,
        ),
        const SizedBox(width: 4),
        Text(
          text,
          style: const TextStyle(
            fontSize: 12,
            color: Colors.grey,
          ),
        ),
      ],
    );
  }
}