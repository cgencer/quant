package classes
{
	import flash.events.*;
	import flash.display.*;
	import classes.interfaces.*;
	import classes.*;
	import caurina.transitions.Tweener;

	public class MenuCompositeNews extends ICompositeView
	{
		private var subMenu:Array;
		private var subMenuC:Array;
		private var subMenuMC:Array;
		private var type:String;
		private var target:Sprite;
		private var newy:int;
		
		public function MenuCompositeNews (aModel:IWebModel, aController:MenuBrowseController, target:Sprite, type:String ) {
			super(aModel, aController);
			target.addChild(this);
			this.target = target;
			this.type = type;
			makeMenu();
		}

		public function makeMenu(event:Event=null):void {
			var mArray:Array = (model as WebModel).getMenu(type, 0);
			subMenu = new Array();
			subMenuC = new Array();
			subMenuMC = new Array();

			var currHeight = 0;
			for(var i=0; i < mArray.length; i++)
			{
				var me:IComponentView = new MenuElementView0( i, (model as WebModel) );

				(me as MenuElementView0).setConstants( type, mArray[i].getName(), mArray[i].getColor(), mArray[i].getHilite(), mArray[i].getTemplate() );

				me.y = currHeight;
				currHeight += me.height;
				
				var s:Sprite = new Sprite();
				s.x = 0;
				s.y = (me  as  MenuElementView0).y + (me  as  MenuElementView0).height;

				var m:Sprite = new Sprite();
				var a:Sprite = new Sprite();

				s.addChild(m);
				s.addChild(a);
				a.mask = m;

				subMenuMC[i] = null;
				if(mArray[i].getTemplate() == "menu")
				{
					var mc:ICompositeView = new MenuCompositeView1((model as IWebModel), (controller as MenuBrowseController), a, type, i);
					subMenuMC[i] = mc;
				}
				subMenuC[i] = s;
				subMenu[i] = a;

				m.graphics.beginFill(0xFF0000);
				m.graphics.drawRect(0, 0, a.width, a.height);

				add(me);
				this.addChild(s);
				this.addChild(me);
				
				if(mArray[i].getTemplate() != undefined)
				{
					if(mArray[i].getTemplate() == "menu")
						me.addEventListener(MouseEvent.CLICK, (controller  as  MenuBrowseController).menuOver);
					else
						me.addEventListener(MouseEvent.CLICK, (controller  as  MenuBrowseController).menuClick);						
				}
			}
		}

		public function updateView(event:Event=null):void {
			
			if(type != (model as WebModel).getMenuState())
				return;

			var d:DataMenu = (model as WebModel).getBrowseState(type);
			var i:int;

			var gap:uint = 0;
			newy = 0;

			for(i = 0; i < subMenuMC.length; i++)
			{
				moveChild(i, gap);

				if(i != 3)
				{
					if(subMenuMC[i] != null)
						gap += subMenuMC[i].updateView();

					if(i == d.getNo0())
					{
						if(subMenuMC[i] != null){
							openSub(i);
							gap += subMenuMC[i].getHeight();
						}
					}else{
						if(subMenuMC[i] != null)
							closeSub(i);
					}
				}
			}
		}

		public function moveChild(no:uint, gap:uint):void {
			Tweener.addTween(aChildren[no], {y:newy + gap, time:0.5, transition:"linear"});
			Tweener.addTween(subMenuC[no], {y:newy + gap + (aChildren[no] as MenuElementView0).height, time:0.5, transition:"linear"});
			newy+=(aChildren[no] as MenuElementView0).height;
		}

		public function openSub(no:uint):void {
			// menüler, total time/menü adedine bağlı olarak açıldığından farklı item adedi, farklı hızlarda açılmaya sebep oluyor
			// ya da: çok item olduğunda hareket mesafesi daha fazla olacağından daha hızlı açılıyor, az itemda daha yavaş açılıyor. 
			Tweener.addTween(subMenu[no], {y:0, time:0.5, transition:"linear"});
		}

		public function closeSub(no:uint):void {
			Tweener.addTween(subMenu[no], {y:-subMenuMC[no].getHeight(), time:0.5, transition:"linear"});
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
