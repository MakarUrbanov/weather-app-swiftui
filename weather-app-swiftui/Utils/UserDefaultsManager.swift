import Foundation

enum UserDefaultsManager {
  static func getData<T: Decodable>(key: UserDefaultsKeys, dataType: T.Type) -> T? {
    guard let data = UserDefaults.standard.data(forKey: key.rawValue) else {
      return nil
    }

    guard let decodedCity = try? JSONDecoder().decode(dataType, from: data) else {
      return nil
    }

    return decodedCity
  }

  static func setData<T: Encodable>(data: T, key: UserDefaultsKeys) {
    guard let encodedData = try? JSONEncoder().encode(data) else {
      print("ERROR \(self)")

      return
    }

    UserDefaults.standard.set(encodedData, forKey: key.rawValue)
  }
}
