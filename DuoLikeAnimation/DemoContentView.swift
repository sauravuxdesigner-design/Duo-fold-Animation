import SwiftUI

struct DemoContentView: View {
    var body: some View {
        ZStack {
            // MARK: - Base Background

            Color(
                red: 0.05,
                green: 0.05,
                blue: 0.07
            )
            .ignoresSafeArea()

            // MARK: - Gradient / Blur Wallpaper

            GeometryReader { geo in
                ZStack {
                    Circle()
                        .fill(
                            Color(
                                red: 0.0,
                                green: 0.15,
                                blue: 0.17
                            )
                        )
                        .frame(
                            width: geo.size.width * 1.1,
                            height: geo.size.height * 0.45
                        )
                        .blur(radius: 75)
                        .offset(
                            x: -geo.size.width * 0.25,
                            y: geo.size.height * 0.18
                        )

                    Circle()
                        .fill(
                            Color(
                                red: 1.0,
                                green: 0.09,
                                blue: 0.3
                            )
                        )
                        .frame(
                            width: geo.size.width * 1.1,
                            height: geo.size.height * 0.45
                        )
                        .blur(radius: 75)
                        .offset(
                            x: geo.size.width * 0.25,
                            y: geo.size.height * 0.25
                        )
                }
                .frame(
                    maxWidth: .infinity,
                    maxHeight: .infinity,
                    alignment: .bottom
                )
            }
            .ignoresSafeArea()

            // MARK: - Status Bar

            VStack(spacing: 0) {
                HStack {
                    Text("9:41")
                        .font(
                            .system(
                                size: 15,
                                weight: .semibold
                            )
                        )
                        .foregroundStyle(.white)
                        .frame(
                            width: 60,
                            alignment: .leading
                        )

                    Spacer()

                    Spacer()
                        .frame(width: 110)

                    Spacer()

                    HStack(spacing: 6) {
                        Image(systemName: "cellularbars")
                        Image(systemName: "wifi")
                        Image(systemName: "battery.100")
                    }
                    .font(
                        .system(
                            size: 12,
                            weight: .semibold
                        )
                    )
                    .foregroundStyle(.white)
                    .frame(
                        width: 60,
                        alignment: .trailing
                    )
                }
                .padding(.horizontal, 24)
                .padding(.top, 16)

                // MARK: - Main Workspace

                VStack(spacing: 32) {

                    // Workspace Widget

                    HStack(
                        alignment: .center,
                        spacing: 16
                    ) {
                        VStack(
                            alignment: .leading,
                            spacing: 4
                        ) {
                            Text("WORKSPACE")
                                .font(
                                    .system(
                                        size: 10,
                                        weight: .bold
                                    )
                                )
                                .foregroundStyle(
                                    .white.opacity(0.5)
                                )

                            Text("FloSpace Sync")
                                .font(
                                    .system(
                                        size: 16,
                                        weight: .bold
                                    )
                                )
                                .foregroundStyle(.white)

                            Text(
                                "All vectors verified active"
                            )
                            .font(
                                .system(
                                    size: 13,
                                    weight: .medium
                                )
                            )
                            .foregroundStyle(
                                .white.opacity(0.6)
                            )

                            Spacer()

                            Text(
                                "Live Gyro tracking active"
                            )
                            .font(
                                .system(
                                    size: 11,
                                    weight: .semibold
                                )
                            )
                            .foregroundStyle(
                                .purple.opacity(0.8)
                            )
                        }

                        Spacer()

                        RoundedRectangle(
                            cornerRadius: 16,
                            style: .continuous
                        )
                        .fill(
                            LinearGradient(
                                colors: [
                                    .purple,
                                    .pink
                                ],
                                startPoint: .top,
                                endPoint: .bottom
                            )
                        )
                        .frame(
                            width: 64,
                            height: 64
                        )
                        .overlay {
                            Image(
                                systemName: "sparkles"
                            )
                            .foregroundStyle(.white)
                            .font(.title3)
                        }
                    }
                    .padding(16)
                    .frame(
                        maxWidth: .infinity
                    )
                    .frame(height: 140)
                    .background(
                        Color.white.opacity(0.12)
                    )
                    .clipShape(
                        RoundedRectangle(
                            cornerRadius: 24,
                            style: .continuous
                        )
                    )
                    .overlay {
                        RoundedRectangle(
                            cornerRadius: 24,
                            style: .continuous
                        )
                        .stroke(
                            Color.white.opacity(0.08),
                            lineWidth: 0.5
                        )
                    }

                    // MARK: - App Grid

                    VStack(spacing: 26) {

                        HStack(spacing: 24) {
                            FinalIconView(
                                name: "Messages",
                                symbol: "message.fill",
                                glyphColor: .green
                            )

                            FinalIconView(
                                name: "Photos",
                                symbol: "photo.on.rectangle.angled",
                                glyphColor: .blue
                            )

                            FinalIconView(
                                name: "Figma",
                                symbol: "pencil.tip.crop.circle",
                                glyphColor: .purple
                            )

                            FinalIconView(
                                name: "Safari",
                                symbol: "compass.drawing",
                                glyphColor: .cyan
                            )
                        }

                        HStack(spacing: 24) {
                            FinalIconView(
                                name: "Maps",
                                symbol: "map.fill",
                                glyphColor: .orange
                            )

                            FinalIconView(
                                name: "Files",
                                symbol: "folder.fill",
                                glyphColor: .blue
                            )

                            FinalIconView(
                                name: "Settings",
                                symbol: "gearshape.fill",
                                glyphColor: .gray
                            )

                            FinalIconView(
                                name: "App Store",
                                symbol: "a.square.fill",
                                glyphColor: .indigo
                            )
                        }
                    }
                }
                .padding(.horizontal, 20)
                .padding(.top, 36)

                Spacer()

                // MARK: - Dock

                HStack(spacing: 24) {
                    FinalDockView(
                        symbol: "phone.fill",
                        glyphColor: .green
                    )

                    FinalDockView(
                        symbol: "envelope.fill",
                        glyphColor: .blue
                    )

                    FinalDockView(
                        symbol: "safari.fill",
                        glyphColor: .cyan
                    )

                    FinalDockView(
                        symbol: "music.note",
                        glyphColor: .pink
                    )
                }
                .padding(.horizontal, 24)
                .padding(.vertical, 16)
                .frame(maxWidth: .infinity)
                .background {
                    RoundedRectangle(
                        cornerRadius: 36,
                        style: .continuous
                    )
                    .fill(
                        Color.white.opacity(0.14)
                    )
                }
                .overlay {
                    RoundedRectangle(
                        cornerRadius: 36,
                        style: .continuous
                    )
                    .stroke(
                        Color.white.opacity(0.08),
                        lineWidth: 0.5
                    )
                }
                .padding(.horizontal, 16)
                .padding(.bottom, 24)
            }
        }
    }
}

