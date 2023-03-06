/*********************************************************************************************************
  Copyright: © 2015-2023 Ozan Nurettin Süel (Sicherheitsschmiede)                                        
  License: Subject to the terms of the Apache 2.0 license, as written in the included LICENSE.txt file.  
  Authors: Ozan Nurettin Süel (Sicherheitsschmiede)                                                      
**********************************************************************************************************/
module uim.models.attributes.integers.minutes;

/* any <- integer <- minutes <- minutess
Traits
is.dataFormat.integer
means.measurement.dimension.time
means.measurement.duration.minutes
has.measurement.fundamentalComponent.second */

@safe:
import uim.models;

class DMinutesAttribute : DIntegerAttribute {
  mixin(AttributeThis!("MinutesAttribute"));

  // Initialization hook method.
  override void initialize(DConfigurationValue configSettings = null) {
    super.initialize(configSettings);

    this
      .name("minutes")
      .registerPath("minutes");
  }    
}
mixin(AttributeCalls!("MinutesAttribute"));

version(test_uim_models) { unittest {
    testAttribute(new DMinutesAttribute);
    testAttribute(MinutesAttribute);
  }
}