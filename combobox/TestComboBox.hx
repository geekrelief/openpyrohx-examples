	import com.cimians.openPyro.aurora.AuroraComboBoxSkin;
	import com.cimians.openPyro.aurora.AuroraContainerSkin;
	import com.cimians.openPyro.controls.ComboBox;
	import com.cimians.openPyro.controls.List;
	import com.cimians.openPyro.controls.listClasses.DefaultListRenderer;
	import com.cimians.openPyro.core.ClassFactory;
	import com.cimians.openPyro.layout.VLayout;
	
	import flash.display.Sprite;
	import flash.filters.DropShadowFilter;

	class TestComboBox extends Sprite {
		static function main() { new TestComboBox(); }
		
		public function new () {
            super();
            var s = flash.Lib.current.stage;

			s.scaleMode = flash.display.StageScaleMode.NO_SCALE;
			s.align = flash.display.StageAlign.TOP_LEFT;
			
            s.addChild(this);

			testCB();
			
		}
		
        /*
		var _list:List;
		function testBasicList():Void
		{
			_list = new List()
			_list.skin = new AuroraContainerSkin()
			_list.layout = new VLayout(-1);
			var renderers:ClassFactory = new ClassFactory(DefaultListRenderer)
			renderers.properties = {percentWidth:100, height:25}
			_list.itemRenderer = renderers;
			_list.filters = [new DropShadowFilter(2,90, 0, .5,2,2)];
			addChildAt(_list,0);
			_list.width = 100;
			//_list.height = 200;
			_list.dataProvider = ["one","two","three","four"];
			
			_list.x = _list.y = 10
			
			
		}
        */
		
		function testCB():Void
		{
			var comboBox:ComboBox = new ComboBox();
			comboBox.mwidth = 200;
			comboBox.mheight = 25;
			comboBox.skin = new AuroraComboBoxSkin();
			comboBox.x = comboBox.y = 50;
			comboBox.dataProvider = ["one","two","three","four","one","two","three","four","one","two","three","four"];
			addChild(comboBox);
		}
		
	}
