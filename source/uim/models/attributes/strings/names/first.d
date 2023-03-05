/*********************************************************************************************************
  Copyright: © 2015-2023 Ozan Nurettin Süel (Sicherheitsschmiede)                                        
  License: Subject to the terms of the Apache 2.0 license, as written in the included LICENSE.txt file.  
  Authors: Ozan Nurettin Süel (Sicherheitsschmiede)                                                      
**********************************************************************************************************/
module uim.models.attributes.strings.names.first;

@safe:
import uim.models;

/* is.dataFormat.character
is.dataFormat.big
is.dataFormat.array
means.identity.person.firstName */
class DFirstNameAttribute : DStringAttribute {
  mixin(AttributeThis!("FirstNameAttribute"));

  // Initialization hook method.
  override void initialize(DConfigurationValue configSettings = null) {
    super.initialize(configSettings);

    this
      .name("firstName")
      .registerPath("firstname");
  }
}
mixin(AttributeCalls!("FirstNameAttribute"));

version(test_uim_oops) { unittest {
    // TODO
  }
}