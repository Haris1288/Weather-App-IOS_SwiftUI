import Foundation

class LocationWeatherDetailsModel : ObservableObject{
    @Published var uvIndexValue = ""
    @Published var uvIndexOptional = ""
    
    @Published var SubRiseValue = ""
    @Published var sunSetValue = "23:00"
    
    
    
    
    
    @Published var heading = "Head"
    @Published var main = "Main"
    @Published var optionalValue = ""
}
