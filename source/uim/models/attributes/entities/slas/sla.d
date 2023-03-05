/*********************************************************************************************************
  Copyright: © 2015-2023 Ozan Nurettin Süel (Sicherheitsschmiede)                                        
  License: Subject to the terms of the Apache 2.0 license, as written in the included LICENSE.txt file.  
  Authors: Ozan Nurettin Süel (Sicherheitsschmiede)                                                      
**********************************************************************************************************/
module uim.models.attributes.entities.slas.sla;

@safe:
import uim.models;

class DSlaAttribute : DEntityAttribute {
  mixin(AttributeThis!("SlaAttribute"));

  // Initialization hook method.
  override void initialize(DConfigurationValue configSettings = null) {
    super.initialize(configSettings);

    this
      .name("sla")
      .registerPath("sla");
  }  
}
mixin(AttributeCalls!("SlaAttribute"));

version(test_uim_oops) { unittest {
    testAttribute(new DSlaAttribute);
    testAttribute(SlaAttribute);
  }
} 