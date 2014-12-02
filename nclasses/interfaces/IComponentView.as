package classes.interfaces
{
	import flash.errors.IllegalOperationError;
	import flash.events.Event;
	import flash.display.Sprite;
	// ABSTRACT Class (should be subclassed and not instantiated)
	public class IComponentView extends Sprite 
	{
		protected var model:Object;
		protected var controller:Object;
		public function IComponentView(_model:Object, _controller:Object = null)
		{
			this.model = _model;
			this.controller = _controller;
		}
		public function add(c:IComponentView):void
		{
			throw new IllegalOperationError("add operation not supported");
		}
		public function remove(c:IComponentView):void
		{
			throw new IllegalOperationError("remove operation not supported");
		}
		public function getChild(n:int):IComponentView
		{
			throw new IllegalOperationError("getChild operation not supported");
			return null;
		}
		// ABSTRACT Method (must be overridden in a subclass)
		public function update(event:Event = null):void 
		{
		}
	}
}