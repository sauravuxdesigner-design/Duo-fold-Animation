import SwiftUI

struct DemoContentView: View {
    var body: some View {
        ZStack {
            // MARK: - Wallpaper
            LinearGradient(
                colors: [
                    Color(red: 0.05, green: 0.03, blue: 0.12),
                    Color(red: 0.16, green: 0.05, blue: 0.22),
                    Color(red: 0.02, green: 0.08, blue: 0.18)
                ],
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
            .ignoresSafeArea()

            GeometryReader { geo in
                ZStack {
                    Circle()
                        .fill(Color(red: 0.55, green: 0.2, blue: 0.85))
                        .frame(width: geo.size.width * 1.1, height: geo.size.width * 1.1)
                        .blur(radius: 90)
                        .offset(x: -geo.size.width * 0.3, y: -geo.size.height * 0.25)

                    Circle()
                        .fill(Color(red: 0.1, green: 0.5, blue: 0.9))
                        .frame(width: geo.size.width * 1.0, height: geo.size.width * 1.0)
                        .blur(radius: 90)
                        .offset(x: geo.size.width * 0.35, y: geo.size.height * 0.3)
                }
            }
            .ignoresSafeArea()

            // MARK: - Home screen content
            VStack(spacing: 0) {
                statusBar
                    .padding(.horizontal, 24)
                    .padding(.top, 16)

                ScrollView(.vertical, showsIndicators: false) {
                    VStack(spacing: 28) {
                        widgetStack
                        appGrid
                    }
                    .padding(.horizontal, 20)
                    .padding(.top, 20)
                }

                dock
                    .padding(.horizontal, 16)
                    .padding(.bottom, 12)
                    .padding(.top, 8)
            }
        }
    }

    // MARK: - Status bar with Dynamic Island space
    private var statusBar: some View {
        HStack {
            Text(Date(), style: .time)
                .font(.system(size: 15, weight: .semibold, design: .rounded))
                .foregroundStyle(.white)
                .frame(width: 60, alignment: .leading)

            Spacer()
            Spacer().frame(width: 126) // Dynamic Island clearance
            Spacer()

            HStack(spacing: 5) {
                Image(systemName: "cellularbars")
                Image(systemName: "wifi")
                Image(systemName: "battery.100")
            }
            .font(.system(size: 13, weight: .semibold))
            .foregroundStyle(.white)
            .frame(width: 60, alignment: .trailing)
        }
    }

    // MARK: - iOS 26-style Smart Stack + side widgets
    private var widgetStack: some View {
        HStack(spacing: 14) {
            LiquidGlassCard {
                VStack(alignment: .leading, spacing: 8) {
                    Spacer()
                    HStack {
                        Image(systemName: "photo.on.rectangle.angled")
                            .font(.system(size: 16, weight: .medium))
                        Spacer()
                    }
                    .foregroundStyle(.white.opacity(0.85))

                    Text("Memories")
                        .font(.system(size: 13, weight: .semibold, design: .rounded))
                        .foregroundStyle(.white)
                }
                .padding(14)
            }
            .frame(height: 155)
            .overlay(
                LinearGradient(
                    colors: [.purple.opacity(0.55), .indigo.opacity(0.35)],
                    startPoint: .topLeading,
                    endPoint: .bottomTrailing
                )
                .clipShape(RoundedRectangle(cornerRadius: 24, style: .continuous))
                .allowsHitTesting(false)
            )

            VStack(spacing: 14) {
                LiquidGlassCard {
                    HStack {
                        VStack(alignment: .leading, spacing: 2) {
                            Text("Bengaluru")
                                .font(.system(size: 12, weight: .medium, design: .rounded))
                                .foregroundStyle(.white.opacity(0.8))
                            Text("27°")
                                .font(.system(size: 24, weight: .semibold, design: .rounded))
                                .foregroundStyle(.white)
                        }
                        Spacer()
                        Image(systemName: "sun.max.fill")
                            .font(.system(size: 22))
                            .symbolRenderingMode(.multicolor)
                    }
                    .padding(12)
                }
                .frame(height: 70)

                LiquidGlassCard {
                    HStack {
                        VStack(alignment: .leading, spacing: 2) {
                            Text("Today")
                                .font(.system(size: 11, weight: .medium, design: .rounded))
                                .foregroundStyle(.red.opacity(0.9))
                            Text("Design review")
                                .font(.system(size: 13, weight: .semibold, design: .rounded))
                                .foregroundStyle(.white)
                                .lineLimit(1)
                        }
                        Spacer()
                    }
                    .padding(12)
                }
                .frame(height: 70)
            }
        }
        .frame(height: 155)
    }

    // MARK: - App icon grid
    private var appGrid: some View {
        let columns = Array(repeating: GridItem(.flexible(), spacing: 20), count: 4)
        let apps: [(String, String, Color)] = [
            ("Messages", "message.fill", .green),
            ("Camera", "camera.fill", .gray),
            ("Photos", "photo.on.rectangle.angled", .pink),
            ("Safari", "safari.fill", .blue),
            ("Mail", "envelope.fill", .cyan),
            ("Maps", "map.fill", .green),
            ("Music", "music.note", .pink),
            ("Notes", "note.text", .yellow),
            ("Calendar", "calendar", .red),
            ("Settings", "gearshape.fill", .gray),
            ("Files", "folder.fill", .blue),
            ("App Store", "a.square.fill", .indigo)
        ]

        return LazyVGrid(columns: columns, spacing: 22) {
            ForEach(apps, id: \.0) { app in
                AppIconView(name: app.0, symbol: app.1, tint: app.2)
            }
        }
    }

    // MARK: - Dock
    private var dock: some View {
        LiquidGlassCard {
            HStack(spacing: 22) {
                DockIconView(symbol: "phone.fill", tint: .green)
                DockIconView(symbol: "safari.fill", tint: .blue)
                DockIconView(symbol: "message.fill", tint: .green)
                DockIconView(symbol: "music.note", tint: .pink)
            }
            .padding(.horizontal, 18)
            .padding(.vertical, 14)
        }
    }
}

// MARK: - Reusable "Liquid Glass" translucent card
private struct LiquidGlassCard<Content: View>: View {
    @ViewBuilder var content: Content

