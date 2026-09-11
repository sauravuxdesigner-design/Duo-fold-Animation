import SwiftUI
import PhotosUI // Native Apple Framework for secure photo gallery access

struct DemoContentView: View {
    // Gallery selection state parameters variables
    @State private var selectedItem: PhotosPickerItem? = nil
    @State private var selectedImage: UIImage? = nil
    
    private let columns = [GridItem(.flexible(), spacing: 12), GridItem(.flexible(), spacing: 12)]

    var body: some View {
        ZStack {
            // LAYER 1: BASE SYSTEM BACKGROUND
            Color(red: 0.05, green: 0.05, blue: 0.07)
                .ignoresSafeArea()
            
            // LAYER 2: CONDITIONAL WALLPAPER STATE (Displays your custom gallery pick or falls back to your Figma gradients)
            GeometryReader { geo in
                if let uiImage = selectedImage {
                    // Custom User Photo from Gallery
                    Image(uiImage: uiImage)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: geo.size.width, height: geo.size.height)
                        .clipped()
                } else {
                    // Default Figma Vector Gradient Wallpaper Module
                    ZStack {
                        Circle()
                            .fill(Color(red: 0.0, green: 0.15, blue: 0.17))
                            .frame(width: geo.size.width * 1.1, height: geo.size.height * 0.45)
                            .blur(radius: 75)
                            .offset(x: -geo.size.width * 0.25, y: geo.size.height * 0.18)
                        
                        Circle()
                            .fill(Color(red: 1.0, green: 0.09, blue: 0.3))
                            .frame(width: geo.size.width * 1.1, height: geo.size.height * 0.45)
                            .blur(radius: 75)
                            .offset(x: geo.size.width * 0.25, y: geo.size.height * 0.25)
                    }
                    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottom)
                }
            }
            .ignoresSafeArea()
            
            // LAYER 3: GRAIN NOISE STIPPLE OVERLAY
            GeometryReader { geometry in
                AsyncImage(url: URL(string: "https://kommodo.ai")) { phase in
                    switch phase {
                    case .success(let image):
                        image
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: geometry.size.width, height: geometry.size.height)
                            .opacity(0.25)
                            .blendMode(.screen)
                    default:
                        Color.clear
                    }
                }
            }
            .ignoresSafeArea()

            // LAYER 4: NATIVE FOREGROUND iOS SYSTEM INTERFACE 
            VStack(spacing: 0) {
                
                // APPLE STATUS BAR CUTOUT
                HStack {
                    Text("9:41")
                        .font(.system(size: 15, weight: .semibold))
                        .foregroundColor(.white)
                        .frame(width: 60, alignment: .leading)
                    Spacer()
                    Spacer().frame(width: 110) // Space reserved for hardware Dynamic Island Cutout
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
                
                // MAIN SYSTEM WORKSPACE PANEL
                VStack(spacing: 28) {
                    
                    // CALL-TO-ACTION SYSTEM WIDGET (PhotosPicker Integration Engine)
                    PhotosPicker(selection: $selectedItem, matching: .images, photoLibrary: .shared()) {
                        HStack(spacing: 16) {
                            VStack(alignment: .leading, spacing: 4) {
                                Text("CUSTOM IMAGE ENGINE")
                                    .font(.system(size: 10, weight: .bold))
                                    .foregroundColor(.white.opacity(0.6))
                                Text(selectedImage == nil ? "Tap to Add Photo" : "Change Wallpaper")
                                    .font(.system(size: 17, weight: .bold))
                                    .foregroundColor(.white)
                                Text("Select any image file from your device gallery canvas to test texture layering.")
                                    .font(.system(size: 12, weight: .medium))
                                    .foregroundColor(.white.opacity(0.7))
                                    .multilineTextAlignment(.leading)
                                    .lineLimit(2)
                            }
                            Spacer()
                            
                            // Interactive Vector Trigger Icon Button
                            ZStack {
                                RoundedRectangle(cornerRadius: 16, style: .continuous)
                                    .fill(LinearGradient(colors: [.purple, .pink], startPoint: .top, endPoint: .bottom))
                                    .frame(width: 56, height: 56)
                                
                                Image(systemName: selectedImage == nil ? "photo.on.rectangle.angled" : "arrow.triangle.2.circlepath")
                                    .foregroundColor(.white)
                                    .font(.title3)
                            }
                        }
                        .padding(16)
                        .frame(maxWidth: .infinity)
                        .background(Color.white.opacity(0.12))
                        .cornerRadius(24, style: .continuous)
                        .overlay(RoundedRectangle(cornerRadius: 24, style: .continuous).stroke(Color.white.opacity(0.08), lineWidth: 0.5))
                    }
                    .buttonStyle(.plain) // Preserves the exact custom design formatting colors
                    
                    // APP SYMBOL ICON GRID SQUIRCLES
                    VStack(spacing: 26) {
                        HStack(spacing: 24) {
                            ProIconTile(name: "Messages", symbol: "message.fill", color: .green)
                            ProIconTile(name: "Photos", symbol: "photo.on.rectangle.angled", color: .blue)
                            ProIconTile(name: "Figma", symbol: "pencil.tip.crop.circle", color: .purple)
                            ProIconTile(name: "Safari", symbol: "compass.drawing", color: .cyan)
                        }
                        HStack(spacing: 24) {
                            ProIconTile(name: "Maps", symbol: "map.fill", color: .orange)
                            ProIconTile(name: "Files", symbol: "folder.fill", color: .blue)
                            ProIconTile(name: "Settings", symbol: "gearshape.fill", color: .gray)
                            ProIconTile(name: "App Store", symbol: "a.square.fill", color: .indigo)
                        }
                    }
                }
                .padding(.horizontal, 20)
                .padding(.top, 36)
                
                Spacer()
                
                // BOTTOM GLASS DOCK BLOCK
                HStack(spacing: 24) {
                    ProDockTile(symbol: "phone.fill", color: .green)
                    ProDockTile(symbol: "envelope.fill", color: .blue)
                    ProDockTile(symbol: "safari.fill", color: .cyan)
                    ProDockTile(symbol: "music.note", color: .pink)
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
        // Asynchronous listener task loads chosen gallery files data into memory safely
        .onChange(of: selectedItem) { newItem in
            Task {
                if let data = try? await newItem?.loadTransferable(type: Data.self),
                   let uiImage = UIImage(data: data) {
                    await MainActor.run {
                        self.selectedImage = uiImage
                    }
                }
            }
        }
    }
}

struct ProIconTile: View {
    let name: String
    let symbol: String
    let color: Color
    var body: some View {
        VStack(spacing: 6) {
            ZStack {
                RoundedRectangle(cornerRadius: 15, style: .continuous)
                    .fill(Color(red: 0.15, green: 0.15, blue: 0.18))
                    .frame(width: 62, height: 62)
                    .overlay(RoundedRectangle(cornerRadius: 15, style: .continuous).stroke(Color.white.opacity(0.06), lineWidth: 0.5))
                Image(systemName: symbol).font(.system(size: 26, weight: .medium)).foregroundStyle(color.gradient)
            }
            Text(name).font(.system(size: 11, weight: .medium)).foregroundColor(.white.opacity(0.8)).lineLimit(1)
        }
        .frame(maxWidth: .infinity)
    }
}

struct ProDockTile: View {
    let symbol: String
    let color: Color
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 15, style: .continuous)
