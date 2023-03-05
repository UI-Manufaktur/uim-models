/*********************************************************************************************************
  Copyright: © 2015-2023 Ozan Nurettin Süel (Sicherheitsschmiede)                                        
  License: Subject to the terms of the Apache 2.0 license, as written in the included LICENSE.txt file.  
  Authors: Ozan Nurettin Süel (Sicherheitsschmiede)                                                      
**********************************************************************************************************/
module uim.oop.attributes.integers.displayorder;

@safe:
import uim.oop;

class DDisplayOrderAttribute : DIntegerAttribute {
  mixin(AttributeThis!("DisplayOrderAttribute"));

  // Initialization hook method.
  override void initialize(DConfigurationValue configSettings = null) {
    super.initialize(configSettings);

    this
      .name("displayOrder")
      .registerPath("displayOrder");    
  }
}
mixin(AttributeCalls!("DisplayOrderAttribute"));

version(test_uim_oops) { unittest {
    testAttribute(new DDisplayOrderAttribute);
    testAttribute(DisplayOrderAttribute);
  }
}