// MARK: - App Icon

struct FinalIconView: View {
    let name: String
    let symbol: String
    let glyphColor: Color

    var body: some View {
        VStack(spacing: 6) {
            ZStack {
                RoundedRectangle(
                    cornerRadius: 15,
                    style: .continuous
                )
                .fill(
                    Color(
                        red: 0.15,
                        green: 0.15,
                        blue: 0.18
                    )
                )
                .frame(
                    width: 62,
                    height: 62
                )
                .overlay {
                    RoundedRectangle(
                        cornerRadius: 15,
                        style: .continuous
                    )
                    .stroke(
                        Color.white.opacity(0.06),
                        lineWidth: 0.5
                    )
                }

                Image(systemName: symbol)
                    .font(
                        .system(
                            size: 26,
                            weight: .medium
                        )
                    )
                    .foregroundStyle(
                        glyphColor.gradient
                    )
            }

            Text(name)
                .font(
                    .system(
                        size: 11,
                        weight: .medium
                    )
                )
                .foregroundStyle(
                    .white.opacity(0.8)
                )
                .lineLimit(1)
        }
        .frame(maxWidth: .infinity)
    }
}

// MARK: - Dock Icon

struct FinalDockView: View {
    let symbol: String
    let glyphColor: Color

    var body: some View {
        ZStack {
            RoundedRectangle(
                cornerRadius: 15,
                style: .continuous
            )
            .fill(
                Color(
                    red: 0.18,
                    green: 0.18,
                    blue: 0.22
                )
            )
            .frame(
                width: 62,
                height: 62
            )
            .overlay {
                RoundedRectangle(
                    cornerRadius: 15,
                    style: .continuous
                )
                .stroke(
                    Color.white.opacity(0.06),
                    lineWidth: 0.5
                )
            }

            Image(systemName: symbol)
                .font(
                    .system(
                        size: 26,
                        weight: .medium
                    )
                )
                .foregroundStyle(
                    glyphColor.gradient
                )
        }
        .frame(maxWidth: .infinity)
    }
}

#Preview {
    DemoContentView()
}
