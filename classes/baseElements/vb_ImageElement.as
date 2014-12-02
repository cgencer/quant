package classes.baseElements
{
	import flash.geom.*;
	import flash.events.*;
	import flash.display.Sprite;
	import flash.text.*;
	import flash.net.*;
	import fl.containers.UILoader;
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

	public class vb_ImageElement extends IComponentView
	{
		protected var type:String;
		protected var text:String;
		protected var desc:String;
		protected var no:uint;
		protected var img:Sprite;
		protected var format:TextFormat;
		protected var img_name:String;

		protected var mini_width:uint = 320;
		protected var mini_height:uint = 240;

		private var elementlevel;

		public function vb_ImageElement (aModel:IWebModel, aController:Object=null) {

			super(aModel,aController);

			img = new Sprite();
			addChild(img);

			this.update();
		}

		public function create():void {
		}

		public function loadImage(imgfile:String):void {
			var throbber:c_Throbber = new c_Throbber();
			img.addChild(throbber);

			if(imgfile != null){
				var l:UILoader = new UILoader();
				l.setSize(mini_width, mini_height);
				l.source = imgfile;
				l.addEventListener(ProgressEvent.PROGRESS, throbber.progressHandler);
				l.addEventListener(Event.COMPLETE, throbber.completeHandler);
				img.addChild(l);
			}
		}

		public function setNo(newNo:uint):void {
			no = newNo;
			img.x = no * 325;

		}

		public function getNo():uint {
			return no;
		}

		public function toggleOff():void {
			img.alpha = 30;
		}

		public function toggleOn():void {
			img.alpha = 100;
		}

		public function setType(newType:String):void {
			type = newType;
		}

		public function getType():String{
			return type;
		}
		
		override public function update(event:Event=null):void {
		}

	}
}