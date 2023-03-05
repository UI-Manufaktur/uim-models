/*********************************************************************************************************
  Copyright: © 2015-2023 Ozan Nurettin Süel (Sicherheitsschmiede)                                        
  License: Subject to the terms of the Apache 2.0 license, as written in the included LICENSE.txt file.  
  Authors: Ozan Nurettin Süel (Sicherheitsschmiede)                                                      
**********************************************************************************************************/
module uim.models.attributes.doubles.kelvin;

/* Unit of measure for thermodynamic temperature in degrees kelvin

Inheritance
any <- float <- double <- kelvin
Traits
is.dataFormat.floatingPoint
is.dataFormat.big
means.measurement.dimension.temperature
means.measurement.units.si.kelvin
has.measurement.fundamentalComponent.kelvin */

@safe:
import uim.models;

class DKelvinAttribute : DDoubleAttribute {
  mixin(AttributeThis!("KelvinAttribute"));

  // Initialization hook method.
  override void initialize(DConfigurationValue configSettings = null) {
    super.initialize(configSettings);

    this
      .name("kelvin")
      .registerPath("kelvin");
  }
}
mixin(AttributeCalls!("KelvinAttribute"));

version(test_uim_oops) { unittest {
    // TODO
  }
}