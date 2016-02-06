import Cocoa

class WinView3:FlippedView {
    override var wantsDefaultClipping:Bool{return false}//avoids clipping the view
    override init(frame frameRect: NSRect) {
        super.init(frame: frameRect)
        createContent()
    }
    required init?(coder: NSCoder) {fatalError("init(coder:) has not been implemented")}
    func createContent(){
        //hoverTest()
        //stateTest()
        //styleDepthTest()
        //marginTest()
        //titlebarTest()
        iconBarTest()
        //depthTest()
        //assetCSSTest()
        //svgTest()
        
        //let result = SVGPathParser.parameters("-75,53.571-147.029,36.822-185-89.748")//[-75.0, 53.571, -147.029, 36.822, -185.0, -89.748]
        //Swift.print("result: " + "\(result)")

        //debugRegExpDigitPattern()
        //regExpBackRefTest()
    }
   
    /**
     *
     */
    func hoverTest(){
        
        
        //Continue here: Make a simple test: first a button with hover color change, then add shadow, then gradient, then layers, then fillet. Fix this method
        //continue here: figure out why asset decoror doesnt get the update call
        //try to add more decorators also svg, then try depth with many combinations etc.
        //try color at depth 0 and svg at depth 1
        
        var css:String = "SelectButton{"
        //css += "fill:linear-gradient(top,blue,red);"
        //css += "fill:red,blue;"
        
        //css += "width:100px,50px;"
        //css += "height:100px,50px;"
        //css += "corner-radius:5px;"
        
        css += "line:grey7,none;"
        css += "line-offset-type:outside;"
        css += "line-alpha:1;"
        css += "line-thickness:1px;"
        css += "margin-top:0px,1px;"
        css += "margin-left:0px,1px;"
        css += "width:24px,24px;"
        css += "height:24px,24px;"
        css += "drop-shadow:drop-shadow(0px 0 #FF0000 0.0 0 0 0 0 true);"
        css += "}"
        
        css += "SelectButton#first{"
        css += "fill:linear-gradient(top,#FFFEFE,#E8E8E8),~/Desktop/svg/icons/view/icons.svg grey5;"
        css += "corner-radius:4px 0px 4px 0px;"
        css += "}"
        
        css += "SelectButton#first:selected{"
        //css += "fill:linear-gradient(top,green,orange);"
        //css += "fill:orange,yellow;"
        css += "fill:linear-gradient(top,grey9,grey8),~/Desktop/svg/icons/view/icons.svg white;"
        //css += "width:64,32px;"
        //css += "height:64px,32px;"
        //css += "corner-radius:10px;"
        css += "}"
        css += "SelectButton:selected{"
        css += "drop-shadow:drop-shadow(0px 0 #000000 0.4 4 4 1 2 true);"//<--inset shadow
        css += "}"
        StyleManager.addStyle(css)
        let button = SelectButton(100,100,false,nil,"first")
        addSubview(button)
        button.setPosition(CGPoint(20,20))
        
        /* button.setSkinState("over")
        let tempStyle = StyleResolver.style(button)
        StyleParser.describe(tempStyle)*/
    }
    /**
     * NOTE: a test that prints the style when the Element is in over state.
     */
    func stateTest(){
        
        //Continue here: write a test that prints the style when the Element is in over state.
        //This state should mimic the idle state if no css is defined for the over state.
        //Currently the line-offset stuff isnt deriving the correct values
        //the test should be simple, use button and a fill and a line color and the line offset variables
        
        
        //Continue here: the problem is ofcourse how the StyleResolver generates the style for the over state.
        //It probably doesnt add the styleProps in the correct order. verify this with a test
        
        //continue here: you need to revisit the original idea for this. The bug is probably simple.
        
        //I feel that the way the prepend method works now isnt the best. But it seems to be the same in the original idea. 
        //try to make it as is and see if the problem goes away
        
        var css:String = "Button{"
        css += "fill:grey7;line:grey1;line-thickness:4px;"
        css += "line-offset-type:outside;"
        css += "line-offset-type-right:inside;"
        css += "line-offset-type-left:inside;"
        css += "}"
        StyleManager.addStyle(css)
        let button:Button = Button(100,100)
        button.setSkinState("over")
        addSubview(button)
        button.setPosition(CGPoint(20,20))
        
        //let tempStyle = StyleResolver.style(button)
        //StyleParser.describe(tempStyle)
    }
    
