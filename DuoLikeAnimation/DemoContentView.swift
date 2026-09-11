import SwiftUI

struct DemoContentView: View {
    var body: some View {
        GeometryReader { geo in
            Image("LockScreen")
                .resizable()
                .scaledToFill()
                .frame(
                    width: geo.size.width,
                    height: geo.size.height
                )
                .clipped()
        }
        .ignoresSafeArea()
    }
}
