class Profile {
  final String name;
  final int age;
  final String location;
  final double distanceKm;
  final String occupation;
  final String height;
  final String relationshipGoal;
  final int matchPercent;
  final int trustPercent;
  final String replyTime;
  final bool verified;
  final String imageUrl;
  final String about;
  final String birthDate;
  final String livesIn;
  final String loveLanguage;
  final String religion;
  final String interestedIn;
  final String zodiac;
  final String zodiacTraits;
  final String motherTongue;
  final String communicationStyle;

  const Profile({
    required this.name,
    required this.age,
    required this.location,
    required this.distanceKm,
    required this.occupation,
    required this.height,
    required this.relationshipGoal,
    required this.matchPercent,
    required this.trustPercent,
    required this.replyTime,
    required this.imageUrl,
    this.verified = false,
    this.about = '',
    this.birthDate = '',
    this.livesIn = '',
    this.loveLanguage = '',
    this.religion = '',
    this.interestedIn = '',
    this.zodiac = '',
    this.zodiacTraits = '',
    this.motherTongue = '',
    this.communicationStyle = '',
  });
}

/// Sample data mirroring the reference screens.
final List<Profile> sampleProfiles = [
  const Profile(
    name: 'Shraddha',
    age: 21,
    location: 'Pune',
    distanceKm: 7,
    occupation: 'Fashion Designer',
    height: '5\'4"',
    relationshipGoal: 'Serious relationship',
    matchPercent: 74,
    trustPercent: 98,
    replyTime: '~5m',
    verified: true,
    imageUrl:
        'https://images.unsplash.com/photo-1531123897727-8f129e1688ce?w=800',
  ),
  const Profile(
    name: 'Ishita',
    age: 22,
    location: 'Hyderabad',
    distanceKm: 5,
    occupation: 'Content Creator',
    height: '5\'2"',
    relationshipGoal: 'Serious relationship',
    matchPercent: 92,
    trustPercent: 98,
    replyTime: '~5m',
    imageUrl:
        'https://images.unsplash.com/photo-1544005313-94ddf0286df2?w=800',
    about:
        'Building products by day, planning my next trek by night. '
        'Looking for someone equally driven and equally curious.',
    birthDate: '19 Feb 1999',
    livesIn: 'Koregaon Park, Pune, Maharashtra',
    loveLanguage: 'Compliment (Words of affirmation)',
    religion: 'Hindu - Marathi',
    interestedIn: 'Women - Dating',
    zodiac: 'Scorpio',
    zodiacTraits: 'Loyal - Passionate - Intuitive',
    motherTongue: 'Marathi',
    communicationStyle: 'Phone calls over texts',
  ),
];
