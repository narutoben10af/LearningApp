//
//  ContentViewRow.swift
//  LearningApp
//
//  Created by Lim Si Eian on 16/11/21.
//

import SwiftUI

struct ContentViewRow: View {
    
    @EnvironmentObject var model: ContentModel
    @Environment(\.colorScheme) var colorScheme

    var index: Int
    
    var body: some View {
        
    
        let lesson = model.currentModule!.content.lessons[index]
        //Lesson Card
        ZStack(alignment: .leading)
        {
            Rectangle().foregroundColor(colorScheme == .dark ? Color.black : Color.white).cornerRadius(10).shadow(radius: 5).frame(height: 66)
            
            HStack(spacing: 30)
            {
                Text(String(index + 1)).bold().padding(.leading)
                VStack(alignment: .leading)
                {
                    Text(lesson.title).bold()
                    Text(lesson.duration)
                }
            }
        }.padding(.bottom, 5)
    }
}

