import SwiftUI

struct OnboardingView: View {
    private let slides: [OnboardingSlideModels.OnboardingSlide] = [
        OnboardingSlideModels.OnboardingSlide(image: "text.magnifyingglass", title: "Discover", description: "Explore the power of Regular Expressions. Quickly test your patterns and see the matches in real-time."),
        OnboardingSlideModels.OnboardingSlide(image: "book", title: "Learn", description: "Dive into our tutorials and learn how to craft effective Regular Expressions, no matter your skill level."),
        OnboardingSlideModels.OnboardingSlide(image: "star", title: "Master", description: "Save your favorite expressions and share them with the community. Become a Regex master."),
    ]

    @AppStorage("FirstStart") var shouldOnboardingBeShown = true

    @State private var currentPage = 0

    var body: some View {
        VStack {
            TabView(selection: $currentPage) {
                ForEach(0 ..< slides.count, id: \.self) { idx in
                    OnboardingSlideView(slide: slides[idx])
                        .tag(idx)
                        .padding()
                }
            }
            // Implements scrolling part
            .tabViewStyle(PageTabViewStyle())

            // NEXT button
            HStack {
                if (self.currentPage != slides.count - 1) {
                    Spacer()
                    Button(action: {
                        withAnimation(.easeInOut(duration: 0.5)) {
                            self.currentPage = currentPage + 1
                        }
                    }) {
                        Image(systemName: "arrow.right")
                            .font(.largeTitle)
                            .foregroundColor(.white)
                            .padding()
                            .background(Circle().fill(.blue))
                    }
                } else {
                    // Get Started button for the last slide
                    Button(action: {
                        withAnimation(.easeInOut(duration: 0.5)) {
                            shouldOnboardingBeShown = false
                        }
                    }) {
                        Text("Get Started")
                    }
                    .font(.largeTitle)
                    .foregroundColor(.white)
                    .padding()
                    .buttonStyle(.borderedProminent)
                    .tint(.blue)
                }
            }
            .padding()
        }
    }
}

struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView()
    }
}
