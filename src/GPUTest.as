package
{
	import flash.desktop.NativeApplication;
	import flash.display.DisplayObject;
	import flash.display.Sprite;
	import flash.display.StageAlign;
	import flash.display.StageScaleMode;
	import flash.events.Event;
	import flash.events.MouseEvent;
	
	public class GPUTest extends Sprite
	{

		private const squareCount:uint = 1;

		public function GPUTest()
		{
			super();
			this.stage.frameRate = 50;
			this.stage.scaleMode = StageScaleMode.NO_SCALE;
			this.stage.align = StageAlign.TOP_LEFT;
			this.stage.addEventListener(MouseEvent.CLICK, onClick);
			this.addEventListener(Event.DEACTIVATE, onDeactivate);
		}
		
		private function onClick(e:MouseEvent):void
		{
			this.placeSquare(e.stageX, e.stageY);
		}
		
		private function onDeactivate(e:Event):void
		{
			if (this.numChildren == 0) return;
			do
			{
				this.removeChildAt(0);
			}
			while (this.numChildren > 0);
		}
		
		public function placeSquare(x:uint, y:uint):void
		{
			var s:Square = new Square(this.stage.stageWidth / 2);
			s.x = x;
			s.y = y;
			this.addChild(s);
		}
	}
}