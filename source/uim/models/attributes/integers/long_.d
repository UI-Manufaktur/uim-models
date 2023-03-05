/*********************************************************************************************************
  Copyright: © 2015-2023 Ozan Nurettin Süel (Sicherheitsschmiede)                                        
  License: Subject to the terms of the Apache 2.0 license, as written in the included LICENSE.txt file.  
  Authors: Ozan Nurettin Süel (Sicherheitsschmiede)                                                      
**********************************************************************************************************/
module uim.oop.attributes.integers.long_;

@safe:
import uim.oop;

class DLongAttribute : DAttribute {
  mixin(AttributeThis!("LongAttribute"));

  // Initialization hook method.
  override void initialize(DConfigurationValue configSettings = null) {
    super.initialize(configSettings);

    this
      .addDataFormats(["long"])
      .name("long")
      .registerPath("long");
  }    
}
mixin(AttributeCalls!("LongAttribute"));

version(test_uim_oops) { unittest {
    testAttribute(new DLongAttribute);
    testAttribute(LongAttribute);
  }
}