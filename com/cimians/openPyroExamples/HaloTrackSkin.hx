package com.cimians.openPyroExamples;

	import com.cimians.openPyro.core.UIControl;
	import com.cimians.openPyro.painters.CompositePainter;
	import com.cimians.openPyro.painters.FillPainter;
	import com.cimians.openPyro.painters.GradientFillPainter;
	import com.cimians.openPyro.painters.Stroke;
	import com.cimians.openPyro.painters.StrokePainter;
	
	class HaloTrackSkin extends UIControl {
		
		public function new(?gradientRotation:Float=0)
		{
			var fillPainter:FillPainter = new FillPainter(0xffffff);
			var gradientFill:GradientFillPainter = new GradientFillPainter([0x000000,0xdfdfdf, 0xffffff],[.4,1,1],[1,140,255],gradientRotation);
			var strokePainter:StrokePainter = new StrokePainter(new Stroke(1, 0x777777));
			var compositePainter:CompositePainter = new CompositePainter();
			compositePainter.addPainter(fillPainter);
			compositePainter.addPainter(strokePainter);
			compositePainter.addPainter(gradientFill);
			this.backgroundPainter = compositePainter;
		}

	}
