import SwiftUI

struct SegementedControl: View {
    @Binding var selection:Int
    
    var body: some View {
        VStack(spacing: 5) {
            HStack{
                Button {
                    withAnimation(.easeOut(duration: 0.5)) {
                        selection = 0
                    }
                } label: {
                    Text("Hourly Forcast")
                }
                .frame(minWidth: 0,maxWidth: .infinity)
                Button {
                    withAnimation(.easeOut(duration: 0.5)) {
                        selection = 1
                    }
                } label: {
                    Text("Weekly Forcast")
                }
                .frame(minWidth: 0,maxWidth: .infinity)

            }
            .font(.subheadline.weight(.semibold))
            .foregroundStyle(.secondary)
            
            Rectangle()
                .fill(.white.opacity(0.3))
                .frame(height: 1)
                .shadow(color: .white.opacity(0.2), radius: 1, x: 1, y: 4)
                .overlay(alignment: .leading) {
                    // Animated indicator
                    Rectangle()
                        .fill(.white.opacity(0.3))
                        .frame(width: UIScreen.main.bounds.width / 2, height: 3)
                        .shadow(color: .white.opacity(0.3), radius: 0, x: 0, y: 2)
                        .offset(x: selection == 0 ? 0 : UIScreen.main.bounds.width / 2, y: -1)
                }
                .blendMode(.overlay)
        }
        .padding(.top,5)
    }
}

#Preview {
    SegementedControl(selection: .constant(0))
}
