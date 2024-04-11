class OnboardingContent {
  String image;
  String title;
  String description;
  OnboardingContent(
      {required this.description, required this.image, required this.title});
}

List<OnboardingContent> contents = [
  OnboardingContent(
      description:
          "Satisfy Your Cravings in Just a Few Taps! \n                Level up your food game",
      image: "images/eat.jpg",
      title: "Download 'EAT MORE'"),
  OnboardingContent(
      description:
          "Enjoy secure transactions with \n                     'EAT MORE'",
      image: "images/pay.jpg",
      title: "Pay with ease, taste with Pleasure"),
  OnboardingContent(
      description: "EAT MORE delivers 24/7 \n Right to your Doorstep!'",
      image: "images/delivery.jpg",
      title: " Craving struck at midnight?")
];
