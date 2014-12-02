package classes.interfaces
{
	import flash.events.Event;
	// ABSTRACT Class (should be subclassed and not instantiated)
	public class ICompositeView extends IComponentView
	{
		protected var aChildren:Array;
		public function ICompositeView(_model:Object,_controller:Object = null)
		{
			super(_model, _controller);
			this.aChildren = new Array( );
		}
		override public function add(c:IComponentView):void
		{
			aChildren.push(c);
		}
		override public function update(event:Event = null):void
		{
			for each (var c:IComponentView in aChildren)
			{
				c.update(event);
			}
		}
	}
}