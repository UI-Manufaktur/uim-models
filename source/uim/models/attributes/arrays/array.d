/*********************************************************************************************************
	Copyright: © 2015-2023 Ozan Nurettin Süel (Sicherheitsschmiede)                                        
	License: Subject to the terms of the Apache 2.0 license, as written in the included LICENSE.txt file.  
	Authors: Ozan Nurettin Süel (Sicherheitsschmiede)                                                      
**********************************************************************************************************/
module uim.oop.attributes.arrays.array;

@safe:
import uim.models;

class DArrayAttribute : DAttribute {
  mixin(AttributeThis!("ArrayAttribute"));

  // Initialization hook method.
  override void initialize(DConfigurationValue configSettings = null) {
    super.initialize(configSettings);

    this
      .name("arrayAttribute")
      .addDataFormats(["array"])
      .registerPath("arrayAttribute");
  }
}
mixin(AttributeCalls!"ArrayAttribute");

version(test_uim_oops) { unittest {
    testAttribute(new DArrayAttribute);
    testAttribute(ArrayAttribute);
  }
}