/*********************************************************************************************************
  Copyright: © 2015-2023 Ozan Nurettin Süel (Sicherheitsschmiede)                                        
  License: Subject to the terms of the Apache 2.0 license, as written in the included LICENSE.txt file.  
  Authors: Ozan Nurettin Süel (Sicherheitsschmiede)                                                      
**********************************************************************************************************/
module uim.models.attributes.doubles.grams.kilo;

/* Unit of measure for mass in kilogram

Inheritance
any <- float <- double <- kilogram
Traits
is.dataFormat.floatingPoint
is.dataFormat.big
means.measurement.dimension.mass
means.measurement.units.si.kilogram
has.measurement.fundamentalComponent.kilogram */

@safe:
import uim.models;

class DKilogramAttribute : DGramAttribute {
  mixin(AttributeThis!("KilogramAttribute"));

  // Initialization hook method.
  override void initialize(DConfigurationValue configSettings = null) {
    super.initialize(configSettings);

    this
      .name("kilogram")
      .registerPath("kilogram");
  }
}
mixin(AttributeCalls!("KilogramAttribute"));

version(test_uim_oops) { unittest {
    // TODO
  }
}