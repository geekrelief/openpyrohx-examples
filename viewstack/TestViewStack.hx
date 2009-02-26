

	import com.cimians.openPyro.aurora.AuroraContainerSkin;
	import com.cimians.openPyro.containers.SlidePane;
	import com.cimians.openPyro.containers.ViewStack;
	import com.cimians.openPyro.core.UIContainer;
	import com.cimians.openPyro.painters.FillPainter;
	
	import flash.display.Sprite;
	import flash.events.MouseEvent;

	class TestViewStack extends Sprite {

		var children:Array<Dynamic>;
        var viewStack:SlidePane ;
		var red:UIContainer;
        var blue:UIContainer;

		public function new() { 
			super();
    		children = [];
    		viewStack = new SlidePane();
    		red = new UIContainer();
    		blue = new UIContainer();
			testViewStack();
		}
		
		static function main() {
            var stage = flash.Lib.current.stage;
			stage.scaleMode = flash.display.StageScaleMode.NO_SCALE;
			stage.align = flash.display.StageAlign.TOP_LEFT;
		
            stage.addChild(new TestViewStack());	
		}
		
        function testViewStack():Void
		{
			viewStack.mwidth = 200;
			viewStack.mheight = 500;
			viewStack.x = viewStack.y = 10;
			viewStack.skin = new AuroraContainerSkin();
			viewStack.backgroundPainter = new FillPainter(0xcccccc);
			addChild(viewStack);
			
			red.backgroundPainter = new FillPainter(0xff0000);
			red.mwidth = 300;
			red.mheight = 400;
			red.name = "red";
			viewStack.addChild(red);
			
			children.push(red);
			
			blue.backgroundPainter = new FillPainter(0x0000ff);
			blue.mwidth = 150;
			blue.mheight = 300;
			blue.name = "blue";
			viewStack.addChild(blue);
			
			children.push(blue);
			
			flash.Lib.current.stage.addEventListener(MouseEvent.CLICK, onStageClick);
		}
		
		function onStageClick(event:MouseEvent):Void
		{
			if(viewStack.selectedChild == red){
				viewStack.selectedChild = blue;
			}
			else
			{
				viewStack.selectedChild = red;
			}
		}
		
	}
