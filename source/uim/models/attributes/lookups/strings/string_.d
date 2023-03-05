/*********************************************************************************************************
  Copyright: © 2015-2023 Ozan Nurettin Süel (Sicherheitsschmiede)                                        
  License: Subject to the terms of the Apache 2.0 license, as written in the included LICENSE.txt file.  
  Authors: Ozan Nurettin Süel (Sicherheitsschmiede)                                                      
**********************************************************************************************************/
module uim.models.attributes.lookups.strings.string_;

@safe:
import uim.models;

class DStringStringAttribute : DLookupAttribute {
  mixin(AttributeThis!("StringStringAttribute"));
  
  mixin(OProperty!("string[string]", "lookups"));

  override DValue createValue() {
    return LookupValue!(string, string).isNullable(isNullable);
  }
}
mixin(AttributeCalls!("StringStringAttribute"));

version(test_uim_oops) { unittest {  
    // TODO tests
  }
}