//
//  ThemeData.swift
//  AngelOekakiApp
//
//  Created by 浦山秀斗 on 2024/12/08.
//

struct ThemeData {
    public static let shared = ThemeData()
    
    private init() {}
    
    private let themes: [Theme] = [
        Theme(id: 1, name: "カツオ", imageName: "katuo"),
        Theme(id: 2, name: "ドラえもん", imageName: "doraemon"),
        Theme(id: 3, name: "ひまわり", imageName: "himawari"),
    ]
    
    public func random() -> Theme {
        themes.randomElement()!
    }
}
