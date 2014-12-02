package classes{
	import flash.events.*;
	import flash.display.*;
	import flash.geom.Matrix;
	import flash.text.*;
 	import flash.net.URLRequest;
	import flash.system.fscommand;
	import classes.interfaces.*;
	import caurina.transitions.Tweener;
	
	public class MainView extends ICompositeView {

		private var bg:Shape;
		private var layout:Shape;
		private var target:Sprite;
		private var menuS:Sprite;
		private var text0:TextField;
		private var text1:TextField;
		private var loginbutton:Sprite;	
		private var text6:TextField;	
		private var text7:TextField;	
		private var text8:TextField;	
		private var ldr:Loader;
		private var banner:Loader;

		public function MainView(aModel:IWebModel, aController:MenuBrowseController, target:Sprite ) {
			super(aModel, aController);
			this.target = target;

			bg = new Shape();
			bg.graphics.beginFill(0x555555);
			bg.graphics.drawRect(0,0,600,400);
			target.addChild(bg);

			menuS = new Sprite();
			menuS.x = 400;
			menuS.y = 50;
			addChild(menuS);

			var mc:ICompositeView = new MenuCompositeView0((model as WebModel), aController, menuS, "main");
			(model as WebModel).addEventListener("MENU_UPDATE", (mc as MenuCompositeView0).updateView);
			target.addChild(this);

			target.stage.quality = StageQuality.BEST;
			target.stage.addEventListener(Event.RESIZE, stageResizeEvent);
  			target.stage.align = "TL";
    		target.stage.scaleMode = "noScale";
			stageResize();	
		}

		private function stageResizeEvent(e:Event):void {
			trace("RESIZE IS CALLED");
			stageResize();
		}

		private function stageResize():void {
			var newX=(target.stage.stageWidth - 985)/2
			if(newX<0)newX=0;
			this.x=newX;

			if(target.stage.stageHeight > 650)
			{
				var newY=(target.stage.stageHeight - 650)/2
				this.y=newY;
			}else{
				newY=target.stage.stageHeight-650;
				if(newY<0)newY=0;
				this.y=newY;
			}
		}

	}
}