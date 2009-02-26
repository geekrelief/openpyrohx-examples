package com.cimians.openPyroExamples;
	import com.cimians.openPyro.controls.events.ButtonEvent;
	import com.cimians.openPyro.core.UIControl;
	import com.cimians.openPyro.skins.ISkin;
	
	import flash.display.Graphics;
	import flash.events.Event;
	import flash.geom.Matrix;

	class SimpleButtonSkin extends UIControl, implements ISkin {
		
		public var selector(getSelector, null) : String;
		
		var _control:UIControl;
		var _cornerRadius:Float;
		
		var matrix:Matrix ;
        
		public function new(?cornerRadius:Float=5){
			super();
			this._cornerRadius = cornerRadius;
            matrix = new Matrix();
		}
		
		public override function setSkinnedControl(uic:UIControl):UIControl{
			_control = uic;
			_control.addChildAt(this, 0);
			_control.addEventListener(Event.RESIZE, onResize);	
			
			matrix.createGradientBox(_control.mwidth, _control.mheight, Math.PI/2);
			
			if(!Math.isNaN(_control.mwidth) && !Math.isNaN(_control.mheight)){
                var gr:Graphics = this.graphics;
                gr.lineStyle(1,0x777777);
                gr.beginGradientFill('linear',[0xdfdfdf, 0xffffff],[1,1],[0,255],matrix);
                gr.drawRoundRect(0,0,_control.width, _control.height,_cornerRadius,_cornerRadius);
                gr.endFill();	
			}	
			return uic;
		}
		
		function onResize(event:Event):Void{
			var gr:Graphics = this.graphics;
			matrix.createGradientBox(_control.mwidth, _control.mheight, Math.PI/2);
			gr.clear();
			gr.lineStyle(1,0x777777);
			gr.beginGradientFill('linear',[0xdfdfdf, 0xffffff],[1,1],[0,255],matrix);
			gr.drawRoundRect(0,0,_control.width, _control.height,_cornerRadius,_cornerRadius);
			gr.endFill();	
		}
		
		public function getSelector():String{
			return "SimpleButtonSkin";
		}
		
		public function changeState(fromState:String, toState:String):Void{
			var gr:Graphics = this.graphics;
			gr.clear();
			gr.lineStyle(1,0x777777);
			if(toState == ButtonEvent.UP){
				gr.beginGradientFill('linear',[0xdfdfdf, 0xffffff],[1,1],[0,255],matrix);
			}
			else if(toState == ButtonEvent.OVER){
				gr.beginGradientFill('linear',[0xffffff,0xdfdfdf],[1,1],[0,255],matrix);
			}
			else if(toState == ButtonEvent.DOWN){
				gr.lineStyle(2,0x56A0EA);
				gr.beginGradientFill('linear',[0xffffff,0xdfdfdf],[1,1],[0,255],matrix);
			}
			else{
				gr.beginGradientFill('linear',[0xdfdfdf, 0xffffff],[1,1],[0,255],matrix);
			}
			gr.drawRoundRect(0,0,_control.width, _control.height,_cornerRadius,_cornerRadius);
			gr.endFill();		
		}
	}
