package com.cimians.openPyroExamples;

	import com.cimians.openPyro.core.UIControl;
	import com.cimians.openPyro.skins.ISkin;
	
	import flash.display.Graphics;
	import flash.text.TextField;
	import flash.text.TextFormat;

	class DimensionMarkerSkin extends UIControl, implements ISkin {
		
		public var selector(getSelector, null) : String ;
		
		var _control:UIControl;
		
		var widthTxt:TextField;
		var heightTxt:TextField;
		
		public function new()
		{
            super();
			widthTxt = new TextField();
			widthTxt.autoSize = flash.text.TextFieldAutoSize.LEFT;
			widthTxt.defaultTextFormat = new TextFormat("Arial",11,0x00e0fb);
			
			heightTxt = new TextField();
			heightTxt.autoSize = flash.text.TextFieldAutoSize.LEFT;
			heightTxt.defaultTextFormat = new TextFormat("Arial",11,0x00e0fb);
			
			addChild(widthTxt);
			addChild(heightTxt);
			
			this.percentUnusedWidth = 100;
			this.percentUnusedHeight = 100;
		}

		public function getSelector():String
		{
			return null;
		}
		
		public override function setSkinnedControl(uic:UIControl):UIControl{
			this._control = uic;
			_control.addChild(this);
				
			return uic;
		}
		
		public override function validateSize():Void{
			//trace(this+ ' validate size called '+this.usesMeasurementStrategy)
			super.validateSize();
		}
	
		
		
		public override function updateDisplayList(unscaledWidth:Float, unscaledHeight:Float):Void{
			super.updateDisplayList(unscaledWidth, unscaledHeight);
			var gr:Graphics = this.graphics;
			gr.clear();
			gr.lineStyle(1,0x333333);
			gr.beginGradientFill(flash.display.GradientType.LINEAR,[0xffffff,0xdfdfdf],[1,1],[0,255]);
			gr.drawRect(0,0,unscaledWidth,unscaledHeight);
			gr.endFill();
			
			gr.lineStyle(1,0x00e0fb);
			gr.moveTo(2,10);
			gr.lineTo(unscaledWidth-4, 10);
			
			widthTxt.text = Math.isNaN(_control.explicitWidth)?_control.percentUnusedWidth+"%":_control.explicitWidth+"px";
			widthTxt.x = unscaledWidth/2;
			widthTxt.y = 12;
			
			
			gr.moveTo(10,2);
			gr.lineTo( 10, unscaledHeight-4);
			
			heightTxt.text = Math.isNaN(_control.explicitHeight)?_control.percentUnusedHeight+"%":_control.explicitHeight+"px";
			heightTxt.x = 12;
			heightTxt.y = unscaledHeight/2;
		}
		
	}
