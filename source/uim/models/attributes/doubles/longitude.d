/*********************************************************************************************************
  Copyright: © 2015-2023 Ozan Nurettin Süel (Sicherheitsschmiede)                                        
  License: Subject to the terms of the Apache 2.0 license, as written in the included LICENSE.txt file.  
  Authors: Ozan Nurettin Süel (Sicherheitsschmiede)                                                      
**********************************************************************************************************/
module uim.oop.attributes.doubles.longitude;

/* any <- float <- double <- longitude
Traits
is.dataFormat.floatingPoint
is.dataFormat.big
means.location.longitude */

@safe:
import uim.oop;

class DLongitudeAttribute : DDoubleAttribute {
  mixin(AttributeThis!("LongitudeAttribute"));

  // Initialization hook method.
  override void initialize(DConfigurationValue configSettings = null) {
    super.initialize(configSettings);

    this
      .name("longitude")
      .registerPath("longitude");
  }
}
mixin(AttributeCalls!("LongitudeAttribute"));

version(test_uim_oops) { unittest {
    // TODO
  }
}