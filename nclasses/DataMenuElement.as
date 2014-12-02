package classes{
	public class DataMenuElement {
		private var name:String;
		private var type:String;
		private var color:String;
		private var hilite:String;
		private var template:String;

		public function DataMenuElement(n:String, t:String, c:String, hi:String, te:String) {
			name = n;
			type = t;
			color = c;
			hilite = hi;
			template = te;
		}

		public function getName():String {
			return name;
		}

		public function getType():String {
			return type;
		}

		public function getHilite():String {
			return hilite;
		}

		public function getColor():String {
			return color;
		}
		
		public function getTemplate():String {
			return template;
		}		

	}
}