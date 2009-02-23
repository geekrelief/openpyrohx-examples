	import com.cimians.openPyro.aurora.AuroraScrollBarSkin;
	import com.cimians.openPyro.aurora.AuroraSliderSkin;
	import com.cimians.openPyro.controls.ScrollBar;
	import com.cimians.openPyro.controls.Slider;
	import com.cimians.openPyro.core.Direction;
	import com.cimians.openPyro.events.PyroEvent;
    /*
	import com.cimians.openPyroExamples.HaloTrackSkin;
	import com.cimians.openPyroExamples.SimpleButtonSkin;
    */
	
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	
	class TestSlider extends Sprite {
		
        static function main() {
            trace("resize the window");
            new TestSlider();
        }

        var s:flash.display.Stage;
		public function new() {
            super();
            s = flash.Lib.current.stage;
			s.scaleMode = flash.display.StageScaleMode.NO_SCALE;
			s.align = flash.display.StageAlign.TOP_LEFT;
			
			testScrollBarWithAuroraSkin();
			//testSliderWithAuroraSkin();
			s.addEventListener(Event.RESIZE, onResize);
		}
		
		function onResize(event:Event):Void
		{
			if(scrollBar != null)
			{
				scrollBar.mheight = s.stageHeight/3;
			}
			if(slider != null)
			{
				slider.mheight = s.stageHeight/3;
			}
		}
		
		var scrollBar:ScrollBar;
		function testScrollBarWithAuroraSkin():Void
		{
			scrollBar = new ScrollBar(Direction.VERTICAL);
			scrollBar.addEventListener(PyroEvent.UPDATE_COMPLETE, onScrollBarUpdate);
			scrollBar.x = 150;
			scrollBar.y = 100;
			
			scrollBar.mwidth = 15;
			scrollBar.mheight = s.stageHeight/3;
			s.addChild(scrollBar);
			
			var auroraScrollBarSkin:AuroraScrollBarSkin = new AuroraScrollBarSkin();
			auroraScrollBarSkin.direction = Direction.VERTICAL;
			scrollBar.skin = auroraScrollBarSkin;
		}
		
		function onScrollBarUpdate(event:PyroEvent):Void
		{
		}
		
		var slider:Slider;
        /*
		function testSliderWithAuroraSkin():Void
		{
			slider = new Slider(Direction.VERTICAL);
			addChild(slider);
			
			slider = new Slider(Direction.VERTICAL);
			slider.setSize(15, s.stageHeight/3);
			
			var sliderSkin:AuroraSliderSkin = new AuroraSliderSkin()
			
			slider.skin = sliderSkin
			slider.x = 50;
			slider.y = 100;
			addChild(slider);
			
			var hSlider:Slider = new Slider(Direction.HORIZONTAL);
			hSlider.width = 300
			hSlider.height = 15;
			
			var hSliderSkin:AuroraSliderSkin = new AuroraSliderSkin()
			hSliderSkin.trackGradientRotation = Math.PI/2
			
			hSlider.skin = hSliderSkin
			
			addChild(hSlider)
			hSlider.x = 100
			hSlider.y = 50;
			
			s.addEventListener(MouseEvent.CLICK, function():Void{
					
			})
			
			
		}
        */
		
		function testSliderWithExplicitSkins():Void
		{
				
			/*
			slider.thumbSkin = new SimpleButtonSkin();
			slider.addEventListener(SliderEvent.THUMB_DRAG, onThumbDrag)
			slider.trackSkin = new HaloTrackSkin();
			*/
		}
		
        /*
		function testScrollBarWithExplicitSkins():Void
		{
			
			var scrollBar:ScrollBar = new ScrollBar(Direction.VERTICAL);
			scrollBar.x = 100
			scrollBar.y = 100
			
			scrollBar.width = 15;
			scrollBar.height = 300;
			addChild(scrollBar);
			
			scrollBar.slider.trackSkin = new HaloTrackSkin()
			scrollBar.slider.thumbSkin = new SimpleButtonSkin()
			scrollBar.incrementButtonSkin = new SimpleButtonSkin()
			scrollBar.decrementButtonSkin = new SimpleButtonSkin();
			
		}
        */
		
		function onThumbDrag(event:Event):Void{
			//trace(this,'-->'+slider.value)
		}

	}
