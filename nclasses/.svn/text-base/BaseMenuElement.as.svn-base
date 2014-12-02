package classes{
	import flash.geom.*;
	import flash.events.*;
	import classes.interfaces.*;
	import classes.*;

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

	public class BaseMenuElement extends IComponentView {
		protected var type:String;
		protected var text:String;
		protected var no:uint;
		protected var color:int;
		protected var hilite:int;
		protected var textBox:TextField;
		protected var hitextBox:TextField;
		protected var hArea:Shape;
		protected var stripeMask:Shape;
		protected var format:TextFormat;
		protected var template:String;
		protected var stripes:Bitmap;

		private var elementlevel;
		private var w:uint = 600;
		private var h:uint = 20;

		public function BaseMenuElement(aModel:IWebModel, aController:Object=null) {
			super(aModel,aController);

			var bmd:BitmapData = new BitmapData(w, h, false, 0x555555);

			for (var i:uint = 0; i < w; i++) {
				if(i%3==0){
					for (var j:uint = 0; j < h; j+=3) {
					    bmd.setPixel(i, j, 0xcccccc);
					}
				}		
			}

			stripes = new Bitmap(bmd);
			addChild(stripes);
			stripes.x = -400;
			stripes.y = 2;
			stripeMask = new Shape;
			addChild(stripeMask);
			stripeMask.graphics.beginFill(0x000000,100);
			stripeMask.graphics.drawRect(200,0,600,25);
			stripeMask.graphics.endFill();
			stripes.mask = stripeMask;

			textBox = new TextField;
			hitextBox = new TextField;
			hArea = new Shape;
			addChild(hArea);
			addChild(textBox);
			addChild(hitextBox);
			this.update();
		}

		public function create():void {
			buttonMode = true;

			hArea.graphics.beginFill(0x555555,100);
			hArea.graphics.drawRect(0,0,10,20);
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

		public function setText(newText:String, aligner:String='left'):void {
			text = newText;
			
			var myal = aligner=='left' ? TextFormatAlign.LEFT : TextFormatAlign.RIGHT;
			var myas = aligner=='left' ? TextFieldAutoSize.LEFT: TextFieldAutoSize.RIGHT;
			
			// second layer of text for hiliting
			hitextBox.autoSize = myas;
			hitextBox.selectable = false;
			hitextBox.embedFonts = true;
			format.align = myal;
			hitextBox.defaultTextFormat = format;
			hitextBox.antiAliasType = AntiAliasType.ADVANCED;
			hitextBox.mouseEnabled = false;
			hitextBox.textColor = hilite;

			hitextBox.multiline = false;			
			hitextBox.text = text;

			textBox.autoSize = myas;
			textBox.selectable = false;
			textBox.embedFonts = true;
			format.align = myal;
			textBox.defaultTextFormat = format;
			textBox.antiAliasType = AntiAliasType.ADVANCED;
			textBox.mouseEnabled = false;
			textBox.textColor = color;
			textBox.multiline = false;			
			textBox.text = text;

			toggleOn();
			reSize();
		}

		public function getText():String{
			return text;
		}			

		public function setNo(newNo:uint):void {
			no=newNo;
		}

		public function getNo():uint {
			return no;
		}		

		public function setColor(newColor:int, hiliteColor:int):void {
			color = newColor;
			hilite = hiliteColor;
		}

		public function reSize():void {
			hArea.width = this.width;
			hArea.height = this.height;
		}

		public function reLocate():void{

		}

		public function hiliteState():Boolean {
			if(hitextBox.visible)
				return true;
			else
				return false;
		}

		public function toggleOff():void {
			hitextBox.visible = true;
			textBox.visible = false;
			Tweener.addTween(stripeMask, {x:-600, time:0.5, transition:"linear"});
		}

		public function toggleOn():void {
			hitextBox.visible = false;
			textBox.visible = true;
			Tweener.addTween(stripeMask, {x:0, time:0.5, transition:"linear"});
		}

		public function setELevel(l:uint):void {
			elementlevel = l;
		}

		override public function update(event:Event=null):void {
		}

	}
}