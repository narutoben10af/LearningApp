//
//  ContentView.swift
//  LearningApp
//
//  Created by Lim Si Eian on 12/11/21.
//

import SwiftUI

struct ContentView: View
{
    @EnvironmentObject var model: ContentModel
    @Environment(\.colorScheme) var colorScheme

    var body: some View
    {
        ScrollView
        {
            LazyVStack
            {
                if model.currentModule != nil
                {
                    ForEach(0..<model.currentModule!.content.lessons.count)
                    { index in
                        ContentViewRow(index: index)
                    }
                }
            }.padding().navigationTitle("Learn \(model.currentModule?.category ?? "")")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
