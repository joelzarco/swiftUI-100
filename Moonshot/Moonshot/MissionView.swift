//
//  MissionView.swift
//  Moonshot
//
//  Created by Johel Zarco on 29/12/22.
//

import SwiftUI

struct MissionView: View {
    struct CrewMember{
        let role : String
        let astronaut : Astronaut
    }
    
    let mission : Mission
    let crew : [CrewMember]
    
    var body: some View {
        GeometryReader{ geometry in
            ScrollView{
                VStack{
                    Image(mission.image)
                        .resizable()
                        .scaledToFit()
                        .frame(maxWidth: geometry.size.width * 0.6)
                        .padding(.vertical)
                    
                    Divider()
                        .padding(.vertical)
                    
                    VStack(alignment: .leading) {
                        Text("Mission highlights")
                            .font(.title.bold())
                            .padding(.bottom)
                        
                        Text(mission.description)
                        // custom divider
                        Rectangle()// not edge to edge
                            .frame(height: 2)
                            .foregroundColor(.lightBackground)
                            .padding(.vertical)
                        
                        Text("Crew")
                            .font(.title.bold())
                            .padding(.bottom, 2)
                    } //innerVS
                    .padding(.horizontal)
                    // ----------------------- CrewMemberScrollView
                    ScrollView(.horizontal, showsIndicators: false){
                        HStack{
                            ForEach(crew, id: \.role) { crewMember in
                                NavigationLink{
                                    Text("Astronaut details")
                                } label: {
                                    HStack{
                                        Image(crewMember.astronaut.id) // id matches asset catalog
                                            .resizable()
                                            .frame(width: 104, height: 72)
                                            .clipShape(Capsule())
                                            .overlay {
                                                Capsule()
                                                    .strokeBorder(.white, lineWidth: 1)
                                            }
                                        VStack(alignment: .leading){
                                            Text(crewMember.astronaut.name)
                                                .foregroundColor(.white)
                                                .font(.headline)
                                            Text(crewMember.role)
                                                .foregroundColor(.secondary)
                                                .font(.subheadline)
                                        }
                                    }
                                    .padding(.horizontal) //
                                }
                            }
                        }
                    }
                    .padding(.leading)
                    //------------------------
                } // VS
                .padding(.bottom)
            } // Scr
        } // Geo
        .navigationTitle(mission.displayName)
        .navigationBarTitleDisplayMode(.inline)
        .background(.darkBackground)
    }
    
    init(mission: Mission, astronauts: [String : Astronaut]) {
        self.mission = mission
        
        self.crew = mission.crew.map{ member in
            if let astronaut = astronauts[member.name]{
                return CrewMember(role: member.role, astronaut: astronaut)
            } else{
                print("Could not match artronauts/role \(member.name)")
                fatalError("Check your json")
            }
        }
        print("Number of astronauts \(crew.count)")
    }
    
}

//struct MissionView_Previews: PreviewProvider {
//    static var previews: some View {
//        MissionView()
//    }
//}
