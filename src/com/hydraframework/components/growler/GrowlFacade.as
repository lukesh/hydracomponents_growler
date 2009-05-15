/*
   HydraMVC - Copyright (c) 2009 andCulture, Inc. Some rights reserved.
   Your reuse is governed by the Creative Commons Attribution 3.0 United States License
 */
package com.hydraframework.components.growler
{
	import com.hydraframework.components.growler.controller.*;
	import com.hydraframework.components.growler.model.GrowlProxy;
	import com.hydraframework.components.growler.view.GrowlMediator;
	import com.hydraframework.core.mvc.interfaces.IFacade;
	import com.hydraframework.core.mvc.patterns.facade.Facade;
	
	import mx.core.IUIComponent;

	public class GrowlFacade extends Facade implements IFacade
	{
		public static const STARTUP:String = "GrowlFacade.startup";
		public static const GROWL:String = "GrowlFacade.growl";
		public static const GROWL_DISPLAY:String = "GrowlFacade.growlDisplay";
		
		public function GrowlFacade(name:String = null, component:IUIComponent = null)
		{
			super(name, component);
		}

		/**
		 * @private
		 */
		override public function registerCore():void
		{
			super.registerCore();
			this.registerMediator(new GrowlMediator(component as Growler));
			this.registerProxy(new GrowlProxy());
			this.registerCommand(GrowlFacade.GROWL, GrowlCommand);
			this.registerCommand(GrowlFacade.GROWL_DISPLAY, GrowlDisplayCommand);
		}
	}
}