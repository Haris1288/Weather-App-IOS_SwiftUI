import SwiftUI

struct RectangleRoundedBox: View {
     var heading : String
    var mainValue : String
    var optionalValue : String
    
    var body: some View {
        ZStack(alignment: .leading) {
           RoundedRectangle(cornerRadius: 8)
            VStack(alignment: .leading){
                Text(heading)
                    .lineLimit(1)
                    .font(.title3)
                    .foregroundStyle(Color.secondary)
                    .padding(.bottom,5)
                
                Text(mainValue)
                    .lineLimit(1)
                    .font(.title)
                    .foregroundStyle(Color.primary)
                    .padding(.bottom,2)
                
                if !optionalValue.isEmpty {
                    Text(optionalValue)
                        .lineLimit(1)
                        .font(.footnote)
                        .foregroundStyle(Color.primary)
                }
                Spacer()
            }
            .padding()
        }
        .foregroundStyle(Color.background2)
        .frame(width: 164,height: 164)
        .overlay {
            RoundedRectangle(cornerRadius: 8)
                .stroke(Color.white,lineWidth: 1)
                .blendMode(.hue)
        }
        
    }
}

#Preview {
    RectangleRoundedBox(heading:"head",mainValue:"4", optionalValue: "")
        .preferredColorScheme(.dark)
}
