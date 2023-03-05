/*********************************************************************************************************
	Copyright: © 2015-2023 Ozan Nurettin Süel (Sicherheitsschmiede)                                        
	License: Subject to the terms of the Apache 2.0 license, as written in the included LICENSE.txt file.  
	Authors: Ozan Nurettin Süel (Sicherheitsschmiede)                                                      
**********************************************************************************************************/
module uim.oop.values.element;

@safe:
import uim.oop;

class DElementValue : DValue {
  mixin(ValueThis!("ElementValue", "DElement"));    

  // Initialization hook method.
  override void initialize(DConfigurationValue configSettings = null) {
    super.initialize(configSettings);

    this
      .isNull(false);
  }

  protected DElement _value;
  alias value = DValue.value;
  O value(this O)(DElement newValue) {
    _value = newValue;
    return cast(O)this; 
  }
  DElement value() {
    return _value; 
  }
  version(test_uim_oops) { unittest {    
    auto Element = SystemUser; // some kind of Element
    assert(ElementValue.value(Element).value.id == Element.id);
  }}

  protected void set(DElement newValue) {
    if (newValue is null) { 
      this.isNull(isNullable ? true : false); 
      _value = null; }
    else {
      this.isNull(false);
      _value = newValue; 
    }
  }  

  override protected void set(string newValue) {
    /// TODO
  }  

  override protected void set(Json newValue) {
    /// TODO
  }

/*   bool opEquals(DElement otherValue) {
    return (this.value.id == otherValue.id);
  }

  int opCmp(DElement otherValue) {
    /// TODO
    return 1;
  } */

  override DValue copy() {
    return ElementValue;
  }

  override Json toJson() { 
    if (isNull) return Json(null); 
    return this.value.toJson; 
  }

  // ElementValue converts to a JsonSTtring
  override string toString() { 
    if (isNull) return null; 
    return toJson.toString; 
  }

  override void fromString(string newValue) { 
    /// TODO this.value(newValue);
  }
}
mixin(ValueCalls!("ElementValue"));  

version(test_uim_oops) { unittest {  
  assert(ElementValue);
}}
