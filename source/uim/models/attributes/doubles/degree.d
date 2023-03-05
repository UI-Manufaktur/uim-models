/*********************************************************************************************************
  Copyright: © 2015-2023 Ozan Nurettin Süel (Sicherheitsschmiede)                                        
  License: Subject to the terms of the Apache 2.0 license, as written in the included LICENSE.txt file.  
  Authors: Ozan Nurettin Süel (Sicherheitsschmiede)                                                      
**********************************************************************************************************/
module uim.oop.attributes.doubles.degree;

@safe:
import uim.models;

/* 
Unit of measure for angles in degrees, 1/360 rotation
means.measurement.dimension.angle
means.measurement.units.degree
has.measurement.fundamentalComponent */
class DDegreeAttribute : DDoubleAttribute {
  mixin(AttributeThis!("DegreeAttribute"));

  // Initialization hook method.
  override void initialize(DConfigurationValue configSettings = null) {
    super.initialize(configSettings);

    this
      .name("degree")
      .registerPath("degree");
  }
}
mixin(AttributeCalls!("DegreeAttribute"));

version(test_uim_oops) { unittest {
    // TODO
  }
}
