import Foundation

enum NetworkError: Error {
    case invalidURL
    case requestFailed(Error)
    case decodingFailed
}
class Service {
    
    let apiKey = "YOUR_API_KEY_HERE"
    let baseURL = "https://api.weatherapi.com/"
    
    func getWeatherData(name: String) async throws -> WeatherData {
        let trimmedName = name.replacingOccurrences(of: " ", with: "")
        let urlString = "\(baseURL)v1/forecast.json?key=\(apiKey)&q=\(trimmedName)&days=7"
        print(urlString)
        guard let url = URL(string: urlString) else { throw NetworkError.invalidURL }
        let (data,response) = try await URLSession.shared.data(from: url)
        print(data)
        //print(response)
        guard(response as? HTTPURLResponse)?.statusCode == 200 else{throw NetworkError.invalidURL}
        print("Kaam idhar tk aa raha hai")
        do {
            let weatherData = try JSONDecoder().decode(WeatherData.self, from: data)
            print(weatherData)
            return weatherData
        }catch{
            print("error hai yaha")
            throw NetworkError.invalidURL
        }
    }
}
