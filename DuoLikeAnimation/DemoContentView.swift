import SwiftUI

struct DemoContentView: View {
    var body: some View {
        ZStack {
            // 1. BASE BACKGROUND CARD CANVAS
            Color(red: 0.96, green: 0.96, blue: 0.96)
            
            // 2. BOTTOM FIGMA GRADIENT BLOBS LAYER (Vector 13 & 14)
            ZStack {
                // Vector 14: Dark Teal/Cyan Blob
                Ellipse()
                    .fill(Color(red: 0.0, green: 0.15, blue: 0.17))
                    .frame(width: 361, height: 276)
                    .blur(radius: 67)
                    .offset(x: -80, y: 250)
                
                // Vector 13: Hot Pink/Crimson Blob
                Ellipse()
                    .fill(Color(red: 1.0, green: 0.09, blue: 0.3))
                    .frame(width: 361, height: 276)
                    .blur(radius: 67)
                    .offset(x: 80, y: 310)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottom)
            
            // 3. YOUR TEXTURE IMAGE OVERLAY (Loaded directly from web)
            GeometryReader { geometry in
                AsyncImage(url: URL(string: "https://kommodo.ai")) { phase in
                    switch phase {
                    case .success(let image):
                        image
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: geometry.size.width, height: geometry.size.height)
                            .opacity(0.15) // Subtle blend for the grain texture
                            .blendMode(.multiply)
                    default:
                        Color.clear
                    }
                }
            }
            .ignoresSafeArea()

            // 4. FOREGROUND INTERFACE SCENE VECTORS
            VStack(spacing: 0) {
                // Top Header Panel
                HStack(alignment: .center) {
                    Text("FloSpace")
                        .font(.system(size: 26, weight: .bold, design: .rounded))
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
                .padding(.horizontal, 32)
                .padding(.top, 44)
                
                Spacer()
                
                // Central Canvas Text & Graphic Cluster
                VStack(spacing: 20) {
                    // Modern App Workspace Vector Branding Frame
                    ZStack {
                        RoundedRectangle(cornerRadius: 18)
                            .fill(Color.white.opacity(0.9))
                            .frame(width: 64, height: 64)
                            .shadow(color: Color.black.opacity(0.05), radius: 10, x: 0, y: 5)
                        
                        Image(systemName: "doc.text.viewfinder")
                            .font(.system(size: 26, weight: .semibold))
                            .foregroundColor(Color(red: 0.18, green: 0.18, blue: 0.18))
                    }
                    
                    VStack(spacing: 10) {
                        Text("Add your resume and links")
                            .font(.system(size: 20, weight: .bold))
                            .foregroundColor(Color(red: 0.18, green: 0.18, blue: 0.18))
                        
                        Text("FloSpace keeps them ready to use whenever you apply.")
                            .font(.system(size: 14, weight: .medium))
                            .multilineTextAlignment(.center)
                            .foregroundColor(Color(red: 0.31, green: 0.31, blue: 0.31))
                            .lineSpacing(4)
                            .padding(.horizontal, 28)
                    }
                }
                
                Spacer()
                
                // Bottom Floating Pill CTA Node with Right Arrow
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
                .padding(.vertical, 14)
                .frame(width: 320, alignment: .center)
                .background(Color(red: 0.04, green: 0.04, blue: 0.04))
                .cornerRadius(100)
                .padding(.bottom, 44)
                .shadow(color: Color.black.opacity(0.15), radius: 12, x: 0, y: 6)
            }
        }
        .frame(width: 477, height: 803) // Preserves your exact Figma component boundaries
        .cornerRadius(32)
        .shadow(color: Color.black.opacity(0.12), radius: 30, x: 0, y: 15)
    }
}

#Preview {
    DemoContentView()
}
