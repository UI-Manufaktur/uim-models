/*********************************************************************************************************
	Copyright: © 2015-2023 Ozan Nurettin Süel (Sicherheitsschmiede)                                        
	License: Subject to the terms of the Apache 2.0 license, as written in the included LICENSE.txt file.  
	Authors: Ozan Nurettin Süel (Sicherheitsschmiede)                                                      
**********************************************************************************************************/
module uim.oop.attributes.bytes.byte_;

@safe:
import uim.oop;

class DByteAttribute : DAttribute {
  mixin(AttributeThis!("ByteAttribute"));

  // Initialization hook method.
  override void initialize(DConfigurationValue configSettings = null) {
    super.initialize(configSettings);

    this
      .addDataFormats(["byte"])
      .name("byte")
      .registerPath("byte");
  }
}
mixin(AttributeCalls!("ByteAttribute"));

version(test_uim_oops) { unittest {
    testAttribute(new DByteAttribute);
    testAttribute(ByteAttribute);
  }
}