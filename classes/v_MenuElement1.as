package classes
{
	import flash.geom.*;
	import flash.events.*;
	import flash.text.*;
	import flash.display.*;
	import flash.utils.getDefinitionByName;

	import classes.*;
	import classes.dataModels.*;
	import classes.interfaces.*;
	import classes.baseElements.*;	

	public class v_MenuElement1 extends vb_MenuElement {

		private var parent0:uint;
		private static var embeddedFont:Font = null;
		private var itemNo:uint;

		public function v_MenuElement1(aModel:IWebModel, aController:Object=null) {

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

			stripeMask.height = 4;
			stripeMask.y += 4;

			create();
			addEventListener(MouseEvent.CLICK, mouseClickH);
			addEventListener(MouseEvent.MOUSE_OVER, mouseOverH);
			addEventListener(MouseEvent.MOUSE_OUT, mouseOutH);
			this.update();
		}

		public function getState():md_MenuComposite{
			var d:md_MenuComposite = new md_MenuComposite();
			
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
			setTemplate(newTemp);
			reLocate();
		}

		public function setParent (newParent:uint):void {
			parent0 = newParent;
		}

		override public function update(event:Event=null):void {
			var sel_no = (model as m_MenuData).readSel1();
			if(sel_no+1 == no){
				toggleOff();
			}else{
				toggleOn();
			}
		}

		public function mouseClickH(event:MouseEvent):void {
			(model as m_MenuData).setSelected(null, itemNo, null, null);
		}

		public function mouseOverH(event:MouseEvent):void {
			toggleOff();
		}

		public function mouseOutH(event:MouseEvent):void {
			toggleOn();
		}

	}
}