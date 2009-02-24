
	import com.cimians.openPyro.core.UIContainer;
	import com.cimians.openPyro.layout.VLayout;
	
	import flash.display.Graphics;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;

	class SimpleRepeater extends Sprite {
		
		static function main() { 
            new SimpleRepeater();
		}
		
		
		var renderers:Array<Dynamic> ;
		var i:UInt ;
		var stringList:Array<String> ;
	
		public function new() {
            super();
    		renderers = [];
    		i = 0;
    		stringList = ["Lorem ipsum dolor sit amet, consectetuer " + 
						"adipiscing elit. Etiam lectus risus, semper varius," + 
						" imperdiet quis, sollicitudin nec, est. Cras in ipsum." + 
						" Mauris eu metus quis lorem aliquet blandit. Aliquam ",
						'hello World'];

            var s = flash.Lib.current.stage;
			s.scaleMode = flash.display.StageScaleMode.NO_SCALE;
			s.align = flash.display.StageAlign.TOP_LEFT;
			
			var bttn:Sprite = new Sprite();
			var gr:Graphics = bttn.graphics;
			gr.lineStyle(1, 0x333333);
			gr.beginFill(0xcccccc);
			gr.drawRect(0,0,100,40);
			gr.endFill();
			
			bttn.addEventListener(MouseEvent.MOUSE_DOWN, onBttnClick);
			addChild(bttn);
			bttn.x = 500;
			bttn.y = 100;
			
			var container:UIContainer = new UIContainer();
			container.mwidth = 300;
			container.mheight = 600;
			container.layout = new VLayout();
				
			addChild(container);
			
			for(i in 0...5){
				var renderer:Renderer = new Renderer();
				renderer.mwidth = 300;
				container.addChild(renderer);
				renderers.push(renderer);
			}
			
			var r:Renderer = renderers[0];
			r.addEventListener(Event.RESIZE, onResize);

            flash.Lib.current.stage.addChild(this);
		}
		
		function onResize(event:Event):Void{
			trace('renderer got resized to '+event.target.height);
		}
		
		public function onBttnClick(event:MouseEvent):Void{
			for (r in renderers){
				r.label = stringList[i];
				i++; 
				if(i == stringList.length){
					i=0;
				}
			}
		}
	}
