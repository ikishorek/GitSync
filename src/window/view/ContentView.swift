import Foundation

class ContentView:Element{
    var repoView:RepoView?
    var repoDetailView:RepoDetailView {return RepoDetailView(width,height,self)}
    
    override func resolveSkin() {
        StyleManager.addStyle("ContentView{float:left;clear:none;/*fill:orange;*/}")
        super.resolveSkin()
        repoView = addSubView(RepoView(width,height,self))
        

    }
    override func onEvent(event: Event) {
        if(event.type == ListEvent.select){
            Swift.print("ContentView select")
            repoView!.removeFromSuperview()
        }
    }
}
class RepoData {
    var dp:DataProvider?
    static var sharedInstance = RepoData()
    private init() {
        let xml = FileParser.xml("~/Desktop/repo.xml")
        dp = DataProvider(xml)
    }
}