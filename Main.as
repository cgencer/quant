﻿package {	import flash.display.*;	import flash.events.*;	import classes.*;	import classes.dataModels.*;	import classes.baseElements.*;	import classes.interfaces.*;		public class Main extends Sprite {		private var m1:IWebModel;		private var c1:IWebModel;		public var percent:int;				public function Main( ) {			m1 = new m_MenuData();			m1.addEventListener("XML_READY", create);		}			private function PL_LOADING(event:ProgressEvent) :void {			percent =event.bytesLoaded/event.bytesTotal*100;			dispatchEvent(new ProgressEvent("PROGRESS")); 		}		public function create(event:Event = null):void {			var dummy = new Sprite();			addChild(dummy);			(m1 as m_MenuData).setSSize(dummy.stage.stageWidth, dummy.stage.stageHeight);			var c1:c_MenuBrowse = new c_MenuBrowse(m1);			var Main:ICompositeView = new v_Main(m1, c1, this);		}	}}