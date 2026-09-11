import SwiftUI

struct DemoContentView: View {
    var body: some View {
        ZStack {
            // 1. BASE BACKGROUND & YOUR FIGMA BLUR WALLPAPER
            Color(red: 0.05, green: 0.05, blue: 0.07) // Sleek dark mode canvas
                .ignoresSafeArea()
            
            GeometryReader { geo in
                ZStack {
                    // Vector 14: Dark Teal/Cyan Blur Module
                    Circle()
                        .fill(Color(red: 0.0, green: 0.15, blue: 0.17))
                        .frame(width: geo.size.width * 1.1, height: geo.size.height * 0.45)
                        .blur(radius: 75)
                        .offset(x: -geo.size.width * 0.25, y: geo.size.height * 0.18)
                    
                    // Vector 13: Hot Pink/Crimson Blur Module
                    Circle()
                        .fill(Color(red: 1.0, green: 0.09, blue: 0.3))
                        .frame(width: geo.size.width * 1.1, height: geo.size.height * 0.45)
                        .blur(radius: 75)
                        .offset(x: geo.size.width * 0.25, y: geo.size.height * 0.25)
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
                            .opacity(0.35)
                            .blendMode(.screen) // Blends cleanly into deep dark mode colors
                    default:
                        Color.clear
                    }
                }
            }
            .ignoresSafeArea()

            // 3. IPHONE 16 PRO SPECIFIC SYSTEM LAYER CONTAINER
            VStack(spacing: 0) {
                
                // IPHONE 16 PRO STATUS BAR (Spaced dynamically around the Dynamic Island)
                HStack {
                    Text("9:41")
                        .font(.system(size: 15, weight: .semibold, design: .default))
                        .foregroundColor(.white)
                        .frame(width: 60, alignment: .leading)
                    
                    Spacer()
                    
                    // Fixed spacing layout to leave room for the physical Dynamic Island hardware cutout
                    Spacer()
                        .frame(width: 110)
                    
                    Spacer()
                    
                    HStack(spacing: 6) {
                        Image(systemName: "cellularbars")
                        Image(systemName: "wifi")
                        Image(systemName: "battery.100")
                    }
                    .font(.system(size: 12, weight: .semibold))
                    .foregroundColor(.white)
                    .frame(width: 60, alignment: .trailing)
                }
                .padding(.horizontal, 24)
                .padding(.top, 16)
                
                // RESPONSIVE SYSTEM APP & WIDGET WORKSPACE GRID
                VStack(spacing: 32) {
                    
                    // 2x4 LARGE SYSTEM METRIC WIDGET (FloSpace Core Panel Look)
                    HStack(spacing: 16) {
                        VStack(alignment: .leading, spacing: 4) {
                            Text("NOW PLAYING")
                                .font(.system(size: 10, weight: .bold))
                                .foregroundColor(.white.opacity(0.5))
                            Text("FloSpace Canvas")
                                .font(.system(size: 16, weight: .bold))
                                .foregroundColor(.white)
                            Text("Design System Sync")
                                .font(.system(size: 13, weight: .medium))
                                .foregroundColor(.white.opacity(0.6))
                            Spacer()
                            HStack(spacing: 16) {
                                Image(systemName: "backward.fill")
                                Image(systemName: "play.fill").font(.system(size: 18))
                                Image(systemName: "forward.fill")
                            }
                            .foregroundColor(.white)
                        }
                        Spacer()
                        
                        RoundedRectangle(cornerRadius: 16, style: .continuous)
                            .fill(LinearGradient(colors: [.purple, .pink], startPoint: .top, endPoint: .bottom))
                            .frame(width: 64, height: 64)
                            .overlay(Image(systemName: "sparkles").foregroundColor(.white).font(.title3))
                    }
                    .padding(16)
                    .frame(maxWidth: .infinity)
                    .frame(height: 140)
                    .background(Color.white.opacity(0.12)) // Dark mode material translucency
                    .cornerRadius(24, style: .continuous) // Squircle profile
                    .overlay(RoundedRectangle(cornerRadius: 24, style: .continuous).stroke(Color.white.opacity(0.08), lineWidth: 0.5))
                    
                    // MODERN APP INTERFACE GRID (Clean matching dark-themed squircle rows)
                    VStack(spacing: 26) {
                        // ROW 1
                        HStack(spacing: 24) {
                            ProIconComponent(name: "Messages", symbol: "message.fill", tintColor: .green)
                            ProIconComponent(name: "Photos", symbol: "photo.on.rectangle.angled", tintColor: .blue)
                            ProIconComponent(name: "Figma", symbol: "pencil.tip.crop.circle", tintColor: .purple)
                            ProIconComponent(name: "Safari", symbol: "compass.drawing", tintColor: .cyan)
                        }
                        
                        // ROW 2
                        HStack(spacing: 24) {
                            ProIconComponent(name: "Maps", symbol: "map.fill", tintColor: .orange)
                            ProIconComponent(name: "Files", symbol: "folder.fill", tintColor: .blue)
                            ProIconComponent(name: "Settings", symbol: "gearshape.fill", tintColor: .gray)
                            ProIconComponent(name: "App Store", symbol: "a.square.fill", tintColor: .indigo)
                        }
                    }
                }
                .padding(.horizontal, 20)
                .padding(.top, 36)
                
                Spacer() // Elastic spacer matches thin iPhone 16 Pro layout bounds perfectly
                
                // BOTTOM FLOATING APP DOCK BAR (Clean Dark Glass Material)
                HStack(spacing: 24) {
                    ProDockComponent(symbol: "phone.fill", tintColor: .green)
                    ProDockComponent(symbol: "envelope.fill", tintColor: .blue)
                    ProDockComponent(symbol: "safari.fill", tintColor: .cyan)
                    ProDockComponent(symbol: "music.note", tintColor: .pink)
                }
                .padding(.horizontal, 24)
                .padding(.vertical, 16)
                .frame(maxWidth: .infinity)
                .background(RoundedRectangle(cornerRadius: 36, style: .continuous).fill(Color.white.opacity(0.14)))
                .overlay(RoundedRectangle(cornerRadius: 36, style: .continuous).stroke(Color.white.opacity(0.08), lineWidth: 0.5))
                .padding(.horizontal, 16)
                .padding(.bottom, 24)
            }
        }
    }
}

