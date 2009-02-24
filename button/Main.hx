import com.cimians.openPyro.core.UIContainer;
import com.cimians.openPyro.core.UIControl;
import com.cimians.openPyro.layout.VLayout;
import com.cimians.openPyro.painters.GradientFillPainter;
import com.cimians.openPyro.aurora.AuroraContainerSkin;
import com.cimians.openPyro.aurora.AuroraButtonSkin;
import com.cimians.openPyro.core.Padding;
import com.cimians.openPyro.controls.Button;

import flash.events.MouseEvent;

class Main {

    static function main(){
        var stage = flash.Lib.current.stage;
        stage.scaleMode = flash.display.StageScaleMode.NO_SCALE;
        stage.align = flash.display.StageAlign.LEFT;

        var bgPainter:GradientFillPainter = new GradientFillPainter([0, 0x333333]);
        bgPainter.cornerRadius = 10;
        bgPainter.rotation = Math.PI/2;

        var shell:UIContainer = new UIContainer();
        shell.backgroundPainter = bgPainter;
        shell.x = 300;
        shell.y = 0;
        shell.mwidth = 400;
        shell.mheight = 300;
        shell.skin = new AuroraContainerSkin();
        shell.layout = new VLayout(10);
        shell.padding = new Padding(5,5,5,5);
        stage.addChild(shell);

        var btn = new Button();
        btn.label = "  CLICK ME  ";
        btn.skin = new AuroraButtonSkin();
//        btn.mwidth = 75;
        btn.mheight = 25;
        shell.addChild(btn);

        btn.addEventListener(MouseEvent.MOUSE_UP, function(e:MouseEvent){ trace("click"); });
    }
}
