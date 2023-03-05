/*********************************************************************************************************
  Copyright: © 2015-2023 Ozan Nurettin Süel (Sicherheitsschmiede)                                        
  License: Subject to the terms of the Apache 2.0 license, as written in the included LICENSE.txt file.  
  Authors: Ozan Nurettin Süel (Sicherheitsschmiede)                                                      
**********************************************************************************************************/
module uim.oop.attributes.integers.integer;

@safe:
import uim.models;

class DIntegerAttribute : DAttribute {
  mixin(AttributeThis!"IntegerAttribute");

  // Initialization hook method.
  override void initialize(DConfigurationValue configSettings = null) {
    super.initialize(configSettings);

    this
      .addDataFormats(["integer"])
      .name("integer")
      .registerPath("integer");
  }    
}
mixin(AttributeCalls!"IntegerAttribute");

version(test_uim_oops) { unittest {
    testAttribute(new DIntegerAttribute);
    testAttribute(IntegerAttribute);
  }
}