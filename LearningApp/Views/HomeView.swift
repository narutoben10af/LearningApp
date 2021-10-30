//
//  ContentView.swift
//  LearningApp
//
//  Created by Lim Si Eian on 31/10/21.
//

import SwiftUI

struct HomeView: View
{
    @EnvironmentObject var model : ContentModel
    var body: some View
    {
        Text("Hello, world!")
            .padding()
    }
}

struct HomeView_Previews: PreviewProvider
{
    static var previews: some View {
        HomeView()
    }
}
