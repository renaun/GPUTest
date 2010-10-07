package
{
	import flash.display.Sprite;
	import flash.display.StageAlign;
	import flash.display.StageScaleMode;
	import flash.events.MouseEvent;
	
	public class GPUTest extends Sprite
	{

		private const squareCount:uint = 1;

		public function GPUTest()
		{
			super();
			this.stage.frameRate = 30;
			this.stage.scaleMode = StageScaleMode.NO_SCALE;
			this.stage.align = StageAlign.TOP_LEFT;
			this.stage.addEventListener(MouseEvent.CLICK, onClick);
		}
		
		private function onClick(e:MouseEvent):void
		{
			this.placeSquare(e.stageX, e.stageY);
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