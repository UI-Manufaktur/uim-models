/*********************************************************************************************************
  Copyright: © 2015-2023 Ozan Nurettin Süel (Sicherheitsschmiede)                                        
  License: Subject to the terms of the Apache 2.0 license, as written in the included LICENSE.txt file.  
  Authors: Ozan Nurettin Süel (Sicherheitsschmiede)                                                      
**********************************************************************************************************/
module uim.oop.attributes.doubles.double_;

@safe:
import uim.oop;

class DDoubleAttribute : DAttribute {
  mixin(AttributeThis!("DoubleAttribute"));

  // Initialization hook method.
  override void initialize(DConfigurationValue configSettings = null) {
    super.initialize(configSettings);

    this
      .dataFormats(["floatingPoint", "big"])
      .isDouble(true)
      .name("double")
      .registerPath("double");
  }
}
mixin(AttributeCalls!("DoubleAttribute"));

///
unittest {}