import Foundation

func getApiKey() -> String {
  guard let filePath = Bundle.main.path(forResource: "Info", ofType: "plist") else {
    fatalError("Couldn't find file 'Info.plist'")
  }

  let plist = NSDictionary(contentsOfFile: filePath)
  guard let value = plist?.object(forKey: "WEATHER_API_KEY") as? String else {
    fatalError("Couldn't find key 'WEATHER_API_KEY'")
  }

  return value
}
