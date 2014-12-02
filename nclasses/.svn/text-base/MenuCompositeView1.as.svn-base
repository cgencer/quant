package classes
{
	import flash.events.*;
	import flash.display.*;
	import classes.interfaces.*;
	import caurina.transitions.Tweener;

	public class MenuCompositeView1 extends ICompositeView
	{
		private var no:uint;
		private var target:Sprite;
		private var subMenu:Array;
		private var subMenuC:Array;
		private var subMenuMC:Array;
		private var type:String;		
		private var h:uint;

		public function MenuCompositeView1(aModel:IWebModel, aController:MenuBrowseController, target:Sprite, type:String, n:uint ) {
			super(aModel, aController);
			this.type = type;
			
			this.no = n;
			this.target = target;
			makeMenu();
		}

		public function makeMenu():void {
			
			var mArray:Array = (model as WebModel).getMenu(type, 1, no);

			subMenu		= new Array();
			subMenuC	= new Array();
			subMenuMC	= new Array();
			h = 0;

			for(var i=0; i < mArray.length; i++)
			{
				var me:IComponentView = new MenuElementView1(model as WebModel);
				
				(me  as  MenuElementView1).setConstants( type, mArray[i].getName(), no, i, mArray[i].getColor(), mArray[i].getHilite(), mArray[i].getTemplate() );

				(me  as  MenuElementView1).y = (me as MenuElementView1).height * i;
				h += (me  as  MenuElementView1).height;

				var s:Sprite = new Sprite();
				s.x = 0;
				s.y = h;

				var m:Sprite = new Sprite();
				var a:Sprite = new Sprite();
				s.addChild(m);
				s.addChild(a);
				a.mask = m;

				s.x = -100;

				subMenuMC[i] = null;
				if(mArray[i].getTemplate() == "menu")
				{
					var mc:ICompositeView = new MenuCompositeView2((model as IWebModel), (controller as MenuBrowseController), a, type, no, i);
					subMenuMC[i] = mc;
				}
				subMenuC[i] = s;
				subMenu[i] = a;

				m.graphics.beginFill(0xFF0000, 0.5);
				m.graphics.drawRect(0, 0, a.width, a.height);
				a.y = -a.height;

				add(me);
				target.addChild(s);
				target.addChild(me);

				if(mArray[i].getTemplate() != undefined)
				{
					if(mArray[i].getTemplate() == "menu")
						me.addEventListener(MouseEvent.CLICK, (controller as MenuBrowseController).menuOver);
					else
						me.addEventListener(MouseEvent.CLICK, (controller as MenuBrowseController).menuClick);
				}
			}
		}

		public function updateView():uint{

			var d:DataMenu = (model as WebModel).getBrowseState(type);
			var i:int;
			var gap:uint = 0;
			
			for(i=0; i < subMenuMC.length; i++)
			{
				if(subMenuMC[i] != null)
					moveChild(i, gap, subMenuMC.length);

				if(no == d.getNo0() && i == d.getNo1() && d.getLevel() >= 1)
				{
					if(subMenuMC[i] != null){
						openSub(i, subMenuMC.length);
						gap += subMenuMC[i].getHeight();
					}
				}else{
					if(subMenuMC[i] != null)
						closeSub(i, subMenuMC.length);
				}
			}
			return gap;
		}		

		public function moveChild(no:uint, gap:uint, total:uint):void{
			var newy:int = (aChildren[no] as MenuElementView1).height*(aChildren[no] as MenuElementView1).getNo() + gap;
			Tweener.addTween(aChildren[no], {y:newy, time:1/total, transition:"linear"});
			Tweener.addTween(subMenuC[no], {y:newy + (aChildren[no] as MenuElementView1).height, time:1/total, transition:"linear"});
		}				

		public function openSub(no:uint, total:uint):void{
			Tweener.addTween(subMenu[no], {y:0, time:1/total, transition:"linear"});
		}

		public function closeSub(no:uint, total:uint):void{
			Tweener.addTween(subMenu[no], {y:-subMenuMC[no].getHeight(), time:1/total, transition:"linear"});
		}		

		public function getHeight():uint{
			return h;
		}

	}
}