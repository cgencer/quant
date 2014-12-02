package classes.baseElements
{
	import flash.geom.*;
	import flash.events.*;
	import flash.display.Sprite;
	import flash.text.*;
	import flash.text.TextFormat;
	import flash.display.DisplayObject;
	import flash.display.Graphics;
	import flash.display.Shape;
	import flash.text.TextFieldAutoSize;
	import flash.text.AntiAliasType;
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import caurina.transitions.Tweener;

	import classes.*;
	import classes.baseElements.*;
	import classes.interfaces.*;

	public class vb_NewsElement extends IComponentView
	{
		protected var type:String;
		protected var text:String;
		protected var desc:String;
		protected var date:String;
		protected var no:uint;
		protected var color0:int;
		protected var color1:int;
		protected var hilite:int;
		protected var textBox:TextField;
		protected var dateBox:TextField;
		protected var descBox:TextField;
		protected var hitextBox:TextField;
		protected var hArea:Shape;
		protected var format:TextFormat;
		protected var template:String;
		protected var stripes:Bitmap;

		private var elementlevel;
		private var w:uint = 600;
		private var h:uint = 20;

		public function vb_NewsElement (aModel:IWebModel, aController:Object=null) {
			super(aModel,aController);

			textBox = new TextField;
			dateBox = new TextField;
			descBox = new TextField;
			hitextBox = new TextField;
			hArea = new Shape;
			addChild(hArea);
			addChild(textBox);
			addChild(dateBox);
			addChild(descBox);
			addChild(hitextBox);
			this.update();
		}

		public function create():void {
			buttonMode = true;

			hArea.graphics.beginFill(0x555555,100);
			hArea.graphics.drawRect(0,0,10,50);
			hArea.graphics.endFill();
		}

		public function setType(newType:String):void {
			type = newType;
		}

		public function getType():String{
			return type;
		}

		public function setTemplate(newTemplate:String):void {
			template = newTemplate;
		}

		public function getTemplate():String {
			return template;
		}

		public function setText(newText:String, newDesc:String, newDate:String):void {
			text = newText;
			desc = newDesc;
			date = newDate;

			var myal = TextFormatAlign.LEFT;
			var myas = TextFieldAutoSize.LEFT;
			
			textBox.autoSize = myas;
			textBox.selectable = false;
			textBox.embedFonts = true;
			format.align = myal;
			textBox.defaultTextFormat = format;
			textBox.antiAliasType = AntiAliasType.ADVANCED;
			textBox.mouseEnabled = false;
			textBox.textColor = color0;
			textBox.multiline = false;			
			textBox.text = text;

			dateBox.y = textBox.y;
			dateBox.x = textBox.width;
			dateBox.autoSize = myas;
			dateBox.selectable = false;
			dateBox.embedFonts = true;
			format.align = myal;
			dateBox.defaultTextFormat = format;
			dateBox.antiAliasType = AntiAliasType.ADVANCED;
			dateBox.mouseEnabled = false;
			dateBox.textColor = color1;
			dateBox.multiline = false;			
			dateBox.text = ", " + date;

			descBox.y = textBox.height;
			descBox.autoSize = myas;
			descBox.selectable = false;
			descBox.embedFonts = true;
			format.align = myal;
			descBox.defaultTextFormat = format;
			descBox.antiAliasType = AntiAliasType.ADVANCED;
			descBox.mouseEnabled = false;
			descBox.textColor = color1;
			descBox.multiline = true;
			descBox.wordWrap = true;
			descBox.text = desc;
			descBox.width = 180;

			reSize();
		}

		public function getTitle():String{
			return text;
		}			

		public function setNo(newNo:uint):void {
			no = newNo;
		}

		public function getNo():uint {
			return no;
		}		

		public function setColor(newColor0:int, newColor1:int):void {
			color0 = newColor0;
			color1 = newColor1;
		}

		public function reSize():void {
			hArea.width = this.width;
			hArea.height = this.height;
		}

		public function reLocate():void{

		}

		override public function update(event:Event=null):void {
		}

	}
}