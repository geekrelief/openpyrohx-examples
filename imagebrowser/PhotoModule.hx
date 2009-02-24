import com.cimians.openPyro.aurora.AuroraContainerSkin;
import com.cimians.openPyro.core.UIContainer;
import com.cimians.openPyro.layout.HLayout;
import com.cimians.openPyro.layout.VLayout;
import com.cimians.openPyro.painters.FillPainter;
import com.cimians.openPyro.painters.GradientFillPainter;
import com.cimians.openPyro.controls.List;
import com.cimians.openPyro.controls.events.ListEvent;
import com.cimians.openPyro.controls.listClasses.DefaultListRenderer;
import com.cimians.openPyro.core.ClassFactory;
import com.cimians.openPyro.controls.Image;


import flash.events.MouseEvent;
import flash.text.TextFormat;

typedef Pic = { label:String, data:String }
class PhotoModule extends UIContainer {
    var picData:Array<Pic>;
    var img:Image;
    var list:List;
    var scrollPane:UIContainer;
    public function new(){
        super();
        
        picData  = [  {label:"freeza", data:"images/freezer.jpg"}
                      ,{label:"toradora", data:"images/toradora.jpg"}
                      ,{label:"nodame", data:"images/nodame.jpg"}
                   ];
    }

    override function createChildren():Void {
        this.layout = new HLayout(10);
        list = new List();
        var itemRendererFactory:ClassFactory = new ClassFactory(DefaultListRenderer);
        itemRendererFactory.properties = { setPercentWidth: 100
                                         , setHeight:30
                                         , setRollOutBackgroundPainter: new FillPainter(0x444444)
                                         , setLabelFormat: new TextFormat("Arial", 12, 0xffffff)
                                         };
        list.itemRenderer = itemRendererFactory;
        list.dataProvider = picData;
        list.layout = new VLayout(); 
        list.skin = new AuroraContainerSkin();
        list.mwidth = 250;

        var listPainter:GradientFillPainter = new GradientFillPainter([0x222222, 0x111111]);
        listPainter.rotation = Math.PI/2;

        list.backgroundPainter = listPainter;
        list.percentHeight = 100;

        list.addEventListener(ListEvent.CHANGE, listChange);
        addChild(list);

        scrollPane = new UIContainer();
        scrollPane.percentUnusedWidth = 100;
        scrollPane.percentUnusedHeight = 100;

        var painter:GradientFillPainter = new GradientFillPainter([0x222222, 0x111111]);
        painter.rotation = Math.PI/2;
        scrollPane.backgroundPainter = painter;
        scrollPane.skin = new AuroraContainerSkin();

        img = new Image();
        img.scaleToFit = true;
        scrollPane.addChild(img);
        addChild(scrollPane);
    }

    function listChange(e:ListEvent):Void {
        img.source = list.selectedItem.data;
        scrollPane.verticalScrollPosition = 0;
        scrollPane.horizontalScrollPosition = 0;
    }
}

