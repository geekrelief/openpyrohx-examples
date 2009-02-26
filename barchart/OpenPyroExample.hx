	import com.cimians.openPyro.charts.VBarChart;
	//import Import_com_cimians_openPyro_controls;
	import Import_com_cimians_openPyro_core;
	import Import_com_cimians_openPyro_layout;
	import com.cimians.openPyroExamples.DimensionMarkerSkin;
	
	import flash.display.Sprite;
	import flash.events.Event;

	class OpenPyroExample extends Sprite {
		
		var overall:UIContainer;
		var container:UIContainer;
		var red:UIControl;
		var blue:UIControl;

		public function new() {
            super();
        }
		
		static function main() {
            var stage = flash.Lib.current.stage;
			stage.scaleMode = flash.display.StageScaleMode.NO_SCALE;
			stage.align = flash.display.StageAlign.TOP_LEFT;

            var t = new OpenPyroExample();
            stage.addChild(t);
			t.testCompositeLayout();
		}
		
		function testCompositeLayout():Void{
			var a:VBarChart;
			
			stage.addEventListener(Event.RESIZE, onStageResize);
			//stage.addEventListener(MouseEvent.MOUSE_DOWN,onStageClick)
			overall = new UIContainer();
			overall.name = "overall";
			overall.setSize(stage.stageWidth/2,stage.stageHeight/2);
			overall.x = overall.y = 10;
			
			addChild(overall);
			overall.layout = new HLayout(0);
			
			
			red = new UIControl();
			red.skin = new DimensionMarkerSkin();
			red.name = "red";
			red.percentUnusedHeight=100;
			red.mwidth = 100;
			overall.addChild(red);
			
			
			container = new UIContainer();
			container.name = "inner_container_1";
			container.setSize("100%","100%");
			container.layout = new VLayout();
			
			overall.addChild(container);
			
			
			var green:UIControl = new UIControl();
			green.skin = new DimensionMarkerSkin();
			green.name = "green";
			green.percentUnusedWidth = 100;
			green.percentUnusedHeight = 20;
			container.addChild(green);
			
			
			blue = new UIControl();
			blue.skin = new DimensionMarkerSkin();
			blue.name = "blue";
			blue.percentUnusedWidth = 100;
			blue.percentUnusedHeight = 20;
			container.addChild(blue);
			
			var c3:UIContainer = new UIContainer();
			c3.name = "container_3";
			c3.layout = new HLayout();
			c3.percentUnusedWidth = 100;
			c3.percentUnusedHeight = 60;
			
			container.addChild(c3);
			
			var white:UIControl = new UIControl();
			white.skin = new DimensionMarkerSkin();
			white.name="white";
			white.mwidth = 100;
			white.percentUnusedHeight=100;
			c3.addChild(white);
			
			var c4:UIContainer = new UIContainer();
			c4.name = "c4";
			c4.layout = new VLayout();
			c4.percentUnusedWidth = 100;
			c4.percentUnusedHeight = 100;
			c3.addChild(c4);
			
			var black:UIControl = new UIControl();
			black.skin = new DimensionMarkerSkin();
			black.name = "black";
			black.percentUnusedWidth=100;
			black.mheight = 50;
			c4.addChild(black);
			
			var greyish:UIControl = new UIControl();
			greyish.skin = new DimensionMarkerSkin();
			greyish.percentUnusedWidth = 100;
			greyish.percentUnusedHeight = 100;
			c4.addChild(greyish);
		}

		function onStageResize(event:Event):Void{
			overall.setSize(stage.stageWidth/2,stage.stageHeight/2);
		}
	}
	
	
