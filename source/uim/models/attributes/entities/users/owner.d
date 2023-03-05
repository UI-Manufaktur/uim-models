/*********************************************************************************************************
  Copyright: © 2015-2023 Ozan Nurettin Süel (Sicherheitsschmiede)                                        
  License: Subject to the terms of the Apache 2.0 license, as written in the included LICENSE.txt file.  
  Authors: Ozan Nurettin Süel (Sicherheitsschmiede)                                                      
**********************************************************************************************************/
module uim.models.attributes.entities.users.owner;

@safe:
import uim.models;

class DOwnerAttribute : DEntityAttribute {
  mixin(AttributeThis!("OwnerAttribute"));

  // Initialization hook method.
  override void initialize(DConfigurationValue configSettings = null) {
    super.initialize(configSettings);

    this
      .name("owner")
      .registerPath("owner");
  }  
}
mixin(AttributeCalls!("OwnerAttribute"));

version(test_uim_oops) { unittest {
  
    // TODO 
  }  
}