import com.cimians.openPyro.core.MeasurableControl;
import com.cimians.openPyro.painters.GradientFillPainter;
import com.cimians.openPyro.core.UIContainer;
import com.cimians.openPyro.core.UIControl;
import com.cimians.openPyro.aurora.AuroraContainerSkin;
import com.cimians.openPyro.aurora.AuroraButtonSkin;
import com.cimians.openPyro.layout.VLayout;
import com.cimians.openPyro.layout.HLayout;
import com.cimians.openPyro.core.Padding;
import com.cimians.openPyro.controls.Label;
import com.cimians.openPyro.controls.Spacer;
import com.cimians.openPyro.controls.Button;

import flash.display.Sprite;
import flash.text.TextFormat;
import flash.filters.DropShadowFilter;

class ImageBrowser extends Sprite{

    static function main(){
        var stage = flash.Lib.current.stage;
        stage.scaleMode = flash.display.StageScaleMode.NO_SCALE;
        stage.align = flash.display.StageAlign.LEFT;

        var bgPainter:GradientFillPainter = new GradientFillPainter([0, 0x333333]);
        bgPainter.cornerRadius = 10;
        bgPainter.rotation = Math.PI/2;

        var shell:UIContainer = new UIContainer();
        shell.backgroundPainter = bgPainter;
        shell.mwidth = 800;
        shell.mheight = 600;
        shell.skin = new AuroraContainerSkin();
        shell.layout = new VLayout(10);
        shell.padding = new Padding(5,5,5,5);
        stage.addChild(shell);

        var header:UIControl = new UIControl();
        header.percentUnusedWidth = 100;
        header.mheight = 25;

        var label:Label = new Label();
        label.mheight = 20;
        label.textFormat = new TextFormat("Arial", 14, 0x60A5D8, true);
        label.text = "Image Browser";
        header.addChild(label);

        // create fill for the img
        
        var painter:GradientFillPainter = new GradientFillPainter([0x222222, 0x000000]);
        painter.rotation = Math.PI/2;
        header.backgroundPainter = painter;
        shell.addChild(header);

        shell.x = 400;
        shell.y = 0;

        var photoModule:PhotoModule = new PhotoModule();
        photoModule.percentUnusedWidth = 100;
        photoModule.percentUnusedHeight = 100;
        shell.addChild(photoModule);

        var spacer:Spacer = new Spacer();
        spacer.percentWidth = 100;
        spacer.mheight = 20;
        shell.addChild(spacer);

//        shell.x = (stage.stageWidth-shell.mwidth)/2;
//        shell.y = (stage.stageHeight-shell.mheight)/2;
        shell.filters = [new DropShadowFilter(4, 90)]; 
    }
}
