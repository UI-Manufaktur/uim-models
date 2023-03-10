/*********************************************************************************************************
  Copyright: © 2015-2023 Ozan Nurettin Süel (Sicherheitsschmiede)                                        
  License: Subject to the terms of the Apache 2.0 license, as written in the included LICENSE.txt file.  
  Authors: Ozan Nurettin Süel (Sicherheitsschmiede)                                                      
**********************************************************************************************************/
module uim.models.attributes.strings.names.full;

/* is.dataFormat.character
is.dataFormat.big
is.dataFormat.array
means.identity.person.fullName */

@safe:
import uim.models;

class DFullNameAttribute : DStringAttribute {
  mixin(AttributeThis!("FullNameAttribute"));

  // Initialization hook method.
  override void initialize(Json configSettings = Json(null)) {
    super.initialize(configSettings);

    this
      .name("fullName")
      .registerPath("fullName");
  }
}
mixin(AttributeCalls!("FullNameAttribute"));

version(test_uim_models) { unittest {
    // TODO
  }
}