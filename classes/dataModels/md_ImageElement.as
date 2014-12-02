package classes.dataModels
{	
	public class md_ImageElement
	{
		private var image_id:String;
		private var image_fname:String;
		private var image_thumb:String;
		private var image_desc:String;
		
		public function md_ImageElement () {
		}

		public function getId():String {
			return image_id;
		}
		public function getFName():String {
			return image_fname;
		}
		public function getThumb():String {
			return image_thumb;
		}
		public function getDesc():String {
			return image_desc;
		}
		public function setImgId(imgid:String):void {
			image_id = imgid;
		}
		public function setImgFname(fname:String):void {
			image_fname = fname;
		}
		public function setImgThumb(fname:String):void {
			image_thumb = fname;
		}
		public function setImgDesc(desc:String):void {
			image_desc = desc;
		}
	}
}