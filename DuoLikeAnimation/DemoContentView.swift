import SwiftUI

struct DemoContentView: View {
    var body: some View {
        GeometryReader { geometry in
            AsyncImage(url: URL(string: "https://kommodo.ai")) { phase in
                switch phase {
                case .success(let image):
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: geometry.size.width, height: geometry.size.height)
                        .clipped()
                case .failure(_), .empty:
                    ZStack {
                        Color.black
                        ProgressView()
                            .progressViewStyle(CircularProgressViewStyle(tint: .white))
                    }
                @unknown default:
                    Color.black
                }
            }
        }
        .ignoresSafeArea()
    }
}

#Preview {
    DemoContentView()
}