// iPhone 16 Pro Grid Icon Layout System
struct ProIconComponent: View {
    let name: String
    let symbol: String
    let tintColor: Color
    
    var body: some View {
        VStack(spacing: 6) {
            ZStack {
                // Generates the dark-tinted monochrome style look option
                RoundedRectangle(cornerRadius: 15, style: .continuous)
                    .fill(Color(red: 0.15, green: 0.15, blue: 0.18))
                    .frame(width: 62, height: 62)
                    .overlay(
                        RoundedRectangle(cornerRadius: 15, style: .continuous)
                            .stroke(Color.white.opacity(0.06), lineWidth: 0.5)
                    )
                
                Image(systemName: symbol)
                    .font(.system(size: 26, weight: .medium))
                    .foregroundStyle(tintColor.gradient) // Colored glyph branding accent
            }
            Text(name)
                .font(.system(size: 11, weight: .medium))
                .foregroundColor(.white.opacity(0.8))
                .lineLimit(1)
        }
        .frame(maxWidth: .infinity)
    }
}

// iPhone 16 Pro Bottom App Dock Layout System
struct ProDockComponent: View {
    let symbol: String
    let tintColor: Color
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 15, style: .continuous)
                .fill(Color(red: 0.18, green: 0.18, blue: 0.22))
                .frame(width: 62, height: 62)
                .overlay(
                    RoundedRectangle(cornerRadius: 15, style: .continuous)
                        .stroke(Color.white.opacity(0.06), lineWidth: 0.5)
                )
            
            Image(systemName: symbol)
                .font(.system(size: 26, weight: .medium))
                .foregroundStyle(tintColor.gradient)
        }
        .frame(maxWidth: .infinity)
    }
}

#Preview {
    DemoContentView()
}
