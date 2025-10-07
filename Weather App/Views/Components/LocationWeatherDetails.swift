import SwiftUI

struct LocationWeatherDetails: View {
    @StateObject var viewModel = HomeViewModel()
    
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
    LocationWeatherDetails()
        .preferredColorScheme(.dark)
}
