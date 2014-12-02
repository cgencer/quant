package classes
{
	import flash.events.*;
	import flash.display.*;

	import caurina.transitions.Tweener;

	import classes.*;
	import classes.dataModels.*;
	import classes.baseElements.*;
	import classes.interfaces.*;

	public class v_MenuComposite2 extends ICompositeView
	{
		private var type:String;
		private var no0:uint;
		private var no1:uint;
		private var subMenu:Array;
		private var subMenuC:Array;
		private var subMenuMC:Array;
		private var target:Sprite;
		private var currHeight:uint;
		private var h:uint;

		public function v_MenuComposite2(aModel:IWebModel, aController:c_MenuBrowse, target:Sprite, type:String, n0:uint, n1:uint )
		{
			super(aModel, aController);
			this.type = type;
			
			this.no0 = n0;
			this.no1 = n1;
			this.target = target;
			makeMenu();
		}

		public function makeMenu():void{
			
			var mArray:Array = (model as m_MenuData).getMenu(type, 2, no0, no1);

			subMenu = new Array();
			subMenuC = new Array();
			subMenuMC = new Array();

			currHeight = 0;
			for(var i=0; i < mArray.length; i++)
			{
				var me:IComponentView = new v_MenuElement2 (model as m_MenuData);

				(me as v_MenuElement2).setConstants(
													mArray[i].getType(),
													mArray[i].getName(),
													no0, no1, i,
													mArray[i].getColor(),
													mArray[i].getHilite(),
													mArray[i].getTemplate()
													);
				me.y = currHeight;
				currHeight += me.height;

				var s:Sprite = new Sprite();
				s.x = 0;
				s.y = (me as v_MenuElement2).y + (me as v_MenuElement2).height;

				var m:Sprite = new Sprite();
				var a:Sprite = new Sprite();
				s.addChild(m);
				s.addChild(a);
				a.mask = m;

				var mc = null;
				if(mArray[i].getTemplate() == "gallery"){
//					var maske:Sprite = new Sprite();
//					maske.graphics.beginFill(0xFF0000);
//					maske.graphics.drawRect(-1024, 0, 2048, a.height);

					mc = new v_GalleryComposite ((model as IWebModel), (controller as c_GalleryBrowse), a, type, no0, no1, i);
				}
				subMenuMC[i] = mc;
				subMenuC[i] = s;
				subMenu[i] = a;

				m.graphics.beginFill(0xFF0000);
				m.graphics.drawRect(-1024, 0, 2048, a.height);
				a.y = -a.height;

				add(me);
				target.addChild(s);
				target.addChild(me);

				if(mArray[i].getTemplate() != undefined)
				{
					if( mArray[i].getTemplate() == "gallery" )
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

			for(i=0; i < subMenuMC.length; i++)
			{
				if(subMenuMC[i] != null){
					gap += subMenuMC[i].updateView();
					moveChild(i, gap, subMenuMC.length);


					if(no0 == d.getNo0() && no1 == d.getNo1() && i == d.getNo2() && d.getLevel() >= 2)
					{
trace("no0 IS: "+no0+" and getNo0() IS: "+d.getNo0());
trace("no1 IS: "+no1+" and getNo1() IS: "+d.getNo1());
trace("no2 IS: "+i+" and getNo2() IS: "+d.getNo2());
trace("getLevel() IS: "+d.getLevel());

						openSub(i, subMenuMC.length);
						gap += subMenuMC[i].getHeight();
					}else{
						closeSub(i, subMenuMC.length);
					}
				}
			}
			return h;
		}

		public function moveChild(no:uint, gap:uint, total:uint):void {
			var newy:int = (aChildren[no] as v_MenuElement2).height * (aChildren[no] as v_MenuElement2).getNo() + gap;
			Tweener.addTween(aChildren[no], {y:newy, time:1/total, transition:"linear"});
			Tweener.addTween(subMenuC[no], {y:newy + (aChildren[no] as v_MenuElement2).height, time:1/total, transition:"linear"});
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