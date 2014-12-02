package classes
{
	import flash.events.*;
	import flash.display.*;

	import caurina.transitions.Tweener;

	import classes.*;
	import classes.dataModels.*;
	import classes.baseElements.*;
	import classes.interfaces.*;

	public class v_MenuComposite1 extends ICompositeView
	{
		private var no:uint;
		private var target:Sprite;
		private var subMenu:Array;
		private var subMenuC:Array;
		private var subMenuMC:Array;
		private var type:String;		
		private var currHeight:uint;

		public function v_MenuComposite1(aModel:IWebModel, aController:c_MenuBrowse, target:Sprite, type:String, n:uint ) {
			super(aModel, aController);
			this.type = type;
			
			this.no = n;
			this.target = target;
			makeMenu();
		}

		public function makeMenu():void {
			
			var mArray:Array = (model as m_MenuData).getMenu(type, 1, no);

			subMenu		= new Array();
			subMenuC	= new Array();
			subMenuMC	= new Array();
			currHeight = 0;

			for(var i=0; i < mArray.length; i++)
			{
				var me:IComponentView = new v_MenuElement1(model as m_MenuData);

				(me as v_MenuElement1).setConstants(
													type,
													mArray[i].getName(),
													no, i,
													mArray[i].getColor(),
													mArray[i].getHilite(),
													mArray[i].getTemplate()
													);
				me.y = me.height * i;
				currHeight += me.height;
				
				var s:Sprite = new Sprite();
				s.x = -100;
				s.y = (me as v_MenuElement1).y + (me as v_MenuElement1).height;

				var m:Sprite = new Sprite();
				var a:Sprite = new Sprite();
				s.addChild(m);
				s.addChild(a);
				a.mask = m;

				var mc = null;
				if(mArray[i].getTemplate() == "menu"){
					mc = new v_MenuComposite2((model as IWebModel), (controller as c_MenuBrowse), a, type, no, i);
				}
				subMenuMC[i] = mc;
				subMenuC[i] = s;
				subMenu[i] = a;

				m.graphics.beginFill(0xFF0000, 0.5);
				m.graphics.drawRect(-1024, 0, 2048, a.height);
				a.y = -a.height;

				add(me);
				target.addChild(s);
				target.addChild(me);

				if(mArray[i].getTemplate() != undefined)
				{
					if(mArray[i].getTemplate() == "menu")
						me.addEventListener(MouseEvent.CLICK, (controller as c_MenuBrowse).menuOver);
					else
						me.addEventListener(MouseEvent.CLICK, (controller as c_MenuBrowse).menuClick);
				}
			}
		}

		public function updateView():uint{

			var d:md_MenuComposite = (model as m_MenuData).getBrowseState(type);
			var i:int;
			var gap:uint = 0;
			
			for(i=0; i<aChildren.length; i++){
				aChildren[i].update();
			}
			
			for(i=0; i < subMenuMC.length; i++)
			{
				if(subMenuMC[i] != null)
				{
					gap += subMenuMC[i].updateView();
					moveChild(i, gap, subMenuMC.length);

					if(no == d.getNo0() && i == d.getNo1() && d.getLevel() >= 1)
					{
						openSub(i, subMenuMC.length);
						gap += subMenuMC[i].getHeight();
					}else{
						closeSub(i, subMenuMC.length);
					}
				}
			}
			return gap;
		}		

		public function moveChild(no:uint, gap:uint, total:uint):void {
			var newy:int = (aChildren[no] as v_MenuElement1).height * (aChildren[no] as v_MenuElement1).getNo() + gap;
			Tweener.addTween(aChildren[no], {y:newy, time:1/total, transition:"linear"});
			Tweener.addTween(subMenuC[no], {y:newy + (aChildren[no] as v_MenuElement1).height, time:1/total, transition:"linear"});
		}				

		public function openSub(no:uint, total:uint):void {
			Tweener.addTween(subMenu[no], {y:0, time:1/total, transition:"linear"});
		}

		public function closeSub(no:uint, total:uint):void {
			Tweener.addTween(subMenu[no], {y:-subMenuMC[no].getHeight(), time:1/total, transition:"linear"});
		}		

		public function getHeight():uint {
			return currHeight;
		}

	}
}