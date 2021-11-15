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
    @Environment(\.colorScheme) var colorScheme

    var body: some View
    {
        
        NavigationView
        {
            VStack(alignment: .leading)
            {
                Text("What do you want to do today?").padding(.leading, 20)
                
                ScrollView
                {
                    LazyVStack
                    {
                        ForEach(model.modules)
                        { module in
                            
                            VStack(spacing: 20)
                            {
                                
                                NavigationLink
                                {
                                    ContentView().onAppear
                                    {
                                        model.beginModule(module.id)
                                    }
                                } label:
                                {
                                    //Learning Card
                                    HomeViewRow(image: module.content.image, title: "Learn \(module.category)", description: module.content.description, count: "\(module.content.lessons.count) Lessons", time: module.content.time)

                                }

                            
                            //Test Card
                            HomeViewRow(image: module.test.image, title: "\(module.category) Test", description: module.test.description, count: "\(module.test.questions.count) Questions", time: module.test.time)
                            
                            }
                        }
                    }.padding().accentColor(colorScheme == .dark ? Color.white : Color.black)
                }
            }.navigationTitle("Get Started")
        }
    }
}

struct HomeView_Previews: PreviewProvider
{
    static var previews: some View {
        HomeView().environmentObject(ContentModel())
    }
}
