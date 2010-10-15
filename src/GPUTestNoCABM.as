package
{
	import flash.desktop.NativeApplication;
	import flash.display.DisplayObject;
	import flash.display.Sprite;
	import flash.display.StageAlign;
	import flash.display.StageScaleMode;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.text.TextField;
	
	public class GPUTestNoCABM extends Sprite
	{

		private const squareCount:uint = 1;
		private var frameCount:int = 0;
		private var FRAME_TEST_MAX:int = 500;
		private var startTime:Number;

		public function GPUTestNoCABM()
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
			startTime = (new Date()).getTime();
			frameCount = 0;
			this.addEventListener(Event.ENTER_FRAME, statsHandler);
			// Create ten of these
			for (var i:int = 0; i < 10; i++)
				this.placeSquare(stage.stageWidth*i/10, stage.stageHeight/2);
		}
		
		private function statsHandler(event:Event):void
		{
			frameCount++;	
			if (frameCount == FRAME_TEST_MAX)
			{
				var endTime:Number = (new Date()).getTime();
				var tf:TextField = new TextField();
				tf.text = "FPS: " + ((frameCount) /( (endTime - startTime)/1000)).toFixed(2);
				addChild(tf);
			}
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
			var s:Square = new Square(this.stage.stageWidth / 2, false);
			s.x = x;
			s.y = y;
			this.addChild(s);
		}
	}
}
