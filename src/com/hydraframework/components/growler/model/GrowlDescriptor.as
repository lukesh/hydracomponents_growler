/*
   HydraMVC - Copyright (c) 2009 andCulture, Inc. Some rights reserved.
   Your reuse is governed by the Creative Commons Attribution 3.0 United States License
 */
package com.hydraframework.components.growler.model
{
	import flash.events.EventDispatcher;

	[Bindable]
	public class GrowlDescriptor extends EventDispatcher
	{
		public var title:String;
		public var description:String;
		public var action:String;
		public var color:Number
		public var notification:Object;

		public function GrowlDescriptor(title:String, description:String = "", action:String = "More...", color:Number = 0xCCCCCC, notification:Object = null)
		{
			this.title = title;
			this.description = description;
			this.action = action;
			this.color = color;
			this.notification = notification;
		}
	}
}