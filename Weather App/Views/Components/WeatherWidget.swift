import SwiftUI

struct WeatherWidget: View {
    @StateObject var ViewModel = NavigationBarViewModel()
    
    var body: some View {
        ZStack(alignment: .bottom) {
            Trapezoid()
                .fill(Color.weatherWidgetBackground)
                .frame(width: 342,height: 174)
            
            HStack(alignment:.bottom) {
                VStack(alignment: .leading) {
                    Text("\(ViewModel.temprature,specifier:"%.1f")°")
                        .font(.system(size: 64))
                    
                    VStack(alignment: .leading,spacing: 12) {
                        Text("H:\(ViewModel.highTemp,specifier:"%.1f")°  L:\(ViewModel.lowTemp,specifier:"%.1f")° ")
                            .font(.footnote)
                            .foregroundStyle(Color.secondary)
                        
                        
                        Text(ViewModel.name)
                            .font(.body)
                            .lineLimit(1)
                    }
                }
                Spacer()
                VStack(alignment: .trailing,spacing: 0){
                    AsyncImage(url: URL(string:"https:\(ViewModel.weatherImage)"))
                    { image in
                        image
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 100, height: 150)
                    } placeholder: {
                        ProgressView()
                            .frame(width: 42, height: 42)
                    }
                    

                        .padding(.trailing,4)
                    
                    Text(ViewModel.conditiontText)
                        .lineLimit(1)
                        .font(.footnote)
                        .padding(.trailing,24)
                }
            }
            .foregroundStyle(Color.white)
            .padding(.bottom,20)
            .padding(.leading,20)
        }
        .frame(width: 342,height: 184,alignment: .bottom)
    }
}

#Preview {
    WeatherWidget()
}
