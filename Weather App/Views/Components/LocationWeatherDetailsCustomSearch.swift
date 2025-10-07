import SwiftUI

struct LocationWeatherDetailsCustomSearch: View {
    @StateObject var viewModel = NavigationBarViewModel()
    
    var body: some View {
        ZStack {
            Color.clear
            VStack {
                HStack{
                    RectangleRoundedBox(heading: "UV Index", mainValue:viewModel.uvIndexValue , optionalValue: "")
                    
                    RectangleRoundedBox(heading: "SUNRISE", mainValue:viewModel.SunRiseValue , optionalValue: "Sunset: \(viewModel.sunSetValue)")
                }
                HStack{
                    RectangleRoundedBox(heading: "WIND", mainValue:"\(viewModel.windSpeed)km/h" , optionalValue: "\(viewModel.windDirection)"
                    )
                    
                    RectangleRoundedBox(heading: "HUMIDITY", mainValue:"\(viewModel.humidity)%" , optionalValue: "")
                }
                HStack{
                    RectangleRoundedBox(heading: "FEELS LIKE", mainValue:"\(viewModel.feelsLike)°" , optionalValue: ""
                    )
                    
                    RectangleRoundedBox(heading: "VISIBILITY", mainValue:"\(viewModel.visibility) Km" , optionalValue: "")
                }
                
                
            }
        }
    }
}

#Preview {
    LocationWeatherDetailsCustomSearch()
        .preferredColorScheme(.dark)
}
