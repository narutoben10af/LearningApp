//
//  HomeViewRow.swift
//  LearningApp
//
//  Created by Lim Si Eian on 10/11/21.
//

import SwiftUI

struct HomeViewRow: View
{
    @Environment(\.colorScheme) var colorScheme

    var image: String
    var title: String
    var description: String
    var count: String
    var time: String
    
    var body: some View
    {
        ZStack
        {
            Rectangle().foregroundColor(colorScheme == .dark ? Color.black : Color.white).cornerRadius(10).shadow(radius: 5).aspectRatio(CGSize(width: 335, height: 175), contentMode: .fit)
            
            HStack
            {
                Image(image).resizable().frame(width: 116, height: 116).clipShape(Circle())
                
                Spacer()
                //Text
                VStack(alignment: .leading, spacing: 5)
                {
                    //Headline
                    Text(title).bold()
                    
                    //Description
                    Text(description).padding(.bottom, 20).font(.caption)
                    
                    //Icons
                    HStack
                    {
                        //Number of Lessons/Questions
                        Image(systemName: "text.book.closed").resizable().frame(width: 15, height: 15)
                        
                        Text(count).font(Font.system(size: 10))
                        
                        Spacer()
                        
                        //Time
                        Image(systemName: "clock").resizable().frame(width: 15, height: 15)
                        Text(time).font(Font.system(size: 10))
                    }

                }
            }
            .padding(.horizontal, 20)
        }
    }
}

struct HomeViewRow_Previews: PreviewProvider
{
    static var previews: some View
    {
        HomeViewRow(image: "swift", title: "Learn swift", description: "swift", count: "10 lessons", time: "5 hours")
    }
}
