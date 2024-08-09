//
//  File.swift
//  
//
//  Created by Gabriel Medeiros Martins on 08/08/24.
//

import Foundation

public final class CountryDetails: Codable {
    public var id: String?
    public var countryId: Int
    public var name: String
    public var iso3: String
    public var iso2: String
    public var numericCode: String
    public var phoneCode: String
    public var capital: String
    public var capitalId: Int
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
    
    public init(id: String? = nil, countryId: Int, name: String, iso3: String, iso2: String, numericCode: String, phoneCode: String, capital: String, capitalId: Int, currency: String, currencyName: String, currencySymbol: String, tld: String, native: String, region: String, regionId: String, subregion: String, subregionId: String? = nil, nationality: String, latitude: String, longitude: String, emoji: String, emojiU: String, timezones: [TimeZones]) {
        self.id = id
        self.countryId = countryId
        self.name = name
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