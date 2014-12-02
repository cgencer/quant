package classes
{
	import flash.events.*;
	import flash.display.*;

	import caurina.transitions.Tweener;

	import classes.*;
	import classes.dataModels.*;
	import classes.baseElements.*;
	import classes.interfaces.*;

	public class v_MenuComposite0 extends ICompositeView
	{
		private var subMenu:Array;
		private var subMenuC:Array;
		private var subMenuMC:Array;
		private var type:String;
		private var target:Sprite;
		private var  h:int;

		public function v_MenuComposite0(aModel:IWebModel, aController:c_MenuBrowse, target:Sprite, type:String ) {
			super(aModel, aController);

			target.addChild(this);
			this.target = target;
			this.type = type;
			makeMenu();

		}

		public function makeMenu(event:Event=null):void {
			var mArray:Array = (model as m_MenuData).getMenu(type, 0);
			subMenu = new Array();
			subMenuC = new Array();
			subMenuMC = new Array();

			var currHeight = 0;
			for(var i=0; i < mArray.length; i++)
			{
				var me:IComponentView = new v_MenuElement0( i, (model as m_MenuData), (controller as c_MenuBrowse) );

				(me as v_MenuElement0).setConstants(
													type,
													mArray[i].getName(),
													mArray[i].getColor(),
													mArray[i].getHilite(),
													mArray[i].getTemplate(),
													i
													);
				me.y = currHeight;
				currHeight += me.height;

				var s:Sprite = new Sprite();
				s.x = 0;
				s.y = (me as v_MenuElement0).y + (me as v_MenuElement0).height;

				var m:Sprite = new Sprite();	// mask object
				var a:Sprite = new Sprite();

				s.addChild(m);
				s.addChild(a);
				a.mask = m;

				subMenuMC[i] = null;
				var mc;
				switch(mArray[i].getTemplate()){
					case 'menu':
						mc = new v_MenuComposite1((model as IWebModel), (controller as c_MenuBrowse), a, type, i);
						break;
					case 'news':
						mc = new v_NewsComposite((model as IWebModel), (controller as c_MenuBrowse), a, type, i);
						break;
				}				
				subMenuMC[i] = mc;		// alttakilerin mc'si
				subMenuC[i] = s;		// this > sprite objesi (mask + content)
				subMenu[i] = a;			// content objesi

				m.graphics.beginFill(0xFF0000);
				m.graphics.drawRect(-2000, 0, a.width+2000, a.height);
				a.y = -a.height;

				add(me);
				this.addChild(s);
				this.addChild(me);
				
				if(mArray[i].getTemplate() != undefined)
				{
					if(mArray[i].getTemplate() == "menu" || mArray[i].getTemplate() == "news")
						me.addEventListener(MouseEvent.CLICK, (controller as c_MenuBrowse).menuOver);
					else
						me.addEventListener(MouseEvent.CLICK, (controller as c_MenuBrowse).menuClick);						
				}
			}
		}

		public function updateView(event:Event=null):void {
			
			if(type != (model as m_MenuData).getMenuState())
				return;

			var d:md_MenuComposite = (model as m_MenuData).getBrowseState(type);
			var i:int;

			var gap:uint = 0;
			h = 0;

			for(i=0; i<aChildren.length; i++){
				aChildren[i].update();
			}

			for(i = 0; i < subMenuMC.length; i++)
			{
				moveChild(i, gap, subMenuMC.length);

				if(i != subMenuMC.length-1)						// last item doesn't need to move...
				{
					if(subMenuMC[i] != null){
						gap += subMenuMC[i].updateView();

						if(i == d.getNo0())
						{
							openSub(i, subMenuMC.length);
							gap += subMenuMC[i].getHeight();
						}else{
							closeSub(i, subMenuMC.length);
						}
					}
				}
			}
		}

		public function moveChild(no:uint, gap:uint, total:uint):void {
			Tweener.addTween(aChildren[no], {y: h + gap, time:1/total, transition:"linear"});
			Tweener.addTween(subMenuC[no], {y: h + gap + (aChildren[no] as v_MenuElement0).height, time:1/total, transition:"linear"});
			 h += (aChildren[no] as v_MenuElement0).height;
		}

		public function openSub(no:uint, total:uint):void {
			Tweener.addTween(subMenu[no], {y:0, time:1/total, transition:"linear"});
		}

		public function closeSub(no:uint, total:uint):void {
			Tweener.addTween(subMenu[no], {y:-subMenuMC[no].getHeight(), time:1/total, transition:"linear"});
		}

		public function getType():String {
			return type;
		}
		
		public function remakeMenu(event:Event=null):void {

			for(var i=0; i < subMenuC.length; i++)
			{
				this.removeChild(subMenuC[i]);
			}
			for( i=0; i < aChildren.length; i++)
			{
				this.removeChild(aChildren[i]);
			}
			aChildren = new Array();
			makeMenu();
		}

	}
}
