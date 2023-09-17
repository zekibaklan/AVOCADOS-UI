//
//  RipeningStagesView.swift
//  Avocados
//
//  Created by Zeki Baklan on 15.09.2023.
//

import SwiftUI

struct RipeningStagesView: View {
    //    MARK: - PROPERTIES
    
    
    var ripeningStages : [Ripening] = ripeningData
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            
            VStack {
                Spacer()
                HStack(alignment: .center,spacing: 25) {
                    ForEach(ripeningStages) { stage in
                        RipeningView(ripening: stage)
                    }
                }
                .padding(.vertical)
                .padding(.horizontal,25)
                Spacer()
            }
        }
    }
}

struct RipeningStagesView_Previews: PreviewProvider {
    static var previews: some View {
        RipeningStagesView(ripeningStages: ripeningData)
    }
}
