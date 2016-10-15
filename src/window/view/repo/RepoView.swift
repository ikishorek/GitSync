import Foundation

class RepoView:Element {
    var topBar:TopBar?
    var treeList:TreeList?
    override func resolveSkin() {
        Swift.print("RepoView.resolveSkin()")
        super.resolveSkin()
        
        topBar = addSubView(TopBar(width-24,36,self))
        
        let xml:NSXMLElement = FileParser.xml("~/Desktop/repo2.xml".tildePath)
        treeList = addSubView(TreeList(width, height-24, NaN, Node(xml), self))
        
    }
}

/**
 * Add,Remove,Edit,Cut,Paste
 */
class TopBar:Element{
    var removeButton:TextButton?
    var addButton:TextButton?
    /*var copyButton:TextButton?
    var pasteButton:TextButton?*/
    var editButton:TextButton?
    override func resolveSkin() {
        Swift.print("TopBar.resolveSkin()")
        super.resolveSkin()
        addButton = addSubView(TextButton(NaN,24,"Add",self,"add"))
        removeButton = addSubView(TextButton(NaN,24,"Remove",self,"remove"))
        /*copyButton = addSubView(TextButton(NaN,24,"Copy",self,"copy"))
        pasteButton = addSubView(TextButton(NaN,24,"Paste",self,"paste"))*/
        editButton = addSubView(TextButton(NaN,24,"Edit",self,"edit"))
    }
}