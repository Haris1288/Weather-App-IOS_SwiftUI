import Foundation

@MainActor
class HomeViewModel: ObservableObject {
    @Published var hourlyForecasts: [HourData] = []
    @Published var weeklyForecasts: [Forecastday] = []
    @Published var name : String = ""
    @Published var temprature : Double = 0
    @Published var conditiontText : String = ""
    @Published var highTemp: Double = 0
    @Published var lowTemp: Double = 0
    
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
    
    func fetchWeatherData(name:String) async{
        do{
            let weatherData = try await service.getWeatherData(name: name)
            let directionAbbreviation = weatherData.current.windDir
            self.name = weatherData.location.name
            self.temprature = weatherData.current.tempC
            self.conditiontText = weatherData.current.condition.text
            self.lowTemp = (weatherData.forecast.forecastday.first?.day.minTemp)!
            self.highTemp = (weatherData.forecast.forecastday.first?.day.maxTemp)!
            self.hourlyForecasts = weatherData.forecast.forecastday.first!.hour
            self.weeklyForecasts = weatherData.forecast.forecastday
            self.humidity = "\(weatherData.current.humidity)"
            self.windSpeed = "\(weatherData.current.windSpeed)"
            self.windDirection = fullWindDirection(from: directionAbbreviation)
            self.uvIndexValue = "\(weatherData.forecast.forecastday.first?.day.uv ?? 0)"
            self.SunRiseValue = "\(weatherData.forecast.forecastday.first?.astro.sunrise ?? "Null")"
            self.sunSetValue = "\(weatherData.forecast.forecastday.first?.astro.sunset ?? "Null")"
            self.visibility = weatherData.current.visibility
            self.feelsLike = weatherData.current.feelsLike
            
            
        }catch{
            
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
