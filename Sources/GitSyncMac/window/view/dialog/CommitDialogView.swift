import Foundation
@testable import Utils
@testable import Element

class CommitDialogView:Element {
    override func resolveSkin() {
        super.resolveSkin()
        UnFoldUtils.unFold(Config.app,"commitDialogView",self)
        let data:[String:[String:Any]] = [
            "repo":["inputText":"ElementiOS"],
            "title":["inputText":"Added support for padding"],
            "desc":["inputText":"4 Files changed"]
        ]
        UnFoldUtils.applyData(self, data)
    }
    /*var data:[String:Any]{
        get{fatalError("not avilable")}
        set{
            if let repo:TextInput? = self.element("repo"), let repoText {
                
            }
            var title:TextInput? {return self.element("title")}
            var desc:TextInput? {return self.element("desc")}
            
        }
    }*/
}
