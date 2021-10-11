//
//  Character.swift
//  BreakingBad
//
//  Created by Brandon Levasseur on 10/11/21.
//

import Foundation

struct Character: Codable, Identifiable {
    enum CodingKeys: String, CodingKey {
        case id = "char_id"
        case name
        case birthday
        case occupations = "occupation"
        case imageURL = "img"
        case status
        case nickname
        case seasonAppearances = "appearance"
        case portrayed
        case category
        case betterCallSaulSeasonAppearances = "better_call_saul_appearance"
    }
    
    var id: Int
    var name: String
    var birthday: Date?
    var occupations: [String]
    var imageURL: URL?
    var status: String
    var nickname: String
    var seasonAppearances: [Int]
    var portrayed: String
    var category: String
    var betterCallSaulSeasonAppearances: [Int]
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        id = try container.decode(Int.self, forKey: .id)
        name = try container.decode(String.self, forKey: .name)
        let dateText = try container.decode(String.self, forKey: .birthday)
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM-dd-YYYY"
        dateFormatter.locale = Locale(identifier: "en_US")
        birthday = dateFormatter.date(from: dateText)
        occupations = try container.decode([String].self, forKey: .occupations)
        imageURL = try container.decodeIfPresent(URL.self, forKey: .imageURL)
        status = try container.decode(String.self, forKey: .status)
        nickname = try container.decode(String.self, forKey: .nickname)
        seasonAppearances = try container.decode([Int].self, forKey: .seasonAppearances)
        portrayed = try container.decode(String.self, forKey: .portrayed)
        category = try container.decode(String.self, forKey: .category)
        betterCallSaulSeasonAppearances = try container.decode([Int].self, forKey: .betterCallSaulSeasonAppearances)
    }
    
    internal init(id: Int, name: String, birthday: Date? = nil, occupations: [String], imageURL: URL? = nil, status: String, nickname: String, seasonAppearances: [Int], portrayed: String, category: String, betterCallSaulSeasonAppearances: [Int]) {
        self.id = id
        self.name = name
        self.birthday = birthday
        self.occupations = occupations
        self.imageURL = imageURL
        self.status = status
        self.nickname = nickname
        self.seasonAppearances = seasonAppearances
        self.portrayed = portrayed
        self.category = category
        self.betterCallSaulSeasonAppearances = betterCallSaulSeasonAppearances
    }
}

#if DEBUG
extension Character {
    static let mock = Character(id: 123,
                                name: "Walter White",
                                birthday: nil,
                                occupations: ["Chemist"],
                                imageURL: URL(string: "https://images.amcnetworks.com/amc.com/wp-content/uploads/2015/04/cast_bb_700x1000_walter-white-lg.jpg"), status: "Presumed dead",
                                nickname: "Heisenberg",
                                seasonAppearances: [
                                    1,
                                    2,
                                    3,
                                    4,
                                    5
                                ],
                                portrayed: "Bryan Cranston",
                                category: "Breaking Bad",
                                betterCallSaulSeasonAppearances: [])
}
#endif
