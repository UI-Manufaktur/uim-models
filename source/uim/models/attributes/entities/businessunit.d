/*********************************************************************************************************
  Copyright: © 2015-2023 Ozan Nurettin Süel (Sicherheitsschmiede)                                        
  License: Subject to the terms of the Apache 2.0 license, as written in the included LICENSE.txt file.  
  Authors: Ozan Nurettin Süel (Sicherheitsschmiede)                                                      
**********************************************************************************************************/
module uim.oop.attributes.entities.businessunit;

@safe:
import uim.models;

// A unique identifier for entity instances

class DBusinessUnitAttribute : DEntityAttribute {
  mixin(AttributeThis!("BusinessUnitAttribute"));

  // Initialization hook method.
  override void initialize(DConfigurationValue configSettings = null) {
    super.initialize(configSettings);

    this
      .name("businessUnit")
      .registerPath("businessunit");
  }  
}
mixin(AttributeCalls!("BusinessUnitAttribute"));

version(test_uim_oops) { unittest {
    testAttribute(new DBusinessUnitAttribute);
    testAttribute(BusinessUnitAttribute);
  }
}