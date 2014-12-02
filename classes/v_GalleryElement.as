package classes
{
	import flash.geom.*;
	import flash.events.*;
	import flash.display.Sprite;
	import flash.display.DisplayObject;
	import flash.display.Graphics;
	import flash.display.Shape;

	import classes.*;
	import classes.dataModels.*;
	import classes.interfaces.*;
	import classes.baseElements.*;	

	public class v_GalleryElement extends vb_ImageElement
	{	
		private var parent0:uint;
		private var parent1:uint;
		private var parent2:uint;
		private var itemNo:uint;
		private var image_id:String;
		private var image_fname:String;
		private var image_thumb:String;
		private var image_desc:String;

		public function v_GalleryElement (aModel:IWebModel, aController:Object=null) {
			super(aModel,aController);

			create();
			addEventListener(MouseEvent.CLICK, mouseClickH);
			addEventListener(MouseEvent.MOUSE_OVER, mouseOverH);
			addEventListener(MouseEvent.MOUSE_OUT, mouseOutH);
			this.update();
		}

		public function getState():md_ImageElement{
			var d:md_ImageElement = new md_ImageElement();
			d.setImgId(image_id);
			d.setImgFname(image_fname);
			d.setImgDesc(image_desc);

			return d;
		}

		public function setConstants(
										newType:String,
										nr0:uint, nr1:uint, nr2:uint, nr3:uint,
										img_id:String,
										img_fname:String,
										img_thumb:String,
										img_desc:String
										):void {
										
			setType(newType);
			parent0	= nr0;
			parent1	= nr1;
			parent2	= nr2;
			itemNo	= nr3;
			image_id	= img_id;
			image_fname	= img_fname;
			image_thumb	= img_thumb;
			image_desc	= img_desc;
			setNo(nr3);
			loadImage(img_fname);
		}

		public function mouseClickH(event:MouseEvent):void {
//			(model as m_MenuData).setSelected(null, null, null, itemNo);
		}

		public function mouseOverH(event:MouseEvent):void {
			toggleOff();
		}

		public function mouseOutH(event:MouseEvent):void {
			toggleOn();
		}
	}
}
