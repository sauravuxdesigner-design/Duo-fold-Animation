import SwiftUI

struct DemoContentView: View {
    private let apps: [(name: String, symbol: String, color: Color)] = [
        ("Messages", "message.fill", .green),
        ("Photos", "photo.on.rectangle.angled", .blue),
        ("Figma", "pencil.tip.crop.circle", .purple),
        ("Safari", "safari.fill", .cyan),
        ("Maps", "map.fill", .orange),
        ("Files", "folder.fill", .blue),
        ("Settings", "gearshape.fill", .gray),
        ("App Store", "a.square.fill", .indigo),
        ("Notes", "note.text", .yellow),
        ("Music", "music.note", .pink),
        ("Camera", "camera.fill", .white),
        ("Clock", "clock.fill", .white)
    ]

    var body: some View {
        GeometryReader { geometry in
            ZStack {
                gradientBackground(in: geometry)

                // Your grain/stipple texture. Add an image asset named GrainTexture
                // to Assets.xcassets for the texture to appear.
                Image("GrainTexture")
                    .resizable()
                    .scaledToFill()
                    .frame(width: geometry.size.width, height: geometry.size.height)
                    .clipped()
                    .opacity(0.22)
                    .blendMode(.screen)
                    .allowsHitTesting(false)

                VStack(spacing: 0) {
                    statusBar

                    Spacer(minLength: 8)

                    heroTime

                    Spacer(minLength: 18)

                    widgets

                    Spacer(minLength: 20)

                    appGrid

                    Spacer(minLength: 12)

                    searchPill

                    Spacer(minLength: 18)

                    dock

                    homeIndicator
                }
                .padding(.horizontal, 18)
            }
        }
        .ignoresSafeArea()
    }

    // MARK: - Background

    private func gradientBackground(in geometry: GeometryProxy) -> some View {
        ZStack {
            Color(red: 0.018, green: 0.025, blue: 0.045)

            Circle()
                .fill(
                    RadialGradient(
                        colors: [
                            Color(red: 0.0, green: 0.68, blue: 0.72).opacity(0.95),
                            Color(red: 0.0, green: 0.28, blue: 0.35).opacity(0.45),
                            .clear
                        ],
                        center: .center,
                        startRadius: 5,
                        endRadius: geometry.size.width * 0.72
                    )
                )
                .frame(width: geometry.size.width * 1.35,
                       height: geometry.size.width * 1.35)
                .offset(x: -geometry.size.width * 0.48,
                        y: geometry.size.height * 0.20)
                .blur(radius: 18)

            Circle()
                .fill(
                    RadialGradient(
                        colors: [
                            Color(red: 1.0, green: 0.02, blue: 0.32).opacity(0.98),
                            Color(red: 0.75, green: 0.02, blue: 0.22).opacity(0.48),
                            .clear
                        ],
                        center: .center,
                        startRadius: 5,
                        endRadius: geometry.size.width * 0.72
                    )
                )
                .frame(width: geometry.size.width * 1.35,
                       height: geometry.size.width * 1.35)
                .offset(x: geometry.size.width * 0.48,
                        y: geometry.size.height * 0.20)
                .blur(radius: 18)

            LinearGradient(
                colors: [
                    .white.opacity(0.07),
                    .clear,
                    .black.opacity(0.28)
                ],
                startPoint: .top,
                endPoint: .bottom
            )
        }
    }

    // MARK: - Status Bar

    private var statusBar: some View {
        HStack {
            Text("9:41")
                .font(.system(size: 15, weight: .semibold))

            Spacer()

            HStack(spacing: 7) {
                Image(systemName: "cellularbars")
                Image(systemName: "wifi")
                Image(systemName: "battery.100")
            }
            .font(.system(size: 12, weight: .semibold))
        }
        .foregroundStyle(.white)
        .padding(.horizontal, 8)
        .padding(.top, 14)
    }

    // MARK: - Time

