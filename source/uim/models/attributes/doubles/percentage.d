/*********************************************************************************************************
  Copyright: © 2015-2023 Ozan Nurettin Süel (Sicherheitsschmiede)                                        
  License: Subject to the terms of the Apache 2.0 license, as written in the included LICENSE.txt file.  
  Authors: Ozan Nurettin Süel (Sicherheitsschmiede)                                                      
**********************************************************************************************************/
module uim.oop.attributes.doubles.percentage;

@safe:
import uim.models;

class DPercentageAttribute : DDoubleAttribute {
  mixin(AttributeThis!("PercentageAttribute"));

  // Initialization hook method.
  override void initialize(DConfigurationValue configSettings = null) {
    super.initialize(configSettings);

    this
      .name("percentage")
      .registerPath("percentage");
  }
}
mixin(AttributeCalls!("PercentageAttribute"));

version(test_uim_oops) { unittest {  
    // TODO tests
  }
}