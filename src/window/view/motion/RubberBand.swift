import Cocoa
/**
 *
 */
class RubberBand:Mover{
    var maskRect:CGRect = CGRect(0,0,200,200)
    var itemRect:CGRect = CGRect(0,0,200,450)
    var frictionStrength:CGFloat/*This value is the strength of the friction*/
    var hasStopped:Bool = true
    var result:CGFloat = 0
    init(_ target:NSView, _ value:CGFloat, _ velocity:CGFloat = 0, _ frictionStrength:CGFloat = 0.98){
        self.frictionStrength = frictionStrength
        super.init(target, value, velocity)
        
    }
    override func updatePosition() {
        Swift.print("updatePosition()")
        //applyFriction()/*apply friction for every frame called*/
        checkBoundries()/*assert if the movement is close to stopping, if it is then stop it*/
        //checkForStop()
    }
    //var velocityX:CGFloat = 0
    let springFriction:CGFloat = 0.50;
    let epsilon:CGFloat = 0.15/*twips 20th of a pixel*/
    var spring:CGFloat = 0.1
    
    func checkBoundries(){
        if(value > maskRect.y){
            //Swift.print("the top of the item-container passed the mask-container top checkPoint")
            

            //Swift.print("onFrame")
            //let easing:CGFloat = 0.2
            let dist = -value
            velocity += (dist * spring)
            velocity *= springFriction
            value += velocity
            
        }else if((value + itemRect.height) < maskRect.height ){
            //Swift.print("the bottom of the item-container passed the mask-container bottom checkPoint")

            
        }else{
            super.updatePosition()
        }
    }
    /*
     * When velocity is less than epsilon basically less than half of a twib 0.15. then set the hasStopped flag to true
     * NOTE: Basically stops listening for the onFrame event
     */
    func checkForStop() {
        //Swift.print( "\(value.toFixed(3))" + " checkForStop " + "\((lastValue).toFixed(3))")
        if(velocity < 0.15) {
            Swift.print("stop")
            hasStopped = true
        }
    }
}
