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

	public class v_MenuElement2 extends vb_MenuElement {

		private var parent0:uint;
		private var parent1:uint;
		private static var embeddedFont:Font = null;
		private var itemNo:uint;

		public function v_MenuElement2(aModel:IWebModel, aController:Object=null) {
			super(aModel, aController);

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

		public function setConstants(newType:String, newText:String, newParent0:uint, newParent1:uint, newNo:uint, newColor:int, hiColor:int, newTemp:String):void {
			setType(newType);
			setColor(newColor, hiColor);
			setText(newText, 'right');
			setParent(newParent0, newParent1);
			setNo(newNo);
			itemNo = newNo;
			reLocate();
			setTemplate(newTemp);
		}

		public function setParent (newParent0:uint, newParent1:uint):void {
			parent0 = newParent0;
			parent1 = newParent1;
		}		

		public function getState():md_MenuComposite{
			var d:md_MenuComposite = new md_MenuComposite();

			d.setLevel(2);
			d.setNo0(parent0);
			d.setNo1(parent1);
			d.setNo2(itemNo);
			return d;
		}		

		override public function update(event:Event=null):void {
			var sel_no = (model as m_MenuData).readSel2();
			if(sel_no+1 == itemNo){
				toggleOff();
			}else{
				toggleOn();
			}
		}

		public function mouseClickH(event:MouseEvent):void {
			(model as m_MenuData).setSelected(null, null, itemNo, null);
			trace('clicked '+itemNo);
		}

		public function mouseOverH(event:MouseEvent):void {
			toggleOff();
		}

		public function mouseOutH(event:MouseEvent):void {
			toggleOn();
		}

	}
}