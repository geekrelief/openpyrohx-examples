import flash.display.Sprite;
import flash.display.Graphics;
import com.cimians.openPyro.core.UIControl;
import flash.text.TextField;

class Renderer extends UIControl{
	
	var txt:TextField;
	
	public function new(){
        super();
		txt = new TextField();
		txt.border=true;
		addChild(txt);
		txt.autoSize = flash.text.TextFieldAutoSize.LEFT;
		txt.wordWrap=true;
	}
	
	public function setLabel(s:String):String{
		this.txt.text = s;
		this.invalidateSize();
		return s;
	}
	
	public override function measure():Void{
		this.measuredHeight = this.txt.height+20;
		
		super.measure();
		//trace('[ ROOT set height ]'+_measuredHeight)
	}
	
	public override function updateDisplayList(unscaledWidth:Float, unscaledHeight:Float):Void{
		trace(this + " -> updateDisplayList ");
		super.updateDisplayList(unscaledWidth, unscaledHeight);
		
		txt.width = unscaledWidth-20;
		txt.x = 10;
		txt.y = 10;
		txt.height = 20;
		
		var gr:Graphics = this.graphics;
		gr.clear();
		gr.lineStyle(1, 0x333333);
		gr.beginFill(0xcccccc);
		gr.drawRect(0,0,unscaledWidth,unscaledHeight);
		gr.endFill();
	}
}
