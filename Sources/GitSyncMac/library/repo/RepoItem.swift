import Foundation
/**
 * TODO: Could this be a struct?
 */
struct RepoItem {
    var local:String = ""/*Local path*/
    var branch:String = ""/*Repo branch, Master is default*/
    var title:String = ""/*The title displayed in the app*/
    var active:Bool = false/*Active means that auto and pull will sync the repo*/
    var remote:String = ""/*Remote path to repository*/
    var message:Bool = false/*Auto-created commit message*/
    var auto:Bool = false/*Automatically syncs on an intervall*/
    //var interval:Int = 0
    //var keyChainItemName:String = ""
    //var upload:Bool = false
    //var download:Bool = false
    //var autoSyncInterval:Bool = false
    //var fileChange:Bool = false
    
}
enum RepoType:String{
    case title = "title"
    case local = "local"
    case remote = "remote"
    case branch = "branch"
    case auto = "auto"
    case message = "message"
    case active = "active"
}
enum RepoFolderType:String{
    case isOpen = "isOpen"
    case hasChildren = "hasChildren"
}

/*
 class RepoItemType {
 static var localPath:String = "localPath"
 static var interval:String = "interval"
 static var branch:String = "branch"
 static var keyChainItemName:String = "keyChainItemName"
 static var upload:String = "upload"
 static var title:String = "title"
 static var download:String = "download"
 static var active:String = "active"
 static var remotePath:String = "remotePath"
 static var autoSyncInterval:String = "autoSyncInterval"
 static var autoCommitMessage:String = "autoCommitMessage"
 static var fileChange:String = "fileChange"
 static var pullToAutoSync:String = "pullToAutoSync"
 }*/
