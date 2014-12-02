package classes.interfaces
{
	import flash.events.IEventDispatcher;
	
	public interface IWebModel extends IEventDispatcher 
	{
		function updateMenu():void;
	}
}