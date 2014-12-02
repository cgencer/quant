package classes
{
	import flash.events.*;
	import flash.ui.*;

	import classes.*;
	import classes.dataModels.*;
	import classes.baseElements.*;
	import classes.interfaces.*;
	
	public class c_GalleryBrowse
	{
		private var webmodel:IWebModel;

		public function c_GalleryBrowse(_model:IWebModel) {
			this.webmodel = _model;
		}

		public function menuClick(event:Event=null):void {
			var d = event.target.getState();
		}

		public function menuOver(event:Event=null):void {
			(webmodel as m_MenuData).setBrowseState(event.target.getType(), event.target.getState());
		}
		
	}
}