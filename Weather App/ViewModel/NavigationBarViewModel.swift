import Foundation

@MainActor
class NavigationBarViewModel:ObservableObject {
    @Published var name : String = ""
    @Published var temprature : Double = 0
    @Published var conditiontText : String = ""
    @Published var highTemp: Double = 0
    @Published var lowTemp: Double = 0
    @Published var title = ""
    @Published var weatherImage = ""
    @Published var showWidget = false
    
    @Published var uvIndexValue = ""
    @Published var uvIndexOptional = ""
    
    @Published var SunRiseValue = ""
    @Published var sunSetValue = ""
    
    @Published var humidity = ""
    
    @Published var windSpeed = ""
    @Published var windDirection = ""
    
    @Published var visibility = 0.0
    
    @Published var feelsLike = 0.0
    
    private let service = Service()
    
    func Search(title: String) async {
        do{
            let data = try await service.getWeatherData(name: title)
            let directionAbbreviation = data.current.windDir
            self.name = data.location.name
            self.temprature = data.current.tempC
            self.conditiontText = data.current.condition.text
            self.highTemp = (data.forecast.forecastday.first?.day.maxTemp)!
            self.lowTemp = (data.forecast.forecastday.first?.day.minTemp)!
            self.weatherImage = data.current.condition.icon
            self.showWidget = true
            self.humidity = "\(data.current.humidity)"
            self.windSpeed = "\(data.current.windSpeed)"
            self.windDirection = fullWindDirection(from: directionAbbreviation)
            self.uvIndexValue = "\(data.forecast.forecastday.first?.day.uv ?? 0)"
            self.SunRiseValue = "\(data.forecast.forecastday.first?.astro.sunrise ?? "Null")"
            self.sunSetValue = "\(data.forecast.forecastday.first?.astro.sunset ?? "Null")"
            self.visibility = data.current.visibility
            self.feelsLike = data.current.feelsLike
        }catch{
            print("Failed in Navigation Model")
            self.showWidget = false
        }
    }
    
    private func fullWindDirection(from abbreviation: String) -> String {
            switch abbreviation.uppercased() {
                case "N": return "North"
                case "NNE": return "North-Northeast"
                case "NE": return "Northeast"
                case "ENE": return "East-Northeast"
                case "E": return "East"
                case "ESE": return "East-Southeast"
                case "SE": return "Southeast"
                case "SSE": return "South-Southeast"
                case "S": return "South"
                case "SSW": return "South-Southwest"
                case "SW": return "Southwest"
                case "WSW": return "West-Southwest"
                case "W": return "West"
                case "WNW": return "West-Northwest"
                case "NW": return "Northwest"
                case "NNW": return "North-Northwest"
                default: return abbreviation
            }
        }
    
}
