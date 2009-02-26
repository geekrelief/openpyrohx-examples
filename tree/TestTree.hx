	import com.cimians.openPyro.controls.Tree;
	import com.cimians.openPyro.controls.events.ListEvent;
	import com.cimians.openPyro.events.PyroEvent;
	
	import flash.display.Sprite;

	class TestTree extends Sprite {
		
		var tree:Tree;

		static function main() { 
            var s = flash.Lib.current.stage;

			s.scaleMode = flash.display.StageScaleMode.NO_SCALE;
			s.align = flash.display.StageAlign.TOP_LEFT;
            s.addChild(new TestTree());	
        }

		public function new() {
            super();
			createTree();
		}
		
		function createTree():Void{
			tree = new Tree();
			tree.mwidth = 200;
			tree.mheight = 600;
			
			tree.y = 10;
			tree.x = 300;
			tree.addEventListener(PyroEvent.CREATION_COMPLETE, onTreeCreationComplete);
			addChild(tree);
		}
		
		public function onTreeCreationComplete(event:PyroEvent):Void{
			tree.addEventListener(ListEvent.ITEM_CLICK, onTreeItemClick);
			tree.dataProvider = Xml.parse("<node label=\"rootNode\">" +
									"<leaf label=\"leaf1\">value1</leaf>"+
									"<leaf label=\"leaf2\">value1</leaf>"+
									"<leaf label=\"leaf3\">"+
										"<leaf label=\"leaf3_1\">"+
											"<leaf label=\"leaf3_2\">"+
											"</leaf>"+
										"</leaf>"+
									"</leaf>"+
								"</node>");
		}
		
		function onTreeItemClick(event:ListEvent):Void{
			//trace("tree>> "+tree.selectedItem);
		}
		
	}
