/*********************************************************************************************************
	Copyright: © 2015-2023 Ozan Nurettin Süel (Sicherheitsschmiede)                                        
	License: Subject to the terms of the Apache 2.0 license, as written in the included LICENSE.txt file.  
	Authors: Ozan Nurettin Süel (Sicherheitsschmiede)                                                      
**********************************************************************************************************/
module uim.oop.attributes.arrays.bytes.binary;

@safe:
import uim.models;

class DBinaryAttribute : DAttribute {
  mixin(AttributeThis!("BinaryAttribute"));

  // Initialization hook method.
  override void initialize(DConfigurationValue configSettings = null) {
    super.initialize(configSettings);


    /* Inheritance
    any <- byte <- binary
    Traits
    is.dataFormat.byte
    is.dataFormat.array */
    this
      .addDataFormats(["array"])
      .name("binary")
      .registerPath("binary");
  }
}
mixin(AttributeCalls!("BinaryAttribute"));

version(test_uim_oops) { unittest {
    testAttribute(new DBinaryAttribute);
    testAttribute(BinaryAttribute);
  }
}