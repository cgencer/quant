package classes
{
	import flash.geom.*;
	import flash.events.*;
	import flash.text.*;
	import flash.display.*;
	import flash.utils.getDefinitionByName;

	import classes.*;
	import classes.dataModels.*;
	import classes.baseElements.*;
	import classes.interfaces.*;

	public class v_MenuElement0 extends vb_MenuElement {

		private static var embeddedFont:Font = null;
		private var itemNo:uint;

		public function v_MenuElement0(newNo:uint, aModel:IWebModel, aController:Object=null) {

			super(aModel,aController);

			model = aModel;
			setNo(newNo);
			create();

			addEventListener(MouseEvent.CLICK, mouseClickH);
			addEventListener(MouseEvent.MOUSE_OVER, mouseOverH);
			addEventListener(MouseEvent.MOUSE_OUT, mouseOutH);

			this.update();
		}

		public function getState():md_MenuComposite{
			var d:md_MenuComposite = new md_MenuComposite();

			d.setLevel(0);
			d.setNo0(no);
			d.setNo1(0);
			d.setNo2(0);			
			return d;
		}

		public function setConstants(newType:String, newText:String, newColor:int, hiColor:int, newTemplate:String, newNo:uint):void {
			setType(newType);
			setColor(newColor, hiColor);
			setTemplate(newTemplate);
			itemNo = newNo;

			var embeddedFontClass:Class = getDefinitionByName('Helva45') as Class;
			Font.registerFont(embeddedFontClass);
			var embeddedFontsArray:Array = Font.enumerateFonts(false);
			embeddedFont = embeddedFontsArray[2];

			format = new TextFormat;
			format.font = embeddedFont.fontName;
			format.bold = true;
			format.size = 26;
			format.color = 0xffffff;

//			stripes.x += 580;
			stripes.x -= 50;

			textBox.defaultTextFormat = format;
			setText(newText);
			reLocate();
		}

		override public function update(event:Event=null):void {
			var sel_no = (model as m_MenuData).readSel0();
			if(sel_no == no){
				toggleOff();
			}else{
				toggleOn();
			}
		}

		public function mouseClickH(event:MouseEvent):void {
			(model as m_MenuData).setSelected(itemNo, null, null, null);
		}

		public function mouseOverH(event:MouseEvent):void {
			toggleOff();
		}

		public function mouseOutH(event:MouseEvent):void {
			toggleOn();
		}

	}
}