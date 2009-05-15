package com.hydraframework.components.growler.controller
{
	import com.hydraframework.components.growler.model.GrowlDescriptor;
	import com.hydraframework.components.growler.model.GrowlProxy;
	import com.hydraframework.core.mvc.events.Notification;
	import com.hydraframework.core.mvc.interfaces.IFacade;
	import com.hydraframework.core.mvc.patterns.command.SimpleCommand;

	public class GrowlDisplayCommand extends SimpleCommand
	{
		public function get proxy():GrowlProxy
		{
			return this.facade.retrieveProxy(GrowlProxy.NAME) as GrowlProxy;
		}

		public function GrowlDisplayCommand(facade:IFacade)
		{
			super(facade);
		}

		override public function execute(notification:Notification):void
		{
			if (notification.isRequest())
				this.proxy.pop(notification.body as GrowlDescriptor);
		}
	}
}