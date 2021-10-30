//
//  LearningApp.swift
//  LearningApp
//
//  Created by Lim Si Eian on 31/10/21.
//

import SwiftUI

@main
struct LearningApp: App
{
    var body: some Scene
    {
        WindowGroup
        {
            HomeView().environmentObject(ContentModel())
        }
    }
}
