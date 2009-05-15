/*
   HydraMVC - Copyright (c) 2009 andCulture, Inc. Some rights reserved.
   Your reuse is governed by the Creative Commons Attribution 3.0 United States License
 */
package com.hydraframework.components.growler.view.events
{
	import com.hydraframework.components.growler.model.GrowlDescriptor;
	import flash.events.Event;

	public class GrowlEvent extends Event
	{
		public static const GROWL:String = "GrowlEvent.growl";
		public static const CLICK:String = "GrowlEvent.click";
		public static const CLOSE:String = "GrowlEvent.close";
		public var descriptor:GrowlDescriptor;

		public function GrowlEvent(type:String, descriptor:GrowlDescriptor = null, bubbles:Boolean = false, cancelable:Boolean = false)
		{
			super(type, bubbles, cancelable);
			this.descriptor = descriptor;
		}

		override public function clone():Event
		{
			return new GrowlEvent(this.type, this.descriptor, this.bubbles, this.cancelable);
		}
	}
}