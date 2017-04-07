import Foundation
@testable import Utils
@testable import Element

class IterimScrollGroup{//rename to interim*
    var iterimScrollX:InterimScroll = InterimScroll()
    var iterimScrollY:InterimScroll  = InterimScroll()
}
extension IterimScrollGroup{
    func iterimScroll(_ dir:Dir)-> InterimScroll{/*Convenience*/
        return dir == .hor ? iterimScrollX : iterimScrollY
    }
    var prevScrollingDelta:CGFloat {
        get{fatalError("get not supported")}
        set{iterimScrollX.prevScrollingDelta = newValue;iterimScrollY.prevScrollingDelta = newValue}
    }
    var velocities:[CGPoint]{
        get{return zip(iterimScrollX.velocities,iterimScrollY.velocities).map{CGPoint($0.0,$0.1)}}
        set{iterimScrollX.velocities = newValue.map{$0.x};iterimScrollY.velocities = newValue.map{$0.y}}
    }
}