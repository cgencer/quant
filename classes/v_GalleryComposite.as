package classes
{
	import flash.events.*;
	import flash.display.*;

	import caurina.transitions.Tweener;

	import classes.*;
	import classes.dataModels.*;
	import classes.interfaces.*;
	import classes.baseElements.*;	

	public class v_GalleryComposite extends ICompositeView
	{
		private var no:uint;
		private var target:Sprite;
		private var subMenu:Array;
		private var subMenuC:Array;
		private var subMenuMC:Array;
		private var type:String;
		private var h:uint = 240;
		private var no0:uint;
		private var no1:uint;
		private var no2:uint;
		public var mo:Sprite;
		public var to:Sprite;
		public var so:Sprite;
		private var currHeight:uint;

		public function v_GalleryComposite (aModel:IWebModel, aController:c_GalleryBrowse, target:Sprite, type:String, nr0, nr1, nr2 ) {
			super(aModel, aController);
			this.type = type;

			this.no = nr2;
			this.no0 = nr0;
			this.no1 = nr1;
			this.no2 = nr2;
			this.target = target;
			makeMenu();
		}

		public function makeMenu():void {
			var mArray:Array = (model as m_MenuData).getMenu('gallery', 3, no0, no1, no2);

			so = new Sprite();
			to = new Sprite();
			mo = new Sprite();
			so.addChild(mo);
			so.addChild(to);
			to.mask = mo;
			target.addChild(so);
//			so.x -=100;
			if( mArray.length * 325 > (model as m_MenuData).getSWidth() ){
				// scrollable
			}

			mo.graphics.beginFill(0xFF0000);
			mo.graphics.drawRect(-300, 0, (model as m_MenuData).getSWidth()+100, h);

			for(var mi=0; mi<mArray.length;mi++){
//				trace(mArray[mi].getFName());
			}

			subMenu		= new Array();
			subMenuC	= new Array();
			subMenuMC	= new Array();
			currHeight = 0;
			
			trace("GALLERY "+no0+"."+no1+"."+no2+"."+" HAS: "+mArray.length+" ENTRIES");

			for(var i = 0; i<mArray.length; i++){

				var me:IComponentView = new v_GalleryElement(model as m_MenuData);
				(me as v_GalleryElement).setConstants(
														type, no0, no1, no2, i,
														mArray[i].getId(),
														mArray[i].getFName(),
														mArray[i].getThumb(),
														mArray[i].getDesc()
														);
				me.x = -(model as m_MenuData).getSWidth() + 300;
				me.y = currHeight;
				currHeight += (me as v_GalleryElement).height;

				var s:Sprite = new Sprite();
				s.x = 0;
				s.y = (me as v_GalleryElement).y + (me as v_GalleryElement).height;

				var m:Sprite = new Sprite();
				var a:Sprite = new Sprite();
				s.addChild(m);
				s.addChild(a);
				a.mask = m;

				var mc = null;
				subMenuMC[i] = mc;			// alttakilerin mc'si
				subMenuC[i] = s;			// this > sprite objesi (mask + content)
				subMenu[i] = a;				// content objesi (incl sub objects)

				m.graphics.beginFill(0xFF0000);
				m.graphics.drawRect(0, 0, 320, 240);
				a.y = -a.height;

				add(me);
				to.addChild(s);
				to.addChild(me);

			}
		}

		public function updateView():uint {

			var d:md_MenuComposite = (model as m_MenuData).getBrowseState(type);
			var gap:uint = 0;

			moveChild(gap);

			if(no0 == d.getNo0() && no1 == d.getNo1() && no2 == d.getNo2() && d.getLevel() >= 3)
			{
				trace(".......hain......");
				openSub();
				gap = h;
			}else{
				closeSub();
				gap = 0;
			}
			return gap;
		}

		public function moveChild(gap:uint):void{
			var newy:int = (aChildren[0] as v_GalleryElement).height * (aChildren[0] as v_GalleryElement).getNo() + gap;
			Tweener.addTween(aChildren[0], {y:newy, time:1, transition:"linear"});
			Tweener.addTween(subMenuC[0], {y:newy + (aChildren[0] as v_GalleryElement).height, time:1, transition:"linear"});
		}

		public function openSub():void{
			Tweener.addTween(subMenu[0], {y:0, time:1, transition:"linear"});
		}

		public function closeSub():void{
			Tweener.addTween(subMenu[0], {y:-h, time:1, transition:"linear"});
		}

		public function getHeight():uint{
			return h;
			trace("H IS: "+h);
		}

	}
}