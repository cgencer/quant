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

	public class MenuElementImage extends BaseMenuElement {

		private static var embeddedFont:Font = null;

		public function MenuElementImage (newNo:uint, aModel:IWebModel, aController:Object=null) {
			super(aModel,aController);

			setNo(newNo);
			create();
			this.update();
		}

		public function getState():DataMenu{
			var d:DataMenu=new DataMenu();

			d.setLevel(0);
			d.setNo0(no);
			d.setNo1(0);
			d.setNo2(0);			
			return d;
		}

		public function setConstants(newType:String, newText:String, newColor:int, newTemplate:String):void {
			setType(newType);
			setColor(newColor);
			setTemplate(newTemplate);

			var embeddedFontClass:Class = getDefinitionByName('Helva45') as Class;
			Font.registerFont(embeddedFontClass);
			var embeddedFontsArray:Array = Font.enumerateFonts(false);
			embeddedFont = embeddedFontsArray[2];

			format = new TextFormat;
			format.font = embeddedFont.fontName;
			format.bold = true;
			format.size = 26;
			format.color = 0xffffff;

			textBox.defaultTextFormat = format;
			setText(newText);
			reLocate();
		}

		override public function update(event:Event=null):void {

		}

	}
}