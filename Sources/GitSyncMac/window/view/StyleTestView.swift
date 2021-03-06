import Cocoa
@testable import Utils
@testable import Element
/**
 * TODO: Maybe make mainView into a lazy static prop similar to RepoView
 */
class StyleTestView:CustomView{
    //TODO: ⚠️️ make this a singlton
    var main:Section?
    static var content:Section?
    static var currentView:Element?
    static var leftbar:LeftSideBar?
    
    override func resolveSkin(){
        Swift.print("StyleTestView")
        
        super.resolveSkin()
        main = self.addSubView(Section(NaN,NaN,self,"main"))
        
        StyleTestView.leftbar = main?.addSubView(LeftSideBar(NaN,NaN,main,"leftBar"))
        StyleTestView.content = main?.addSubView(Section(NaN,NaN,main,"content"))
        Nav.setView(.main(.commit))/*⬅️️🚪*///.dialog(.commit)
        //Nav.setView(.repoDetail([0,0,0]))
    }
    /**
     * NOTE: gets calls from Window.didResize
     */
    override func setSize(_ width:CGFloat,_ height:CGFloat){
        super.setSize(width, height)
        //Swift.print("StyleTestView.setSize w:\(width) h:\(height)")
        ElementModifier.refreshSize(main!)
    }
    /**
     * 1. make StyleTestWin have a static view 👈
     * 2. make then you can make this method a non-static one and use regular optionals
     * 3. Then continue making the hide sidebar when dialog etc
     */
    func toggleSideBar(_ hide:Bool){
        Swift.print("toggleSideBar: hide: " + "\(hide)")
        //remove leftSideBar
        let mainView:StyleTestView = self
        guard let leftBar = StyleTestView.leftbar else{fatalError("must be available")}
        guard let content = StyleTestView.content else{fatalError("must be available")}
        let iconSection = mainView.iconSection
        
        if hide {
            iconSection.setSkinState("hidden")/*hides the Min,Max,Close btns*/
            leftBar.setSkinState("hidden")
            content.setSkinState("full")
        }else{
            iconSection.setSkinState("")/*default*/
            leftBar.setSkinState("")/*default*/
            content.setSkinState("")/*default*/
        }
        ElementModifier.refreshSkin(leftBar)
        ElementModifier.refreshSkin(content)
        /*detailView.setSkinState(detailView.getSkinState())*/
        ElementModifier.float(leftBar)
        ElementModifier.float(content)/**/
        //self.setSize(getWidth(),getHeight())
        Swift.print("toggle completed")
    }
}
