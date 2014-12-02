package classes
{
	import flash.display.MovieClip;
	import flash.utils.Timer;
	import flash.events.*;
	import flash.display.*;
	import fl.containers.UILoader;
	import caurina.transitions.Tweener;
   // import flash.display.Sprite;

	public class c_Throbber extends MovieClip {
 
		private var _leafSize:Number = 2;
		private var _cycleSpeed:Number = 2150;
		private var _color:Number = 0x808080;
		private var _leafCount:Number = 100;
		private var _trailCount:Number = 1;
		private var _circleRadius:Number = 17;
		private var _startLeaf:Number = 1;
		private var _padding:Number = 20;
		private var throbber:MovieClip;
		private var leafNodeItr:Number = 1;
		private var interval;
 		private var throbber_mc:MovieClip;
		private var myTimer:Timer;
		private var offsetLeafCnt:Number;
 
		public function c_Throbber ()
		{
			throbber = new MovieClip();
			throbber.x = 0;
			throbber.y = 0;

			this.addChild(throbber);
		}

		public function progressHandler (event:ProgressEvent)
		{
			throbber.graphics.clear();

			var uiLdr:UILoader = event.currentTarget as UILoader;

			for (var i=this._startLeaf; i < Math.round(uiLdr.percentLoaded); i++) 
			{
				//trace("number of children " + this.throbber.dinky.numChildren);
				drawLeaf(i);
			}
		}

		public function drawLeaf (i)
		{
			offsetLeafCnt = i - this._startLeaf + 1;
			
			//throbber["leaf" + offsetLeafCnt] = new MovieClip();

			var dinky:Sprite = new MovieClip();
			dinky.alpha = 0.45;
			var child:Shape = new Shape();

			//this.drawLeafStub(dinky, (Math.cos((i * (360 / this._leafCount)) * (3.14/180)) * this._circleRadius), (Math.sin((i * (360 / this._leafCount)) * (3.14/180)) * this._circleRadius));
			this.drawLeafCircle(dinky, (Math.cos((i * (360 / this._leafCount)) * (3.14/180)) * this._circleRadius), (Math.sin((i * (360 / this._leafCount)) * (3.14/180)) * this._circleRadius));

			//this.throbber.createEmptyMovieClip("leaf" + offsetLeafCnt, this.throbber.getNextHighestDepth());
			this.throbber.addChild(dinky);
		}

		public function drawEachleaf(event:TimerEvent=null)
		{
			var offsetMilliseconds = new Date().getMilliseconds();
			var i:Number  = myTimer.currentCount;
			offsetLeafCnt = i - this._startLeaf + 1;
			
			//throbber["leaf" + offsetLeafCnt] = new MovieClip();
			
			var dinky:Sprite = new MovieClip();
			dinky.alpha = 0.45;
			var child:Shape = new Shape();
			 
			//this.drawLeafStub(dinky, (Math.cos((i * (360 / this._leafCount)) * (3.14/180)) * this._circleRadius), (Math.sin((i * (360 / this._leafCount)) * (3.14/180)) * this._circleRadius));
			this.drawLeafCircle(dinky, (Math.cos((i * (360 / this._leafCount)) * (3.14/180)) * this._circleRadius), (Math.sin((i * (360 / this._leafCount)) * (3.14/180)) * this._circleRadius));
			
			//this.throbber.createEmptyMovieClip("leaf" + offsetLeafCnt, this.throbber.getNextHighestDepth());
			this.throbber.addChild(dinky);
		}

		public function drawLeafCircle (child:Sprite, x:Number, y:Number)
		{
			var w = this._leafSize;
			var h = this._leafSize;
			// center the circle
			w /= 2; h /= 2;
			x += w; y += h;
			var xc1 = w*(Math.SQRT2-1), xc2 = w*(Math.SQRT2/2);
			var yc1 = h*(Math.SQRT2-1), yc2 = h*(Math.SQRT2/2);
			child.graphics.lineStyle(0, this._color, 0.7);
			child.graphics.beginFill(this._color);
			child.graphics.moveTo(x+w, y);
			child.graphics.curveTo(x+w, y+yc1, x+xc2, y+yc2);
			child.graphics.curveTo(x+xc1, y+h, x, y+h);
			child.graphics.curveTo(x-xc1, y+h, x-xc2, y+yc2);
			child.graphics.curveTo(x-w, y+yc1, x-w, y);
			child.graphics.curveTo(x-w, y-yc1, x-xc2, y-yc2);
			child.graphics.curveTo(x-xc1, y-h, x, y-h);
			child.graphics.curveTo(x+xc1, y-h, x+xc2, y-yc2);
			child.graphics.curveTo(x+w, y-yc1, x+w, y);
			child.graphics.endFill();
		}
 
		public function completeHandler (event:Event)
		{
			if(event.target.buttonMode==true)
				Tweener.addTween(event.target, {alpha:0.6, time:1, transition:"easeOutQuint"  });
			else
				Tweener.addTween(event.target, {alpha:1, time:1, transition:"easeOutQuint"  });

			throbber.graphics.clear();
			//myTimer.stop();
			this.removeChild(this.throbber);
		}
	}
}