    private var heroTime: some View {
        VStack(spacing: 2) {
            Text(Date(), style: .time)
                .font(.system(size: 64, weight: .thin, design: .rounded))
                .tracking(-2)
                .foregroundStyle(.white)

            Text(Date(), format: .dateTime.weekday(.wide).month(.wide).day())
                .font(.system(size: 14, weight: .medium))
                .foregroundStyle(.white.opacity(0.62))
        }
    }

    // MARK: - Widgets

    private var widgets: some View {
        HStack(spacing: 12) {
            weatherWidget
            syncWidget
        }
    }

    private var weatherWidget: some View {
        GlassCard {
            VStack(alignment: .leading, spacing: 4) {
                HStack(spacing: 4) {
                    Text("Bengaluru")
                    Image(systemName: "location.fill")
                        .font(.system(size: 8, weight: .bold))
                }
                .font(.system(size: 12, weight: .semibold))
                .foregroundStyle(.white.opacity(0.78))

                Text("23°")
                    .font(.system(size: 40, weight: .thin, design: .rounded))
                    .foregroundStyle(.white)

                HStack(spacing: 5) {
                    Image(systemName: "moon.stars.fill")
                    Text("Mostly Clear")
                }
                .font(.system(size: 11, weight: .medium))
                .foregroundStyle(.white.opacity(0.76))

                Text("H:31°  L:21°")
                    .font(.system(size: 10, weight: .medium))
                    .foregroundStyle(.white.opacity(0.48))
            }
            .frame(maxWidth: .infinity, alignment: .leading)
        }
    }

    private var syncWidget: some View {
        GlassCard {
            VStack(alignment: .leading, spacing: 8) {
                HStack {
                    Text("DUO SPACE")
                        .font(.system(size: 10, weight: .bold))
                        .foregroundStyle(.white.opacity(0.55))

                    Spacer()

                    Circle()
                        .fill(.green)
                        .frame(width: 7, height: 7)
                        .shadow(color: .green.opacity(0.7), radius: 5)
                }

                Text("Motion Ready")
                    .font(.system(size: 20, weight: .semibold, design: .rounded))
                    .foregroundStyle(.white)

                Text("Live Gyro tracking")
                    .font(.system(size: 11, weight: .medium))
                    .foregroundStyle(.white.opacity(0.56))

                HStack(spacing: 4) {
                    ForEach(0..<5, id: \.self) { index in
                        Capsule()
                            .fill(.white.opacity(index < 4 ? 0.8 : 0.18))
                            .frame(height: 3)
                    }
                }
            }
        }
    }

    // MARK: - App Grid

    private var appGrid: some View {
        LazyVGrid(
            columns: Array(repeating: GridItem(.flexible(), spacing: 12), count: 4),
            spacing: 14
        ) {
            ForEach(Array(apps.enumerated()), id: \.offset) { _, app in
                ModernIconView(
                    name: app.name,
                    symbol: app.symbol,
                    glyphColor: app.color
                )
            }
        }
    }

    // MARK: - Search

    private var searchPill: some View {
        HStack(spacing: 7) {
            Image(systemName: "magnifyingglass")
                .font(.system(size: 12, weight: .semibold))

            Text("Search")
                .font(.system(size: 13, weight: .medium))
        }
        .foregroundStyle(.white.opacity(0.82))
        .padding(.horizontal, 18)
        .padding(.vertical, 9)
        .background(.ultraThinMaterial, in: Capsule())
        .overlay {
            Capsule()
                .stroke(.white.opacity(0.18), lineWidth: 0.7)
        }
    }

    // MARK: - Dock

    private var dock: some View {
        HStack(spacing: 16) {
            DockIcon(symbol: "phone.fill", color: .green)
            DockIcon(symbol: "safari.fill", color: .cyan)
            DockIcon(symbol: "message.fill", color: .green, badge: "60")
            DockIcon(symbol: "music.note", color: .pink)
        }
        .padding(.horizontal, 16)
        .padding(.vertical, 12)
        .frame(maxWidth: .infinity)
        .background(.ultraThinMaterial, in: RoundedRectangle(cornerRadius: 30, style: .continuous))
        .overlay {
            RoundedRectangle(cornerRadius: 30, style: .continuous)
                .stroke(.white.opacity(0.18), lineWidth: 0.8)
        }
        .shadow(color: .black.opacity(0.22), radius: 18, y: 8)
    }

