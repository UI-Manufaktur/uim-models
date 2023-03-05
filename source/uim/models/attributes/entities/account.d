/*********************************************************************************************************
  Copyright: © 2015-2023 Ozan Nurettin Süel (Sicherheitsschmiede)                                        
  License: Subject to the terms of the Apache 2.0 license, as written in the included LICENSE.txt file.  
  Authors: Ozan Nurettin Süel (Sicherheitsschmiede)                                                      
**********************************************************************************************************/
module uim.models.attributes.entities.account;

@safe:
import uim.models;

class DAccountAttribute : DEntityAttribute {
  mixin(AttributeThis!("AccountAttribute"));

  // Initialization hook method.
  override void initialize(DConfigurationValue configSettings = null) {
    super.initialize(configSettings);

    this
      .name("account")
      .registerPath("account");
  }  
}
mixin(AttributeCalls!("AccountAttribute"));

version(test_uim_oops) { unittest {
    testAttribute(new DAccountAttribute);
    testAttribute(AccountAttribute);
  }
}