package
{
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.geom.Matrix;
	
	public class Square extends Sprite
	{
		private var scaleFactor:Number;

		public function Square(size:uint)
		{
			super();
			this.draw(size);
			this.addEventListener(Event.ADDED_TO_STAGE, onAdded);
			this.addEventListener(Event.REMOVED_FROM_STAGE, onRemoved);
		}
		
		private function draw(size:uint):void
		{
			this.graphics.beginFill(0xff0000);
			this.graphics.drawRect((size/2)*-1, (size/2)*-1, size, size);
			this.graphics.endFill();
			this.cacheAsBitmap = true;
			this.cacheAsBitmapMatrix = new Matrix();
		}
		
		private function onAdded(e:Event):void
		{
			this.addEventListener(Event.ENTER_FRAME, animate);
		}

		private function onRemoved(e:Event):void
		{
			this.removeEventListener(Event.ADDED_TO_STAGE, onAdded);
			this.removeEventListener(Event.REMOVED_FROM_STAGE, onRemoved);
			this.removeEventListener(Event.ENTER_FRAME, animate);
		}
		
		private function animate(e:Event):void
		{
			if (this.scaleX <= 0.09)
			{
				this.scaleFactor = 1.01
			}
			if (this.scaleX >=1)
			{
				this.scaleFactor = .99;
			}
			this.rotation += 5;
			this.scaleX *= scaleFactor;
			this.scaleY *= scaleFactor;
			//this.alpha = this.scaleX;
		}
	}
}