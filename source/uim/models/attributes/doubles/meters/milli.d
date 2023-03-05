/*********************************************************************************************************
  Copyright: © 2015-2023 Ozan Nurettin Süel (Sicherheitsschmiede)                                        
  License: Subject to the terms of the Apache 2.0 license, as written in the included LICENSE.txt file.  
  Authors: Ozan Nurettin Süel (Sicherheitsschmiede)                                                      
**********************************************************************************************************/
module uim.models.attributes.doubles.meters.milli;

@safe:
import uim.models;

/* Unit of measure for length in 10E-3 meters

Inheritance
any <- float <- double <- meter <- millimeter
Traits
is.dataFormat.floatingPoint
is.dataFormat.big
means.measurement.dimension.length
means.measurement.units.si.meter
has.measurement.fundamentalComponent.meter
means.measurement.prefix.milli */

@safe:
import uim.models;

class DMillimeterAttribute : DMeterAttribute {
  mixin(AttributeThis!("MillimeterAttribute"));

  // Initialization hook method.
  override void initialize(DConfigurationValue configSettings = null) {
    super.initialize(configSettings);

    this
      .name("millimeter")
      .registerPath("millimeter");
  }
}
mixin(AttributeCalls!("MillimeterAttribute"));

version(test_uim_oops) { unittest {
    // TODO
  }
}