    private var homeIndicator: some View {
        Capsule()
            .fill(.white.opacity(0.75))
            .frame(width: 105, height: 4)
            .padding(.top, 10)
            .padding(.bottom, 8)
    }
}

// MARK: - Glass Card

private struct GlassCard<Content: View>: View {
    @ViewBuilder let content: Content

    var body: some View {
        content
            .padding(14)
            .frame(maxWidth: .infinity)
            .frame(height: 150)
            .background(.ultraThinMaterial, in: RoundedRectangle(cornerRadius: 24, style: .continuous))
            .overlay {
                RoundedRectangle(cornerRadius: 24, style: .continuous)
                    .fill(
                        LinearGradient(
                            colors: [.white.opacity(0.10), .clear],
                            startPoint: .topLeading,
                            endPoint: .bottomTrailing
                        )
                    )
                    .allowsHitTesting(false)
            }
            .overlay {
                RoundedRectangle(cornerRadius: 24, style: .continuous)
                    .stroke(.white.opacity(0.18), lineWidth: 0.8)
            }
            .shadow(color: .black.opacity(0.18), radius: 14, y: 8)
    }
}

// MARK: - App Icon

private struct ModernIconView: View {
    let name: String
    let symbol: String
    let glyphColor: Color

    var body: some View {
        VStack(spacing: 5) {
            ZStack(alignment: .topTrailing) {
                RoundedRectangle(cornerRadius: 18, style: .continuous)
                    .fill(.ultraThinMaterial)
                    .frame(width: 61, height: 61)
                    .overlay {
                        RoundedRectangle(cornerRadius: 18, style: .continuous)
                            .fill(
                                LinearGradient(
                                    colors: [
                                        .white.opacity(0.16),
                                        glyphColor.opacity(0.16),
                                        .clear
                                    ],
                                    startPoint: .topLeading,
                                    endPoint: .bottomTrailing
                                )
                            )
                    }
                    .overlay {
                        RoundedRectangle(cornerRadius: 18, style: .continuous)
                            .stroke(.white.opacity(0.20), lineWidth: 0.7)
                    }
                    .shadow(color: .black.opacity(0.18), radius: 7, y: 4)

                Image(systemName: symbol)
                    .font(.system(size: 25, weight: .medium))
                    .foregroundStyle(glyphColor.gradient)
                    .frame(width: 61, height: 61)
            }

            Text(name)
                .font(.system(size: 10.5, weight: .medium))
                .foregroundStyle(.white.opacity(0.88))
                .lineLimit(1)
                .minimumScaleFactor(0.75)
        }
        .frame(maxWidth: .infinity)
    }
}

// MARK: - Dock Icon

private struct DockIcon: View {
    let symbol: String
    let color: Color
    var badge: String? = nil

    var body: some View {
        ZStack(alignment: .topTrailing) {
            RoundedRectangle(cornerRadius: 17, style: .continuous)
                .fill(.ultraThinMaterial)
                .frame(width: 60, height: 60)
                .overlay {
                    RoundedRectangle(cornerRadius: 17, style: .continuous)
                        .fill(color.opacity(0.16))
                }
                .overlay {
                    RoundedRectangle(cornerRadius: 17, style: .continuous)
                        .stroke(.white.opacity(0.18), lineWidth: 0.7)
                }

            Image(systemName: symbol)
                .font(.system(size: 25, weight: .medium))
                .foregroundStyle(color.gradient)
                .frame(width: 60, height: 60)

            if let badge {
                Text(badge)
                    .font(.system(size: 10, weight: .bold))
                    .foregroundStyle(.white)
                    .padding(.horizontal, 5)
                    .frame(minWidth: 19, minHeight: 19)
                    .background(.red, in: Capsule())
                    .overlay {
                        Capsule()
                            .stroke(.white.opacity(0.35), lineWidth: 0.5)
                    }
                    .offset(x: 5, y: -5)
            }
        }
        .frame(maxWidth: .infinity)
    }
}

#Preview {
    DemoContentView()
}
