import SwiftUI

struct DemoContentView: View {
    var body: some View {
        ZStack {
            // 1. BASE BACKGROUND CANVASES (Adapts dynamically to full screen edges)
            Color(red: 0.96, green: 0.96, blue: 0.96)
                .ignoresSafeArea()
            
            // 2. RESPONSIVE FIGMA GRADIENT BLOB VECTORS (Scales relative to screen boundaries)
            GeometryReader { geo in
                ZStack {
                    // Vector 14: Dark Teal/Cyan Blur Module
                    Circle()
                        .fill(Color(red: 0.0, green: 0.15, blue: 0.17))
                        .frame(width: geo.size.width * 0.85, height: geo.size.height * 0.35)
                        .blur(radius: 67)
                        .offset(x: -geo.size.width * 0.2, y: geo.size.height * 0.25)
                    
                    // Vector 13: Hot Pink/Crimson Blur Module
                    Circle()
                        .fill(Color(red: 1.0, green: 0.09, blue: 0.3))
                        .frame(width: geo.size.width * 0.85, height: geo.size.height * 0.35)
                        .blur(radius: 67)
                        .offset(x: geo.size.width * 0.2, y: geo.size.height * 0.32)
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottom)
            }
            
            // 3. GRAIN TEXTURE BLEND (Fills screen without distorting grain detail)
            GeometryReader { geometry in
                AsyncImage(url: URL(string: "https://kommodo.ai")) { phase in
                    switch phase {
                    case .success(let image):
                        image
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: geometry.size.width, height: geometry.size.height)
                            .opacity(0.65)
                            .blendMode(.multiply)
                    default:
                        Color.clear
                    }
                }
            }
            .ignoresSafeArea()

            // 4. FOREGROUND LAYER CONTAINER (Strictly responsive layout structure)
            VStack(spacing: 0) {
                // Top Header Block
                HStack(alignment: .center) {
                    Text("FloSpace")
                        .font(.system(size: 24, weight: .bold, design: .default))
                        .foregroundColor(Color(red: 0.18, green: 0.18, blue: 0.18))
                    
                    Spacer()
                    
                    // Close Circle Action Node
                    HStack(alignment: .center, spacing: 0) {
                        Image(systemName: "xmark")
                            .font(.system(size: 13, weight: .bold))
                            .foregroundColor(Color(red: 0.18, green: 0.18, blue: 0.18))
                    }
                    .padding(4)
                    .frame(width: 32, height: 32, alignment: .center)
                    .background(Color.white)
                    .cornerRadius(8)
                    .shadow(color: Color.black.opacity(0.04), radius: 4, x: 0, y: 2)
                }
                .padding(.horizontal, 24)
                .padding(.top, 16)
                
                Spacer() // Pushes content apart fluidly based on display height
                
                // Central Text & Graphic Cluster
                VStack(spacing: 24) {
                    // Custom App Branding Core Module (64x64)
                    ZStack {
                        RoundedRectangle(cornerRadius: 18)
                            .fill(Color.white.opacity(0.85))
                            .frame(width: 64, height: 64)
                            .shadow(color: Color.black.opacity(0.05), radius: 10, x: 0, y: 5)
                        
                        Image(systemName: "doc.text.viewfinder")
                            .font(.system(size: 26, weight: .semibold))
                            .foregroundColor(Color(red: 0.18, green: 0.18, blue: 0.18))
                    }
                    
                    VStack(spacing: 12) {
                        Text("Add your resume and links")
                            .font(.system(size: 20, weight: .bold))
                            .foregroundColor(Color(red: 0.18, green: 0.18, blue: 0.18))
                            .multilineTextAlignment(.center)
                        
                        Text("FloSpace keeps them ready to use whenever you apply.")
                            .font(.system(size: 14, weight: .medium))
                            .multilineTextAlignment(.center)
                            .foregroundColor(Color(red: 0.31, green: 0.31, blue: 0.31))
                            .lineSpacing(4)
                            .padding(.horizontal, 20)
                    }
                }
                .frame(maxWidth: .infinity)
                
                Spacer() // Elastic spacing adapts to fill tall mobile screens smoothly
                
                // Bottom Responsive CTA Pill Button Layout
                HStack(alignment: .center) {
                    Text("Get Started")
                        .font(.system(size: 15, weight: .semibold))
                        .foregroundColor(.white)
                    Spacer()
                    Image(systemName: "arrow.right")
                        .font(.system(size: 14, weight: .bold))
                        .foregroundColor(.white)
                }
                .padding(.horizontal, 24)
                .padding(.vertical, 16)
                .frame(maxWidth: 340) // Keeps the navigation pill looking clean and proportional
                .background(Color(red: 0.04, green: 0.04, blue: 0.04))
                .cornerRadius(100)
                .padding(.bottom, 16)
                .shadow(color: Color.black.opacity(0.12), radius: 12, x: 0, y: 6)
            }
            .padding(.vertical)
        }
    }
}

#Preview {
    DemoContentView()
}
