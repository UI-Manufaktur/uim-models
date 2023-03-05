/*********************************************************************************************************
  Copyright: © 2015-2023 Ozan Nurettin Süel (Sicherheitsschmiede)                                        
  License: Subject to the terms of the Apache 2.0 license, as written in the included LICENSE.txt file.  
  Authors: Ozan Nurettin Süel (Sicherheitsschmiede)                                                      
**********************************************************************************************************/
module uim.oop.attributes.entities.slas.invoked;

@safe:
import uim.models;

class DSLAInvokedAttribute : DEntityAttribute {
  mixin(AttributeThis!("SLAInvokedAttribute"));

  // Initialization hook method.
  override void initialize(DConfigurationValue configSettings = null) {
    super.initialize(configSettings);

    this
      .name("slaInvoked")
      .registerPath("slaInvoked");
  }  
}
mixin(AttributeCalls!("SLAInvokedAttribute"));

version(test_uim_oops) { unittest {
    testAttribute(new DSLAInvokedAttribute);
    testAttribute(SLAInvokedAttribute);
  }
} 