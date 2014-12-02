package classes
{
	import flash.events.*;
	import flash.display.*;
	import classes.interfaces.*;

	public class MenuCompositeView2 extends ICompositeView
	{
		private var type:String;
		private var no0:uint;
		private var no1:uint;
		private var target:Sprite;
		private var currHeight:uint;

		public function MenuCompositeView2(aModel:IWebModel, aController:MenuBrowseController, target:Sprite, type:String, n0:uint, n1:uint )
		{
			super(aModel, aController);
			this.type=type;
			
			this.no0 = n0;
			this.no1 = n1;
			this.target = target;
			makeMenu();
		}

		public function makeMenu():void{
			
			var mArray:Array = (model  as  WebModel).getMenu(type, 2, no0, no1);
			
			currHeight = 0;
			for(var i=0; i < mArray.length; i++)
			{
				var me:IComponentView = new MenuElementView2(model as WebModel);

				(me  as  MenuElementView2).setConstants( mArray[i].getType(), mArray[i].getName(), no0, no1, i, mArray[i].getColor(), mArray[i].getHilite(), mArray[i].getTemplate() );

				me.y = currHeight;
				currHeight += (me as MenuElementView2).height;
				add(me);
				target.addChild(me);

				if(mArray[i].getTemplate() != "menu")
					me.addEventListener(MouseEvent.CLICK, (controller as MenuBrowseController).menuClick);	
			}
		}

		public function getHeight():uint{
			return currHeight;
		}

	}
}