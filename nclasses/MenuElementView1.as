package classes{
	import flash.geom.*;
	import flash.events.*;
	import classes.interfaces.*;
	import classes.*;

	import flash.display.Sprite;
	import flash.display.DisplayObject;
	import flash.display.Graphics;
	import flash.display.Shape;
	import flash.text.Font;
	import flash.text.AntiAliasType;
	import flash.text.TextField;
	import flash.text.TextFormat;
	import flash.text.TextFieldAutoSize;
	import flash.utils.getDefinitionByName;

	public class MenuElementView1 extends BaseMenuElement {
		
		private var parent0:uint;
		private static var embeddedFont:Font = null;
		private var itemNo:uint;

		public function MenuElementView1(aModel:IWebModel,aController:Object=null) {
			super(aModel,aController);

			var embeddedFontClass:Class = getDefinitionByName('HarryB') as Class;
			Font.registerFont(embeddedFontClass);
			var embeddedFontsArray:Array = Font.enumerateFonts(false);
			embeddedFont = embeddedFontsArray[0];

			format = new TextFormat;
			format.font = embeddedFont.fontName;
			format.bold = true;
			format.size = 10;
			format.color = 0xffffff;

			create();
			addEventListener(MouseEvent.CLICK, mouseClickH);
			addEventListener(MouseEvent.MOUSE_OVER, mouseOverH);
			addEventListener(MouseEvent.MOUSE_OUT, mouseOutH);
			this.update();
		}

		public function getState():DataMenu{
			var d:DataMenu = new DataMenu();
			
			d.setLevel(1);
			d.setNo0(parent0);
			d.setNo1(no);
			return d;
		}

		public function setConstants(newType:String, newText:String, newParent:uint, newNo:uint, newColor:int, hiColor:int, newTemp:String):void {
			setType(newType);
			setColor(newColor, hiColor);
			setText(newText);
			setParent(newParent);
			setNo(newNo);
			itemNo = newNo;
			reLocate();
			setTemplate(newTemp);
		}

		public function setParent (newParent:uint):void {
			parent0 = newParent;
		}

		override public  function update(event:Event=null):void {
			var sel_no = (model as WebModel).readSel1();
			if(sel_no+1 == no){
				toggleOff();
			}else{
				toggleOn();
			}
		}

		public function mouseClickH(event:MouseEvent):void {
			(model as WebModel).setSelected(null, itemNo, null, null);
		}

		public function mouseOverH(event:MouseEvent):void {
			toggleOff();
		}

		public function mouseOutH(event:MouseEvent):void {
			toggleOn();
		}

	}
}