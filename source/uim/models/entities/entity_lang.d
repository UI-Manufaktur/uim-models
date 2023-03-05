/***********************************************************************************************
*	Copyright: © 2017-2022, UI Manufaktur UG
*	License: Subject to the terms of the MIT license, as written in the included LICENSE.txt file.
*	Authors: UI Manufaktur Team
*	Documentation [DE]: https://ui-manufaktur.com/docu/uim-oop/models/entities/entity_lang
************************************************************************************************/
module uim.models.entity_lang;

@safe:
import uim.models;

class DEntityLang : DEntity {
  this() { super(); }
  this(UUID myId) { super(myId); }
  this(string myName) { super(myName);}
  this(UUID myId, string myName) { super(myId, myName); }

  mixin(SProperty!("string", "language"));

  override Json toJson(string[] showFields = null, string[] hideFields = null) {    
    auto result = super.toJson(showFields, hideFields);
    
    result["language"] = this.language;

    return result;
  }
}
auto EntityLang() { return new DEntityLang; }

version(test_uim_oop) {
  unittest {
  }
}
