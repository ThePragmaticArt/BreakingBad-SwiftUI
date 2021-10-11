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
        case occupations = "occupation"
        case imageURL = "img"
        case status
        case nickname
        case seasonAppearances = "appearance"
    }
    
    var id: Int
    var name: String
    var occupations: [String]
    var imageURL: URL?
    var status: String
    var nickname: String
    var seasonAppearances: [Int]
    
    internal init(id: Int, name: String, occupations: [String], imageURL: URL? = nil, status: String, nickname: String, seasonAppearances: [Int]) {
        self.id = id
        self.name = name
        self.occupations = occupations
        self.imageURL = imageURL
        self.status = status
        self.nickname = nickname
        self.seasonAppearances = seasonAppearances
    }
}

#if DEBUG
extension Character {
    static let mock = Character(id: 123,
                                name: "Walter White",
                                occupations: ["Chemist"],
                                imageURL: URL(string: "https://images.amcnetworks.com/amc.com/wp-content/uploads/2015/04/cast_bb_700x1000_walter-white-lg.jpg"), status: "Presumed dead",
                                nickname: "Heisenberg",
                                seasonAppearances: [
                                    1,
                                    2,
                                    3,
                                    4,
                                    5
                                ])
}
#endif
