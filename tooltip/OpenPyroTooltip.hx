 
	import com.cimians.openPyro.controls.Text;
	import com.cimians.openPyro.core.Padding;
	import com.cimians.openPyro.core.UIControl;
	import com.cimians.openPyro.painters.GradientFillPainter;
//	import com.cimians.openPyro.modifiers.tooltip.ToolTipModifierEnum;
    import flash.display.Sprite;

	class OpenPyroTooltip extends Sprite {
		var control:UIControl;
		var fp:GradientFillPainter ;
		var pad:Padding ;
		
	    static function main() { 
            new OpenPyroTooltip();
		}
		
		function new() {
            super();
    		fp = new GradientFillPainter([0xCC0000, 0x220000]);
    		pad = new Padding(5,20,5,20);

			var _bgSprite:Sprite = new Sprite();
			_bgSprite.graphics.lineStyle(0, 0x000000);
			_bgSprite.graphics.beginFill(0xCCCCCC, 1);						
			_bgSprite.graphics.drawRoundRect(0,0,100,20,10,10);
			_bgSprite.graphics.endFill();
			_bgSprite.visible = false;
			
			control = new UIControl();
			
            // currently the DefaultToolTipRenderer expects that data to be a String
			control.setToolTip(_bgSprite);//, Sprite, ToolTipModifierEnum.FADE);
			control.backgroundPainter = fp;
			control.backgroundPainter.draw(control.graphics,100,200);
			control.name = "red";
			control.mwidth = 100;
			control.mheight = 400;
			addChild(control);
			addChild(_bgSprite);
			fp.padding = pad;
			
            flash.Lib.current.stage.addChild(this);
		}
	}
