/*********************************************************************************************************
  Copyright: © 2015-2023 Ozan Nurettin Süel (Sicherheitsschmiede)                                        
  License: Subject to the terms of the Apache 2.0 license, as written in the included LICENSE.txt file.  
  Authors: Ozan Nurettin Süel (Sicherheitsschmiede)                                                      
**********************************************************************************************************/
module uim.oop.attributes.lookups.strings.integer;

@safe:
import uim.oop;

class DStringIntegerAttribute : DLookupAttribute {
  mixin(AttributeThis!("StringIntegerAttribute"));

  mixin(OProperty!("int[string]", "lookups"));

  override DValue createValue() {
    return LookupValue!(string, int).isNullable(isNullable);
  }
}
mixin(AttributeCalls!("StringIntegerAttribute"));

version(test_uim_oops) { unittest {  
    // TODO tests
  }
}