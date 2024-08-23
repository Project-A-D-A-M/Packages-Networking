//
//  File.swift
//  
//
//  Created by Gabriel Medeiros Martins on 08/08/24.
//

import Foundation

public final class CountryDTO: Codable {
    public var id: UUID?
    public var name: String
    public var countryDescription: String
    public var idioms: [String]
    public var iso3: String
    public var iso2: String
    public var numericCode: String
    public var phoneCode: String
    public var capital: String
    public var capitalId: UUID
    public var currency: String
    public var currencyName: String
    public var currencySymbol: String
    public var tld: String
    public var native: String
    public var region: String
    public var regionId: String
    public var subregion: String
    public var subregionId: String?
    public var nationality: String
    public var latitude: String
    public var longitude: String
    public var emoji: String
    public var emojiU: String
    public var timezones: [TimeZones]
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case countryDescription = "description"
        case idioms
        case iso3
        case iso2
        case numericCode
        case phoneCode
        case capital
        case capitalId
        case currency
        case currencyName
        case currencySymbol
        case tld
        case native
        case region
        case regionId
        case subregion
        case subregionId
        case nationality
        case latitude
        case longitude
        case emoji
        case emojiU
        case timezones
    }
    
    public init(id: UUID? = nil, name: String, description: String, idioms: [String], iso3: String, iso2: String, numericCode: String, phoneCode: String, capital: String, capitalId: UUID, currency: String, currencyName: String, currencySymbol: String, tld: String, native: String, region: String, regionId: String, subregion: String, subregionId: String? = nil, nationality: String, latitude: String, longitude: String, emoji: String, emojiU: String, timezones: [TimeZones]) {
        self.id = id
        self.name = name
        self.countryDescription = description
        self.idioms = idioms
        self.iso3 = iso3
        self.iso2 = iso2
        self.numericCode = numericCode
        self.phoneCode = phoneCode
        self.capital = capital
        self.capitalId = capitalId
        self.currency = currency
        self.currencyName = currencyName
        self.currencySymbol = currencySymbol
        self.tld = tld
        self.native = native
        self.region = region
        self.regionId = regionId
        self.subregion = subregion
        self.subregionId = subregionId
        self.nationality = nationality
        self.latitude = latitude
        self.longitude = longitude
        self.emoji = emoji
        self.emojiU = emojiU
        self.timezones = timezones
    }
}