    var body: some View {
        content
            .background(.ultraThinMaterial, in: RoundedRectangle(cornerRadius: 24, style: .continuous))
            .overlay(
                RoundedRectangle(cornerRadius: 24, style: .continuous)
                    .strokeBorder(.white.opacity(0.15), lineWidth: 0.6)
            )
    }
}

// MARK: - Home screen app icon (squircle, SF Symbol only — no real app art)
private struct AppIconView: View {
    let name: String
    let symbol: String
    let tint: Color

    var body: some View {
        VStack(spacing: 6) {
            RoundedRectangle(cornerRadius: 16, style: .continuous)
                .fill(
                    LinearGradient(
                        colors: [tint.opacity(0.9), tint.opacity(0.6)],
                        startPoint: .topLeading,
                        endPoint: .bottomTrailing
                    )
                )
                .frame(width: 62, height: 62)
                .overlay(
                    Image(systemName: symbol)
                        .font(.system(size: 26, weight: .medium))
                        .foregroundStyle(.white)
                )
                .overlay(
                    RoundedRectangle(cornerRadius: 16, style: .continuous)
                        .strokeBorder(.white.opacity(0.12), lineWidth: 0.5)
                )

            Text(name)
                .font(.system(size: 11, weight: .medium, design: .rounded))
                .foregroundStyle(.white.opacity(0.9))
                .lineLimit(1)
        }
        .frame(maxWidth: .infinity)
    }
}

// MARK: - Dock icon (same squircle language, no label)
private struct DockIconView: View {
    let symbol: String
    let tint: Color

    var body: some View {
        RoundedRectangle(cornerRadius: 16, style: .continuous)
            .fill(
                LinearGradient(
                    colors: [tint.opacity(0.9), tint.opacity(0.6)],
                    startPoint: .topLeading,
                    endPoint: .bottomTrailing
                )
            )
            .frame(width: 58, height: 58)
            .overlay(
                Image(systemName: symbol)
                    .font(.system(size: 24, weight: .medium))
                    .foregroundStyle(.white)
            )
            .overlay(
                RoundedRectangle(cornerRadius: 16, style: .continuous)
                    .strokeBorder(.white.opacity(0.12), lineWidth: 0.5)
            )
    }
}

#Preview {
    DemoContentView()
}
