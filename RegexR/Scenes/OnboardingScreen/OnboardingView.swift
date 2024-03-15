import SwiftUI



struct OnboardingView: View {
    private let slides: [OnboardingSlideModels.OnboardingSlide] = [
        OnboardingSlideModels.OnboardingSlide(image: "figure.run", title: "Run", description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam sagittis gravida finibus. Morbi in eros pretium, fringilla orci sed, bibendum dui. Praesent sed egestas ante."),
        OnboardingSlideModels.OnboardingSlide(image: "airplane.departure", title: "Depart", description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam sagittis gravida finibus"),
        OnboardingSlideModels.OnboardingSlide(image: "airplane", title: "Fly", description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam sagittis gravida finibus. Morbi in eros pretium, fringilla orci sed, bibendum dui. Praesent sed egestas ante. "),
    ]
    
    @AppStorage("FirstStart") var shouldOnboardingBeShown = true
    
    @State private var currentPage = 0
    
    var body: some View {
        VStack {
            TabView(selection: $currentPage) {
                ForEach (0 ..< slides.count, id:\.self) { idx in
                    OnboardingSlideView(slide: slides[idx])
                        .tag(idx)
                        .padding()
                }
            }
            // implements scrolling part
            .tabViewStyle(PageTabViewStyle())
        
            // NEXT button
            HStack {
                if (self.currentPage != slides.count - 1) {
                    Spacer()
                    Button(action: {
                        withAnimation (.easeInOut(duration: 0.5)) {
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
                    Button(action: {
                        withAnimation (.easeInOut(duration: 0.5)) {
                            // show onboarding only in the initial app run
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
