/*
   HydraMVC - Copyright (c) 2009 andCulture, Inc. Some rights reserved.
   Your reuse is governed by the Creative Commons Attribution 3.0 United States License
 */
package com.hydraframework.components.growler.model
{
	import com.hydraframework.components.growler.GrowlFacade;
	import com.hydraframework.core.mvc.events.Notification;
	import com.hydraframework.core.mvc.events.Phase;
	import com.hydraframework.core.mvc.interfaces.IProxy;
	import com.hydraframework.core.mvc.patterns.proxy.Proxy;

	public class GrowlProxy extends Proxy implements IProxy
	{
		public static const NAME:String = "GrowlProxy";

		public function get growlArray():Array
		{
			return this.data as Array;
		}

		public function GrowlProxy()
		{
			super(NAME, []);
			this.data = [];
		}

		public function push(descriptor:GrowlDescriptor):void
		{
			growlArray.push(descriptor);
			this.sendNotification(new Notification(GrowlFacade.GROWL, growlArray, Phase.RESPONSE));
		}
		
		public function pop(descriptor:GrowlDescriptor):void
		{
			growlArray.splice(growlArray.indexOf(descriptor), 1);
			this.sendNotification(new Notification(GrowlFacade.GROWL_DISPLAY, descriptor, Phase.RESPONSE));
		}
	}
}