package classes{
	import flash.events.*;
	import flash.events.IEventDispatcher;
	import flash.xml.XMLDocument;
	import flash.xml.XMLNode;
	import flash.xml.XMLNodeType;
	import flash.net.URLLoader;
	import flash.net.URLRequest;
	import classes.interfaces.*;
	import classes.*;

	public class WebModel extends EventDispatcher implements IWebModel {
		private var xmlloader:URLLoader;
		private var xmlCont:XML;
		private var xDoc:XMLDocument;
		
		// shows the menu state
		private var menuState:String;
		private var lastNode:uint;
		
		// used when browsing the menu
		private var browseMain:DataMenu;
		private var browseSub:DataMenu;
		
		private var XMLFILESIZE:uint = 444387;
		public var percent:uint;
		private var newsList:Array;
		private var newsCurrent:uint;

		private var sel_no0:uint;
		private var sel_no1:uint;
		private var sel_no2:uint;
		private var sel_no3:uint;

		public function WebModel( ) {
			browseMain = new DataMenu();
			browseSub = new DataMenu();
			lastNode = 0;

			menuState = "main";
			loadXML("site.xml");
		}

		private function loadXML(file:String):void {
			xmlloader = new URLLoader;
			xmlloader.addEventListener(Event.COMPLETE, onXmlComplete);
			xmlloader.addEventListener(ProgressEvent.PROGRESS, progressHandler);
			var request:URLRequest=new URLRequest(file);
			try {
				xmlloader.load(request);
			} catch (error:Error) {
				trace("xml not loaded");
			}
		}

		private function progressHandler(event:ProgressEvent):void {
			percent = (event.bytesLoaded / XMLFILESIZE ) * 100;
			dispatchEvent(new ProgressEvent("PROGRESS")); 
        }
		
		private function onXmlComplete(e:Event):void {
			try {
				xmlCont = new XML(e.target.data);
				trace('XML ok');
			} catch (e:TypeError) {
				//tf.text = "Error in xml";
			}
			xDoc = new XMLDocument;
			xDoc.ignoreWhite=true;
			xDoc.parseXML(xmlCont.toXMLString());

			dispatchEvent(new Event("XML_READY"));
		}

		public function updateMenu( ):void {
			dispatchEvent(new Event("MENU_UPDATE"));
		}

		public function getMenu(type:String, level:uint, no0=null, no1=null, no2=null):Array {

			var leaf;
			var base;
			var colorSet:Array = new Array("0xa4a4a4", "0x6c9000", "0xa4ffa4", "0xa4a4ff");
			var colorHilite:String = "0x99cc00";
			var menuList:Array = new Array();

			base = xDoc.firstChild.childNodes;
			if(level == 0){
				leaf = base;
			}else if(level == 1){
				leaf = base[no0].childNodes;
			}else if(level == 2){
				leaf = base[no0].childNodes[no1].childNodes;
			}else if(level == 3){
				leaf = base[no0].childNodes[no1].childNodes[no2].childNodes;
			}

			for(var i=0; i < leaf.length; i++)
			{
				var m:DataMenuElement = new DataMenuElement(leaf[i].attributes.name, type, colorSet[level], colorHilite, leaf[i].attributes.template);
				menuList.push(m);
			}
			return menuList;
		}

		public function getMenuState():String {
			return menuState;
		}

		public function setBrowseState(type:String, d:DataMenu) {

			if(type == "main"){
				browseMain = d;
			}else{
				browseSub = d;
			}
			menuState = type;
			updateMenu( );
		}
		
		public function getBrowseState(type:String):DataMenu {
			if(type == "main"){
				return browseMain;
			}else{
				return browseSub;
			}
		}
		
		public function setSelected(no0=null, no1=null, no2=null, no3=null):void {
			trace(no0 + " : " + no1 + " : " + no2 + " : " + no3)
			if(no0 != null)
				sel_no0 = no0;
			if(no1 != null)
				sel_no1 = no1;
			if(no2 != null)
				sel_no2 = no2;
			if(no3 != null)
				sel_no3 = no3;
		}
		
		public function readSel0(){return sel_no0;}
		public function readSel1(){return sel_no1;}
		public function readSel2(){return sel_no2;}
		public function readSel3(){return sel_no3;}

	}
}