    /**
     * @NOTE this was a test to figure out: depth problem when a resolving style.
     */
    func styleDepthTest(){
        var css:String = "Element{width:24px,12px;height:24px,12px;}"
        css += "Element#first{fill:blue,green;}"
        
        /*
        let styleCollection:IStyleCollection = CSSParser.styleCollection(css)
        let styleProperty = styleCollection.getStyle("Element")?.getStyleProperty("width",1)
        Swift.print("styleProperty.value: " + String(styleProperty!.value))
        StyleManager.addStyle(styleCollection.styles)
        */
        StyleManager.addStyle(css)
        let element:Element = Element(100,100,nil,"first")
        addSubview(element)
        
        let tempStyle = StyleResolver.style(element)
        StyleParser.describe(tempStyle)
    }
    /**
     * TODO: not all instances of none works, test this, with the depth. first fill is none, then blue and opposite etc.
     */
    func marginTest(){
        let css:String = "Element{fill:linear-gradient(top,blue,red);width:64px;height:64px;margin-top:12px;}"//,blue 0.33 0.4724 //,red;fill-alpha:1,0.5;
        let styleCollection:IStyleCollection = CSSParser.styleCollection(css)
        let style:IStyle = styleCollection.getStyle("Element")!
        let styleProperty:IStyleProperty = style.getStyleProperty("fill")!
        let value = styleProperty.value
        Swift.print("value: " + "\(value)")
        
        StyleManager.addStyle(styleCollection.styles)
        let element:Element = Element(100,100)
        addSubview(element)
    }
    /**
     * TODO: targeting "Button" should work even if the button has an id, there was a problem with the fill not registering
     * TODO: get the element class to work with out a width/height, derive the the width and height for the hit test area from the skin. The first depth or the bounds of every depth or or...
     */
    func titlebarTest(){
        var css:String = "Button{width:12px,12px;height:12px,12px;margin-left:0px;margin-top:0px;}"
        css += "Button:over{fill:~/Desktop/icons/titlebar/close_hover.svg none;}"
        css += "Button#close{fill:~/Desktop/icons/titlebar/close.svg none;}"
        css += "Button#minimize{fill:~/Desktop/icons/titlebar/minimize.svg none;}"
        css += "Button#maximize{fill:~/Desktop/icons/titlebar/maximize.svg none;}"
        
        StyleManager.addStyle(css)
        let closeButton = Button(12,12,nil,"close")/*<--the w and h should be NaN, test if it supports this*/
        let minimizeButton = Button(12,12,nil,"minimize")
        let maximizeButton = Button(12,12,nil,"maximize")
        
        self.addSubview(closeButton)
        closeButton.setPosition(CGPoint(8,4))
        self.addSubview(minimizeButton)
        minimizeButton.setPosition(CGPoint(28,4))
        self.addSubview(maximizeButton)
        maximizeButton.setPosition(CGPoint(48,4))
    }
    /**
     *
     */
    func iconBarTest(){
        var css:String = "SelectButton{"
        css += "line:grey7,none;"
        css += "line-offset-type:outside;"
        css += "line-alpha:1;"
        css += "line-thickness:1px;"
        css += "margin-top:0px,1px;"
        css += "margin-left:0px,1px;"
        css += "width:24px,24px;"
        css += "height:24px,24px;"
        css += "drop-shadow:drop-shadow(0px 0 #FF0000 0.0 0 0 0 0 true);"
        css += "}"
        
        css += "SelectButton#first{"
        css += "fill:linear-gradient(top,#FFFEFE,#E8E8E8),~/Desktop/svg/icons/view/icons.svg grey5;"
        css += "corner-radius:4px 0px 4px 0px;"
        css += "}"
        
        css += "SelectButton#first:selected{"
        css += "fill:linear-gradient(top,grey9,grey8),~/Desktop/svg/icons/view/icons.svg white;"
        css += "}"
        
        css += "SelectButton#second{"
        css += "fill:linear-gradient(top,#FFFEFE,#E8E8E8),~/Desktop/svg/icons/view/list.svg grey5;"
        css += "corner-radius:0px;"
        css += "line-offset-type-right:inside;"
        css += "line-offset-type-left:inside;"
        css += "margin-left:0px,0px;"/*bug fix, sort it out later*/
        css += "}"
        
        css += "SelectButton#second:over{"/*bug fix, sort it out later*/
        css += "line-offset-type-right:inside;"
        css += "line-offset-type-left:inside;"
        css += "}"
        
        css += "SelectButton#second:selected{"
        css += "fill:linear-gradient(top,grey9,grey8),~/Desktop/svg/icons/view/list.svg white;"
        css += "margin-left:0px,0px;"/*bug fix, sort it out later*/
        css += "}"
        
        css += "SelectButton#third{"
        css += "fill:linear-gradient(top,#FFFEFE,#E8E8E8),~/Desktop/svg/icons/view/columns.svg grey5;"
        css += "corner-radius:0px;"
        css += "line-offset-type-right:inside;"
        css += "}"
        
        css += "SelectButton#third:selected{"
        css += "fill:linear-gradient(top,grey9,grey8),~/Desktop/svg/icons/view/columns.svg white;"
        css += "}"
        
        css += "SelectButton#fourth{"
        css += "fill:linear-gradient(top,#FFFEFE,#E8E8E8),~/Desktop/svg/icons/view/coverflow.svg grey5;"
        css += "corner-radius:0px 4px 0px 4px;"
        css += "}"
        
        css += "SelectButton#fourth:selected{"
        css += "fill:linear-gradient(top,grey9,grey8),~/Desktop/svg/icons/view/coverflow.svg white;"
        css += "}"
        /**/
        css += "SelectButton:selected{"
        css += "drop-shadow:drop-shadow(0px 0 #000000 0.4 4 4 1 2 true);"
        css += "}"


        /**/
        
        let styleCollection:IStyleCollection = CSSParser.styleCollection(css)
        
        //let styleProperty = styleCollection.getStyle("SelectButton")?.getStyleProperty("corner-radius")
        //Swift.print("styleProperty.value: " + String(styleProperty!.value))
        StyleManager.addStyle(styleCollection.styles)
        /**/
        let iconButton1 = SelectButton(24,24,false,nil,"first")
        
        
        //iconButton1.setSkinState("selected")
        
        //Try to replicate in the hover state test, or strip this example down, remove line etc
        
        //let tempStyle = StyleResolver.style(iconButton1)
        //Swift.print("-----start----")
        //StyleParser.describe(tempStyle)/**/
        //Swift.print("-----end----")
        
        
        iconButton1.setPosition(CGPoint(10,20))
        self.addSubview(iconButton1)
        
        let iconButton2 = SelectButton(24,24,false,nil,"second")
        addSubView(iconButton2)
        iconButton2.setPosition(CGPoint(10+24+2,20))
       
        let iconButton3 = SelectButton(24,24,false,nil,"third")
        addSubView(iconButton3)
        iconButton3.setPosition(CGPoint(10+24+2+24,20))
        
        let iconButton4 = SelectButton(24,24,false,nil,"fourth")
        addSubView(iconButton4)
        iconButton4.setPosition(CGPoint(10+24+2+24+24+1,20))/**/
        /**/
        
        
        
        

        
        let selectGroup = SelectGroup([iconButton1,iconButton2,iconButton3,iconButton4/**/],iconButton2);
        selectGroup
    }
    /**
     * Add depth to the framework (svgasset is useless without it, and floating wont be that hard anyways, its the last thing)
     */
    func depthTest(){
        let css:String = "Element{fill:blue,red;width:64px,32px;height:64px,32px;}"//,blue 0.33 0.4724 //,red;fill-alpha:1,0.5;
        let styleCollection:IStyleCollection = CSSParser.styleCollection(css)
        let style:IStyle = styleCollection.getStyle("Element")!
        let styleProperty:IStyleProperty = style.getStyleProperty("fill")!
        let value = styleProperty.value
        Swift.print("WinView3.depthTest() value: " + "\(value)")
        
        StyleManager.addStyle(styleCollection.styles)
        let element:Element = Element(200,200)
        addSubview(element)
    }
    func assetCSSTest(){
        var path = "~/Desktop/icons/"
        path += "search.svg"
        path = "~/Desktop/svg/icons/view/list.svg"
        let css:String = "Element{fill:red," + path + " green;}"//,blue 0.33 0.4724,red,
        Swift.print("css: " + "\(css)")
        let styleCollection:IStyleCollection = CSSParser.styleCollection(css)
        let style:IStyle = styleCollection.getStyle("Element")!
        let styleProperty:IStyleProperty = style.getStyleProperty("fill")!
        Swift.print("styleProperty.value: " + "\(styleProperty.value)")
        //let assetURL:String = styleProperty.value as! String
        //Swift.print("assetURL: " + "\(assetURL)")
        
        //continue here, figure out how you dealt with svgasset and color, i think it has to do with assering class type is array etc
        
        StyleManager.addStyle(styleCollection.styles)
        let element:Element = Element(20,20)
        addSubview(element)
        /**/
    }
    /**
     *
     */
    func svgTest(){
        var path = "~/Desktop/icons/"//gradient_rect_2.svg,search.svg,rect.svg,cross.svg,rect.svg,circle.svg,cross_4.svg,line.svg,polyline.svg
        //path += "gradient_rect.svg"
        //path += "linear_gradient_polygon.svg"
        //path += "relative_linear_gradient_polygon.svg"
        //path += "relative_radial_gradient_polygon.svg"
        //path += "radial_gradient_polygon.svg"
        //path += "linear_gradient_stroke_polygon.svg"
        //path += "radial_gradient_stroke_polygon.svg"
        //path += "relative_linear_gradient_stroke_polygon.svg"
        //path += "radial_test.svg"
        //path += "ellipse_2.svg"
        //path += "maximize.svg"
        //path += "ellipse.svg"
        //path += "circle_top_shine.svg"
        //path += "close_btn.svg"
        //path += "close.svg"
        //path += "close_hover.svg"
        //path += "minimize.svg"
        //path += "radial_gradient_rect.svg"
        //path += "gradient_rect_2.svg"
        //path += "circle.svg"
        //path += "rect.svg"
        //path += "cross.svg"
        //path += "cross_2.svg"
        //path += "search.svg"
        //path += "line.svg"
        //path += "ellipse_3.svg"
        //path += "roundrect.svg"
        //path += "titlebar_buttons.svg"
        path = "~/Desktop/svg/icons/view/list.svg"
 
        let content = FileParser.content(path.tildePath)
        //Swift.print("content: " + "\(content)")
        
        let xmlDoc:NSXMLDocument = try! NSXMLDocument(XMLString: content!, options: 0)
        let rootElement:NSXMLElement = xmlDoc.rootElement()!
        //Swift.print("rootElement.localName: " + "\(rootElement.localName)")
        //Swift.print("rootElement.childCount: " + "\(rootElement.childCount)")
        
        //let child:NSXMLElement = XMLParser.childAt(rootElement.children!, 0)!
        //Swift.print("child.stringValue: " + "\(child.stringValue)")
        //Swift.print("child.localName: " + "\(child.localName)")
        
        let svg:SVG = SVGParser.svg(rootElement);
        //Swift.print("svg.subviews.count: " + "\(svg.subviews.count)")
        //Swift.print("svg.subviews[0]: " + "\(svg.subviews[0])")
        
        //SVGParser.describeAll(svg)
        
        SVGModifier.style(svg, SVGStyle(Double(0xFF0000),1.0))
        SVGModifier.scale(svg, CGPoint(), CGPoint(0.5,0.5));
        //SVGUtils.dsc(svg, CGPoint(), CGPoint(2,2));
        
        //SVGModifier.offsetItems(svg, CGPoint(20,20))
        
        addSubview(svg);
        
    }
    
    
    
