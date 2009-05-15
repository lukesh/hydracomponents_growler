/*
   HydraMVC - Copyright (c) 2009 andCulture, Inc. Some rights reserved.
   Your reuse is governed by the Creative Commons Attribution 3.0 United States License
 */
package com.hydraframework.components.growler.view
{
	import com.hydraframework.components.growler.GrowlFacade;
	import com.hydraframework.components.growler.Growler;
	import com.hydraframework.components.growler.model.GrowlDescriptor;
	import com.hydraframework.components.growler.view.events.GrowlEvent;
	import com.hydraframework.core.mvc.events.Notification;
	import com.hydraframework.core.mvc.events.Phase;
	import com.hydraframework.core.mvc.interfaces.IMediator;
	import com.hydraframework.core.mvc.patterns.mediator.Mediator;

	public class GrowlMediator extends Mediator implements IMediator
	{
		public static const NAME:String = "GrowlMediator";
		public var growlArray:Array;

		public function get growler():Growler
		{
			return this.component as Growler;
		}

		public function GrowlMediator(component:Growler = null)
		{
			super(NAME, component);
		}

		override public function handleNotification(notification:Notification):void
		{
			var body:Object = notification.body;
			var name:String = notification.name;
			var phase:String = notification.phase;
			
			var growlArray:Array;
			var growlDescriptor:GrowlDescriptor;
			switch (name)
			{
				case GrowlFacade.GROWL_DISPLAY:
					if(notification.isResponse())
					{
						growlDescriptor = GrowlDescriptor(body);
						growler.addGrowl(growlDescriptor);
					}
					break;
			}
		}

		override protected function attachEventListeners():void
		{
			this.growler.addEventListener(GrowlEvent.GROWL, handleGrowl);
		}

		override protected function removeEventListeners():void
		{
			this.growler.removeEventListener(GrowlEvent.GROWL, handleGrowl);
		}

		private function handleGrowl(event:GrowlEvent):void
		{
			this.sendNotification(new Notification(GrowlFacade.GROWL, event.descriptor, Phase.REQUEST));
		}
	}
}