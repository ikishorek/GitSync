import Foundation
@testable import Utils

//do 3 things async, 
//then in each 3 things do 2 things async but do something on mainthread when these 4 things are all finished

class ASyncTest {
    /**
     *
     */
    init(){
        let group = DispatchGroup()
        group.enter()
        for _ in 0..<3{
            bg.async {/*do 3 things at the same time*/
                for _ in 0..<2{
                    bg.async{/*do 2 things at the same time*/
                        sleep(2/*IntParser.random(1, 6).uint32*/)/*simulates task that takes between 1 and 6 secs*/
                        Swift.print("i: \(i) e:\(e)")
                    }
                }
            }
        }
        group.leave()
        group.wait()
        Swift.print("🏁 allTasksCompleted: 🏁")
    }
}
