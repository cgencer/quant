package classes
{
	import flash.events.*;
	import flash.display.*;
	import flash.geom.Matrix;
	import flash.text.*;
 	import flash.net.URLRequest;
	import flash.system.fscommand;

	import caurina.transitions.Tweener;

	import classes.*;
	import classes.dataModels.*;
	import classes.baseElements.*;
	import classes.interfaces.*;
	
	public class v_Main extends ICompositeView {

		private var bg:Shape;
		private var layout:Shape;
		private var target:Sprite;
		private var menuS:Sprite;
		private var text0:TextField;
		private var text1:TextField;

		public function v_Main (aModel:IWebModel, aController:c_MenuBrowse, target:Sprite ) {
			super(aModel, aController);
			this.target = target;

			menuS = new Sprite();
			menuS.y = 50;
			addChild(menuS);

			var mc:ICompositeView = new v_MenuComposite0((model as m_MenuData), aController, menuS, 'main');
			(model as m_MenuData).addEventListener("MENU_UPDATE", (mc as v_MenuComposite0).updateView);
			target.addChild(this);

			target.stage.quality = StageQuality.BEST;
			target.stage.addEventListener(Event.RESIZE, stageResize);
 			target.stage.align = "TL";
  			target.stage.scaleMode = "noScale";
			stageResize();
		}

		private function stageResize(e:Event = null):void {
			this.x = (target.stage.stageWidth - 200);
			(model as m_MenuData).setMenuLeftMost( this.x-100 );		// -200 from right + 100 from left-opening menus
			(model as m_MenuData).setMenuX(target.stage.stageWidth - 200);
			(model as m_MenuData).setSSize(target.stage.stageWidth, target.stage.stageHeight);
		}

	}
}