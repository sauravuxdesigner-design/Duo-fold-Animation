import SwiftUI

struct DemoContentView: View {
    var body: some View {
        ZStack {
            // 1. BASE BACKGROUND & FIGMA GRADIENT BLOB VECTORS
            Color(red: 0.94, green: 0.94, blue: 0.96)
                .ignoresSafeArea()
            
            GeometryReader { geo in
                ZStack {
                    // Vector 14: Dark Teal/Cyan Blur Module
                    Circle()
                        .fill(Color(red: 0.0, green: 0.15, blue: 0.17))
                        .frame(width: geo.size.width * 0.95, height: geo.size.height * 0.4)
                        .blur(radius: 67)
                        .offset(x: -geo.size.width * 0.22, y: geo.size.height * 0.22)
                    
                    // Vector 13: Hot Pink/Crimson Blur Module
                    Circle()
                        .fill(Color(red: 1.0, green: 0.09, blue: 0.3))
                        .frame(width: geo.size.width * 0.95, height: geo.size.height * 0.4)
                        .blur(radius: 67)
                        .offset(x: geo.size.width * 0.22, y: geo.size.height * 0.28)
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottom)
            }
            
            // 2. ATTACHED GRAIN NOISE TEXTURE OVERLAY
            GeometryReader { geometry in
                AsyncImage(url: URL(string: "https://kommodo.ai")) { phase in
                    switch phase {
                    case .success(let image):
                        image
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: geometry.size.width, height: geometry.size.height)
                            .opacity(0.45) // Subtle grain blend overlay matching your image asset
                            .blendMode(.multiply)
                    default:
                        Color.clear
                    }
                }
            }
            .ignoresSafeArea()

            // 3. NATIVE iOS SYSTEM GRID INTERFACE
            VStack(spacing: 0) {
                
                // APPLE iOS STATUS BAR
                HStack {
                    Text("9:41")
                        .font(.system(size: 15, weight: .semibold, design: .default))
                        .foregroundColor(Color(red: 0.1, green: 0.1, blue: 0.1))
                    Spacer()
                    HStack(spacing: 5) {
                        Image(systemName: "cellularbars")
                        Image(systemName: "wifi")
                        Image(systemName: "battery.100")
                    }
                    .font(.system(size: 13, weight: .medium))
                    .foregroundColor(Color(red: 0.1, green: 0.1, blue: 0.1))
                }
                .padding(.horizontal, 32)
                .padding(.top, 14)
                
                // HOME SCREEN MAIN GRID WORKSPACE
                VStack(spacing: 28) {
                    
                    // NATIVE 2x4 LARGE SYSTEM WIDGET (Media / Music Player Style)
                    HStack(spacing: 16) {
                        VStack(alignment: .leading, spacing: 4) {
                            Text("NOW PLAYING")
                                .font(.system(size: 10, weight: .bold))
                                .foregroundColor(.secondary)
                            Text("FloSpace Canvas")
                                .font(.system(size: 16, weight: .bold))
                                .foregroundColor(Color(red: 0.15, green: 0.15, blue: 0.15))
                            Text("Design System Sync")
                                .font(.system(size: 13, weight: .medium))
                                .foregroundColor(.secondary)
                            Spacer()
                            HStack(spacing: 14) {
                                Image(systemName: "backward.fill")
                                Image(systemName: "play.fill").font(.system(size: 18))
                                Image(systemName: "forward.fill")
                            }
                            .foregroundColor(Color(red: 0.15, green: 0.15, blue: 0.15))
                        }
                        Spacer()
                        
                        // Album Art Vector Container with Soft Vignette
                        RoundedRectangle(cornerRadius: 16, style: .continuous)
                            .fill(LinearGradient(colors: [.purple, .indigo], startPoint: .top, endPoint: .bottom))
                            .frame(width: 64, height: 64)
                            .overlay(Image(systemName: "music.note").foregroundColor(.white).font(.title3))
                            .shadow(color: Color.purple.opacity(0.15), radius: 6, x: 0, y: 3)
                    }
                    .padding(16)
                    .frame(maxWidth: .infinity)
                    .frame(height: 140)
                    .background(Color.white.opacity(0.45)) // Frosted translucent canvas core
                    .cornerRadius(24, style: .continuous) // Squircle corner profile
                    .shadow(color: Color.black.opacity(0.03), radius: 10, x: 0, y: 4)
                    
                    // APP INTERFACE VECTOR GRID (60x60 Standard Squircles)
                    VStack(spacing: 24) {
                        // ROW 1
                        HStack(spacing: 26) {
                            IOSIconComponent(name: "Messages", symbol: "message.fill", themeColor: .green)
                            IOSIconComponent(name: "Photos", symbol: "photo.on.rectangle.angled", themeColor: .blue)
                            IOSIconComponent(name: "Figma", symbol: "pencil.tip.crop.circle", themeColor: .purple)
                            IOSIconComponent(name: "Safari", symbol: "compass.drawing", themeColor: .cyan)
                        }
                        
                        // ROW 2
                        HStack(spacing: 26) {
                            IOSIconComponent(name: "Maps", symbol: "map.fill", themeColor: .orange)
                            IOSIconComponent(name: "Files", symbol: "folder.fill", themeColor: .blue)
                            IOSIconComponent(name: "Settings", symbol: "gearshape.fill", themeColor: .gray)
                            IOSIconComponent(name: "App Store", symbol: "a.square.fill", themeColor: .blue)
                        }
                    }
                    .padding(.horizontal, 4)
                }
                .padding(.horizontal, 24)
                .padding(.top, 32)
                
                Spacer() // Pushes the dock block to the lower device boundaries smoothly
                
                // APPLE BOTTOM BLURRED APP DOCK ROW REPLICA (Ultra-Thin Material Blur Look)
                HStack(spacing: 26) {
                    DockIconComponent(symbol: "phone.fill", themeColor: .green)
                    DockIconComponent(symbol: "envelope.fill", themeColor: .blue)
                    DockIconComponent(symbol: "safari.fill", themeColor: .cyan)
                    DockIconComponent(symbol: "music.note", themeColor: .pink)
                }
                .padding(.horizontal, 24)
                .padding(.vertical, 18)
                .frame(maxWidth: .infinity)
                .background(RoundedRectangle(cornerRadius: 36, style: .continuous).fill(Color.white.opacity(0.35)))
                .padding(.horizontal, 20)
                .padding(.bottom, 24)
                .shadow(color: Color.black.opacity(0.04), radius: 20, x: 0, y: 8)
            }
        }
    }
}

// Custom App Icon Squircles
struct IOSIconComponent: View {
    let name: String
    let symbol: String
    let themeColor: Color
    
    var body: some View {
        VStack(spacing: 6) {
            ZStack {
                RoundedRectangle(cornerRadius: 15, style: .continuous)
                    .fill(themeColor.gradient)
                    .frame(width: 60, height: 60)
                    .shadow(color: Color.black.opacity(0.04), radius: 5, x: 0, y: 3)
                
                Image(systemName: symbol)
                    .font(.system(size: 26, weight: .medium))
                    .foregroundColor(.white)
            }
            Text(name)
                .font(.system(size: 11, weight: .medium))
                .foregroundColor(Color(red: 0.12, green: 0.12, blue: 0.12))
                .lineLimit(1)
        }
        .frame(maxWidth: .infinity)
    }
}

// Custom Dock Icon Component
struct DockIconComponent: View {
    let symbol: String
    let themeColor: Color
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 15, style: .continuous)
                .fill(themeColor.gradient)
                .frame(width: 60, height: 60)
            
            Image(systemName: symbol)
                .font(.system(size: 26, weight: .medium))
                .foregroundColor(.white)
        }
        .frame(maxWidth: .infinity)
    }
}

#Preview {
    DemoContentView()
}
