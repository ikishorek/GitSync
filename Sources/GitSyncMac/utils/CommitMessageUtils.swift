import Foundation
@testable import Utils
/**
 * Utility methods for parsing the the "git status message" 
 * TODO: Sometimes RM shows up, figure out what that does
 */
enum GitCMD:String{
    case M = "M"/*When a file is modified*/
    case D = "D"/*When a file is deleted*/
    case A = "A"/*When a file is added*/
    case R = "R"/*When a file is renamed,*/
    case AM = "AM"/*Beta, needs description, probably file added with two parents*/
    case MM = "MM"/*There are two Ms in your example because it's a merge commit with two parents*/
    case RM = "RM"/*When a file is renamed, new and experimental*/
    case QQ = "??"
    case UU = "UU"
}
class CommitMessageUtils{
	/**
	 * Returns a a text "commit message title" derived from PARAM: status_list
	 * PARAM: status_list: a list with records that contain staus type, file name and state
	 * NOTE: C,I,R seems to never be triggered, COPIED,IGNORED,REMOVED,
	 * NOTE: In place of Renamed, Git first deletes the file then says its untracked
     */
    static func sequenceCommitMsgTitle(_ statusList:[[String:String]])->String{
		var numOfNewFiles:Int = 0
		var numOfModifiedFiles:Int = 0
		var numOfDeletedFiles:Int = 0
		var numOfRenamedFiles:Int = 0
		for statusItem in statusList{
			let cmd = statusItem["cmd"]!/*TODO: rename to type or status_type*/
            switch GitCMD(rawValue:cmd){
				case .M?:
					numOfModifiedFiles += 1
                case .MM?://new and experimental
                    numOfModifiedFiles += 1
				case .D?:
					numOfDeletedFiles += 1
				case .A?:
					numOfNewFiles += 1
                case .AM?:
                    numOfNewFiles += 1
				case .R?: /*This command seems to never be triggered in git*/
					numOfRenamedFiles += 1
                case .RM?://new and experimental
                    numOfRenamedFiles += 1
				case .QQ?: /*untracked files*/
					numOfNewFiles += 1
				case .UU?: /*unmerged files*/
					numOfModifiedFiles += 1
				default:
					fatalError("cmd: " + "\(cmd)" + " Not supported")
					break;
			}
		}
		var commitMessage:String = ""
		if numOfNewFiles > 0 {
			commitMessage +=  "New files added: " + "\(numOfNewFiles)"
		}
		if numOfModifiedFiles > 0 {
			if !commitMessage.isEmpty {  commitMessage +=  ", " }/*--append comma*/
			commitMessage +=  "Files modified: " + "\(numOfModifiedFiles)"
		}
		if numOfDeletedFiles > 0 {
			if !commitMessage.isEmpty {  commitMessage += ", " }/*--append comma*/
			commitMessage +=  "Files deleted: " + "\(numOfDeletedFiles)"
		}
		if numOfRenamedFiles > 0 {
			if !commitMessage.isEmpty {  commitMessage +=  ", "}/*--append comma*/
			commitMessage +=  "Files renamed: " + "\(numOfRenamedFiles)"
		}
        //commitMessage = StringParser.decode(commitMessage)!
		return commitMessage
	}
}
