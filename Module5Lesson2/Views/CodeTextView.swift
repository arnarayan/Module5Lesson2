//
//  CodeTextView.swift
//  Module5Lesson2
//
//  Created by Anand Narayan on 2022-05-11.
//

import SwiftUI

struct CodeTextView: UIViewRepresentable {

    @EnvironmentObject var model: ContentModel
    
    func makeUIView(context: Context) -> UITextView {
        let textView = UITextView()
        textView.isEditable = false
        return textView
    }
    
    func updateUIView(_ textView: UITextView, context: Context) {
        // set the attributed text for the lesson
        textView.attributedText = model.codeTextView
        // Scroll back to the top
        textView.scrollRectToVisible(CGRect(x: 0, y: 0, width: 1, height: 1), animated: false)
    }
    
}

struct CodeTextView_Previews: PreviewProvider {
    static var previews: some View {
        CodeTextView().environmentObject(ContentModel())
    }
}
