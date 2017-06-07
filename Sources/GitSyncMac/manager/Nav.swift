import Foundation
@testable import Utils
@testable import Element
@testable import GitSyncMac
enum Views2{
    enum Main:String{
        case commit = "commit"
        case repo = "repo"
        case prefs = "prefs"
    }
    case main(Main)
    case commitDetail([String:String])
    case repoDetail([Int])
    case dialog(Dialog)
    enum Dialog{
        case conflict
        case commit
    }
}
class Nav {
    /**
     * Navigate between views
     */
    static func setView(_ viewType:Views2){
        //Navigation.activeView = view
        guard let mainView:Element = StyleTestView.content else{fatalError("mainView is nil")}
        StyleTestView.leftbar?.menuContainer?.selectButton(viewType)/*Selects the correct menu icon*/
        if let curView = StyleTestView.currentView {curView.removeFromSuperview()}
        let view = getView(viewType,mainView/*,size*/)
        StyleTestView.currentView = mainView.addSubView(view)
        
    }
    private static func getView(_ view:Views2,_ mainView:Element/*,_ size:CGSize*/)->Element{
        /*let w:CGFloat = size.w/*Convenience*/
         _ = w
         let h:CGFloat = size.h
         _ = h*/
        switch view{
        case .main(let viewType):/*Main*/
            switch viewType {
            case .commit:
                return CommitView(NaN,NaN,mainView)
            case .repo:
                return RepoView2(NaN,NaN,mainView)
            case .prefs:
                return Section(NaN,NaN,mainView,"prefs")
            }
        case .commitDetail(let commitData):/*CommitDetail*/
            let view:CommitDetailView = CommitDetailView(NaN,NaN,mainView)
             view.setCommitData(commitData)
             return view
            //fatalError("not implemented yet")
        case .repoDetail(let idx3d):/*RepoDetail*/
            _ = idx3d
            /*let view:RepoDetailView = RepoDetailView(w,h,mainView)
             view.setRepoData(idx3d)
             return view*/
            fatalError("not implemented yet")
        case .dialog(let dialog):/*Dialogs*/
            _ = dialog
            switch dialog{
            case .commit:
                fatalError("not implemented yet")
            case .conflict:
                //return ConflictDialogView(w,h,mainView)
                fatalError("not implemented yet")
            }
        }
    }
}