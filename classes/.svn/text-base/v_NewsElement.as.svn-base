package classes
{
	import flash.geom.*;
	import flash.events.*;
	import flash.text.*;
	import flash.display.Sprite;
	import flash.display.DisplayObject;
	import flash.display.Graphics;
	import flash.display.Shape;
	import flash.utils.getDefinitionByName;

	import classes.*;
	import classes.dataModels.*;
	import classes.interfaces.*;
	import classes.baseElements.*;	

	public class v_NewsElement extends vb_NewsElement {
		
		private var parent0:uint;
		private static var embeddedFont:Font = null;
		private var itemNo:uint;

		public function v_NewsElement(aModel:IWebModel, aController:Object=null) {
			super(aModel,aController);

/* init font */
			var embeddedFontClass:Class = getDefinitionByName('HarryB') as Class;
			Font.registerFont(embeddedFontClass);
			var embeddedFontsArray:Array = Font.enumerateFonts(false);
			embeddedFont = embeddedFontsArray[0];

			format = new TextFormat;
			format.font = embeddedFont.fontName;
			format.bold = true;
			format.size = 10;
			format.color = 0xffffff;

//			graphics.beginFill(0x00FF00);
//			graphics.drawRect(0, 0, 200, 100);

			create();
			this.update();
		}

		public function getState():md_MenuComposite{
			var d:md_MenuComposite = new md_MenuComposite();

			d.setLevel(1);
			d.setNo0(parent0);
			d.setNo1(no);
			return d;
		}

		public function setConstants(newType:String, newText:String, newDesc:String, newDate:String, titleColor:int, descColor:int):void {
			setType(newType);
			setColor(titleColor, descColor);
			setText(newText, newDesc, newDate);
			reLocate();
		}

		public function setParent (newParent:uint):void {
			parent0 = newParent;
		}

	}
}