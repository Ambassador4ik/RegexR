
import SwiftUI

struct OnboardingSlideView: View {
    let slide: OnboardingSlideModels.OnboardingSlide

    var body: some View {
        VStack {
            Spacer()
            Image(systemName: slide.image)
                .resizable()
                .aspectRatio(contentMode: .fit)
            Spacer()
            Group {
                HStack {
                    Text(slide.title)
                        .font(.title)
                        .foregroundColor(.blue)
                    Spacer()
                }
                HStack {
                    Text(slide.description)
                    Spacer()
                }
            }
            .padding()
        }
    }
}

struct OnboardingSlideView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingSlideView(slide: OnboardingSlideModels.OnboardingSlide(image: "airpane", title: "test", description: "test"))
    }
}
