package;

import nme.display.Sprite;
import aze.display.SparrowTilesheet;
import aze.display.TileGroup;
import aze.display.TileLayer;
import aze.display.TileSprite;
import aze.display.TileClip;
import nme.display.Bitmap;
import nme.display.BitmapData;
import nme.display.GradientType;
import nme.display.Sprite;
import nme.geom.Matrix;
import nme.Lib;
import nme.Assets;

import nme.events.Event;

/**
 * ...
 
 	simple example of using elsassph's nme-tilelayer haxelib
 	https://github.com/elsassph/nme-tilelayer
 
 * @author cstever
 */
class NMETileLayerExample extends Sprite {
	
	private var tLast:Float;
	private var tileLayer:TileLayer;
	
	public function new () {
		
		super ();
		
		// sprite sheet
		var tilesheet = new SparrowTilesheet(
		    Assets.getBitmapData("assets/RunnerMark.png"), Assets.getText("assets/RunnerMark.xml"));
		
		// tile-layer
		var layer = new TileLayer(tilesheet); // optional flags: smoothing, additive blendmode
		var sprite = new TileClip(layer, "Runner", 32);
		sprite.x = 300;
		sprite.y = 300;
			
		
		sprite.play();
		layer.addChild(sprite);
		addChild(layer.view); // layer is NOT a DisplayObject
		
		this.tileLayer = layer;
		
		tLast = Lib.getTimer();
		addEventListener(Event.ENTER_FRAME, onEnterFrame);
		
	}
	
	private function onEnterFrame( event:Event ):Void
	{
		
		var tDelta:Float = Lib.getTimer() - tLast;
		tLast = Lib.getTimer();
		tileLayer.step(Std.int(tDelta));
		tileLayer.render();
		//renderSystem.render(this);
	} 
	
	public static function main () {
		
		Lib.current.addChild (new NMETileLayerExample ());
		
	}	

}
