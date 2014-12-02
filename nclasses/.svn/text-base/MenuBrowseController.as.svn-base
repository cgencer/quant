package classes
{
	import flash.events.*;
	import flash.ui.*;
	import classes.interfaces.*;
	import classes.*;
	
	public class MenuBrowseController  
	{
		private var webmodel:IWebModel;

		public function MenuBrowseController(_model:IWebModel) {
			this.webmodel = _model;
		}

		public function menuClick(event:Event=null):void {
			var d = event.target.getState();

		}

		public function menuOver(event:Event=null):void {
			(webmodel as WebModel).setBrowseState(event.target.getType(), event.target.getState());
		}
		
	}
}