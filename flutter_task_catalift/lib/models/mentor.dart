class Mentor {
  final String name;
  final String? profileImage;
  final double rating;
  final String sector;
  final int experienceYears;
  final String qualification;
  final int reviewCount;
  final String bio;
  final int compatibilityPercentage;

  Mentor({
    required this.name,
    this.profileImage,
    required this.rating,
    required this.sector,
    required this.experienceYears,
    required this.qualification,
    required this.reviewCount,
    required this.bio,
    required this.compatibilityPercentage,
  });

  static List<Mentor> getMockMentors() {
    return [
      Mentor(
        name: 'Gaurav Samant',
        profileImage: 'assets/profile_image.jpeg',
        rating: 4.9,
        sector: 'IT Sector',
        experienceYears: 4,
        qualification: 'Business Administration',
        reviewCount: 175,
        bio:
            'Strategy Manager @CEO Office | Ex-eBay & L&T | MDI Gurgaon · ESCP Europe | 32+ National Case Comps Podiums',
        compatibilityPercentage: 98,
      ),
      Mentor(
        name: 'Gaurav Samant',
        profileImage: 'assets/profile_image.jpeg',
        rating: 4.9,
        sector: 'IT Sector',
        experienceYears: 4,
        qualification: 'Business Administration',
        reviewCount: 175,
        bio:
            'Strategy Manager @CEO Office | Ex-eBay & L&T | MDI Gurgaon · ESCP Europe | 32+ National Case Comps Podiums',
        compatibilityPercentage: 82,
      ),
      Mentor(
        name: 'Gaurav Samant',
        profileImage: 'assets/profile_image.jpeg',
        rating: 4.9,
        sector: 'IT Sector',
        experienceYears: 4,
        qualification: 'Business Administration',
        reviewCount: 175,
        bio:
            'Strategy Manager @CEO Office | Ex-eBay & L&T | MDI Gurgaon · ESCP Europe | 32+ National Case Comps Podiums',
        compatibilityPercentage: 75,
      ),
    ];
  }
}
