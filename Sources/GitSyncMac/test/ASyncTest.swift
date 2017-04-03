import Foundation
@testable import Utils

//do 3 things async, 
//then in each 3 things do 2 things async but do something on mainthread when these 4 things are all finished

class ASyncTest {
    /**
     * Next implement the bellow in your example:
     * TODO: Also research blocks
     */
    init(){
        let group = DispatchGroup()
        
        bg.async{/*do 2 things at the same time*/
            group.enter()
            Swift.print("do default")
            sleep(IntParser.random(3, 6).uint32)/*simulates task that takes between 1 and 6 secs*/
            group.leave()
        }
        if("" != ""){
            bg.async{/*do 2 things at the same time*/
                group.enter()
                Swift.print("do the first")
                sleep(IntParser.random(2, 7).uint32)/*simulates task that takes between 1 and 6 secs*/
                group.leave()
            }
        }else{
            Swift.print("do the second")
        }
        
        //group.wait()/*wait blocks main thread*/
        group.notify(queue: bg, execute: {//TODO: reaplce bg with main, then remove main.async. just call onComplete?
            main.async {/*you have to jump back on main thread to call things on main thread as this scope is still on bg thread*/
                Swift.print("🏁 group completed: 🏁")//make a method on mainThread and call that instead.
            }
        })
    }
}

