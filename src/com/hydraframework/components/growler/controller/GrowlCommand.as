/*
   HydraMVC - Copyright (c) 2009 andCulture, Inc. Some rights reserved.
   Your reuse is governed by the Creative Commons Attribution 3.0 United States License
 */
package com.hydraframework.components.growler.controller
{
	import com.hydraframework.components.growler.GrowlFacade;
	import com.hydraframework.components.growler.model.GrowlDescriptor;
	import com.hydraframework.components.growler.model.GrowlProxy;
	import com.hydraframework.core.mvc.events.Notification;
	import com.hydraframework.core.mvc.events.Phase;
	import com.hydraframework.core.mvc.interfaces.IFacade;
	import com.hydraframework.core.mvc.patterns.command.SimpleCommand;

	public class GrowlCommand extends SimpleCommand
	{
		public function get proxy():GrowlProxy
		{
			return this.facade.retrieveProxy(GrowlProxy.NAME) as GrowlProxy;
		}

		public function GrowlCommand(facade:IFacade)
		{
			super(facade);
		}

		override public function execute(notification:Notification):void
		{
			if (notification.isRequest())
			{
				this.proxy.push(notification.body as GrowlDescriptor);
			}
			if (notification.isResponse())
			{
				var growlArray:Array = notification.body as Array;
				if (growlArray && growlArray.length > 0)
					this.facade.sendNotification(new Notification(GrowlFacade.GROWL_DISPLAY, growlArray[0] as GrowlDescriptor, Phase.REQUEST));
			}
		}
	}
}