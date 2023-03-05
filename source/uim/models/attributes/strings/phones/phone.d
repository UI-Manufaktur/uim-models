/*********************************************************************************************************
  Copyright: © 2015-2023 Ozan Nurettin Süel (Sicherheitsschmiede)                                        
  License: Subject to the terms of the Apache 2.0 license, as written in the included LICENSE.txt file.  
  Authors: Ozan Nurettin Süel (Sicherheitsschmiede)                                                      
**********************************************************************************************************/
module uim.oop.attributes.strings.phones.phone;

/* any <- char <- string <- phone
Traits
is.dataFormat.character
is.dataFormat.big
is.dataFormat.array
means.identity.service.phone */

@safe:
import uim.models;

class DPhoneAttribute : DStringAttribute {
  mixin(AttributeThis!("PhoneAttribute"));

  // Initialization hook method.
  override void initialize(DConfigurationValue configSettings = null) {
    super.initialize(configSettings);

    this
      .name("phone")
      .registerPath("phone");
  }
}
mixin(AttributeCalls!("PhoneAttribute"));

version(test_uim_oops) { unittest {
    // TODO
  }
}
