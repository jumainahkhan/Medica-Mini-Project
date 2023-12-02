class OnboardModel {
  String image;
  String title;

  OnboardModel({
    required this.image,
    required this.title,
  });
}

List<OnboardModel> content = [
  OnboardModel(
    image: 'assets/graphics/onboarding_1.png',
    title: 'Thousands of doctors & experts to help your health!',
  ),
  OnboardModel(
    image: 'assets/graphics/onboarding_2.png',
    title: 'Health checks & consultations easily anywhere anytime',
  ),
  OnboardModel(
    image: 'assets/graphics/onboarding_3.png',
    title: 'Let\'s start living healthy and well with us right now!',
  ),
];
