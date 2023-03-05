/*********************************************************************************************************
  Copyright: © 2015-2023 Ozan Nurettin Süel (Sicherheitsschmiede)                                        
  License: Subject to the terms of the Apache 2.0 license, as written in the included LICENSE.txt file.  
  Authors: Ozan Nurettin Süel (Sicherheitsschmiede)                                                      
**********************************************************************************************************/
module  source.uim.oop.attributes.entities.contact;

@safe:
import uim.models;

class DContactAttribute : DEntityAttribute {
  mixin(AttributeThis!("ContactAttribute"));

  // Initialization hook method.
  override void initialize(DConfigurationValue configSettings = null) {
    super.initialize(configSettings);

    this
      .name("contact")
      .registerPath("contact");
  }  
}
mixin(AttributeCalls!("ContactAttribute"));

version(test_uim_oops) { unittest {
    testAttribute(new DContactAttribute);
    testAttribute(ContactAttribute);
  }
}