    func debugRegExpDigitPattern(){
        let testCases:Array<String> = ["2.3","2","44","22.11","-2.3","-2","-44","-22.11","20.",".10",".3","1.",".","-20.","-.10","-.3","-1.","-."]
        
        let g1:String = "(?=\\s|^)"/*must be preceeded by a space char or the begining*/
        let g6:String = "(?=$)"/*followed by an end or */
        
        let pattern:String = g1 + RegExpPattern.digitAssertPattern + g6
        for testCase in testCases{
            Swift.print(testCase.test(pattern))
        }
    }
    func regExpBackRefTest(){
        let str:String = "86,26.288 64,48.916 41.373,26.287 -26.288,41.372 48.916,6 26.289,86.628   41.373,101.713 64,79.085 86.627,101.712 101.713,86.627 79.086,64 101.713,41.372"
        let part1:String = "(?<=^|\\,|\\s|px|\\b)"/*group 1, preseeding match must aprear but is not included in the final result */
        //let part2:String = "\\-?\\d*?"/*optional minus sign followed by a digit zero or more times*/
        //let part3:String = "(\\.?)"/*group 2, optional dot char*/
        //let part4:String = "(($1)\\d+?)"/*group 3, if there is a match in group 1 and followed by a digit more than zero times*/
        let part5:String = "(?=px|\\s|\\,|\\-|$)"/*group 4,the subseeding pattern must apear, but is not included in the match, the pattern is: px*/
        let pattern:String = part1 + RegExpPattern.digitAssertPattern + part5
        let stringArray:Array<String> = str.match(pattern);
        Swift.print("stringArray: " + "\(stringArray)")
        //let array:Array<CGFloat> = stringArray.map {CGFloat(Double($0)!)}//<--temp fix
    }
}
