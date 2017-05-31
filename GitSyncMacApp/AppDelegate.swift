import Cocoa
@testable import Utils
@testable import Element
@testable import GitSyncMac
/**
 * This is the main class for the application
 * Not one error in a million keystrokes
 */
@NSApplicationMain
class AppDelegate:NSObject, NSApplicationDelegate {
    weak var window:NSWindow!
    var win:NSWindow?/*<--The window must be a class variable, local variables doesn't work*/
    var menu:Menu?
    
    func applicationDidFinishLaunching(_ aNotification:Notification) {
        Swift.print("GitSync - Automates git")//Simple git automation for macOS, The autonomouse git client,The future is automated
   
        //initApp()
        //styleTest()
        //initTestWin()//🚧👷
        //initMinimalWin()
        //paddingTest()
        calcTest()
        //StyleManager.addStyle("Button{width:calc(100% - 20px);}")
        
        //A recursive resize method
            //let minSize = CGSize(element.style["min-width"],element.style["min-height"])
            //let maxSize = CGSize(element.style["max-width"],element.style["max-height"])
            //setSize(element.getWidth,element.getHeight)
    }
    func styleTest()  {
        NSApp.windows[0].close()
        win = StyleTestWin(500,(400 + 10))
    }
    /**
     *
     */
    func calcTest(){
        window.contentView = InteractiveView2()
        var css:String = "#btn{fill:blue;width:calc(100% -20px);height:50;float:left;clear:left;}"
        css += "Section{fill:silver;padding:12px;}"
        StyleManager.addStyle(css)
        
        let section = window.contentView!.addSubView(Section(200,200))
        let btn = section.addSubView(Element(NaN,NaN,section,"btn"))
        
        section.addSubview(btn)
    }
    func paddingTest(){
        window.contentView = InteractiveView2()
        var css:String = "#btn{fill:blue;width:100%;height:100%;float:left;clear:left;}"
        css += "Section{fill:silver;padding:12px;}"
        StyleManager.addStyle(css)

        let section = window.contentView!.addSubView(Section(200,300))
        let btn = section.addSubView(Element(NaN,NaN,section,"btn"))
        
        section.addSubview(btn)
    }
    func initApp(){
        NSApp.windows[0].close()/*<--Close the initial non-optional default window*/
         StyleManager.addStylesByURL("~/Desktop/ElCapitan/gitsync.css",false)//<--toggle this bool for live refresh
         win = MainWin(MainView.w,MainView.h)
         //win = VibrantMainWin(MainView.w,MainView.h)
         //win = ConflictDialogWin(380,400)
         //win = CommitDialogWin(400,356)
         //StyleWatcher.watch("~/Desktop/ElCapitan/","~/Desktop/ElCapitan/gitsync.css", self.win!.contentView!)
        menu = Menu()/*This creates the App menu*/
    }
    func initTestWin(){
        //StyleManager.addStylesByURL("~/Desktop/ElCapitan/explorer.css",false)
        StyleManager.addStylesByURL("~/Desktop/ElCapitan/test.css",false)
        win = TestWin(500,400)/*Debugging Different List components*/
        
        /*fileWatcher = */
        //StyleWatcher.watch("~/Desktop/ElCapitan/","~/Desktop/ElCapitan/gitsync.css", self.win!.contentView!)
    }
    func initMinimalWin(){
        StyleManager.addStylesByURL("~/Desktop/ElCapitan/minimal.css",true)
        //Swift.print("StyleManager.styles.count: " + "\(StyleManager.styles.count)")
        //Swift.print("StyleManager.styles: " + "\(StyleManager.styles)")
        win = MinimalWin(500,400)
    }
    func applicationWillTerminate(_ aNotification:Notification) {
        /*Stores the app prefs*/
        if(PrefsView.keychainUserName != nil){//make sure the data has been read and written to first
            _ = FileModifier.write("~/Desktop/gitsyncprefs.xml".tildePath, PrefsView.xml.xmlString)
            Swift.print("💾 Write PrefsView to: prefs.xml")
        }
        Swift.print("💾 Write RepoList to: repo.xml")
        _ = FileModifier.write(RepoView.repoListFilePath.tildePath, RepoView.treeDP.tree.xml.xmlString)/*store the repo xml*/
        print("Good-bye")
    }
}
/*class Label:Flexible{
    //graphic bg
    //text that is centeres
    //implement Flexible
    // that also repos the text etc
    lazy var txtBtn:NSView = {
        let textButton:TextButton = TextButton.init(self.w, self.h, self.title, nil)
        return textButton
    }()
    init(_ rect:CGRect){
        
    }
}*/
/**
 *
 */
/*
func hitTesting(){
    window.contentView = InteractiveView2()
    StyleManager.addStyle("Button{fill:blue;}")
    
    let btn = Button(50,50)
    let container = window.contentView!.addSubView(Container(0,0,nil))
    
    container.addSubview(btn)
    /*container.layer?.position.x = 100
     container.layer?.position.y = 100*/
    container.layer?.position = CGPoint(40,20)
    //container.frame.origin = CGPoint(100,100)
    Swift.print("container.layer?.position: " + "\(container.layer?.position)")
    Swift.print("container.frame.origin: " + "\(container.frame.origin)")
    
    btn.layer?.position = CGPoint(40,20)
    //btn.frame
    Swift.print("btn.layer?.position: " + "\(btn.layer?.position)")
    Swift.print("btn.frame.origin: " + "\(btn.frame.origin)")
    btn.event = { event in
        if(event.type == ButtonEvent.upInside){Swift.print("hello world")}
    }
}
 */
