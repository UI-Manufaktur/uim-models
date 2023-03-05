/*********************************************************************************************************
	Copyright: © 2015-2023 Ozan Nurettin Süel (Sicherheitsschmiede)                                        
	License: Subject to the terms of the Apache 2.0 license, as written in the included LICENSE.txt file.  
	Authors: Ozan Nurettin Süel (Sicherheitsschmiede)                                                      
**********************************************************************************************************/
module uim.models.values.datetimes.systime;

@safe:
import uim.models;

class DSystimeValue : DValue {
  mixin(ValueThis!("SystimeValue", "SysTime"));  

  protected SysTime _value;  
  alias value = DValue.value;
  O value(this O)(SysTime newValue) {
    this.set(newValue);
    return cast(O)this; 
  }
  SysTime value() {
    return _value; 
  }
  // Initialization hook method.
  override void initialize(DConfigurationValue configSettings = null) {
    super.initialize(configSettings);

    this
      .isTimestamp(true);
  }

  // Hooks for setting 
  protected void set(SysTime newValue) {
    _value = newValue; 
  }  

  override protected void set(string newValue) {
    if (newValue is null) { 
      this
        .isNull(isNullable ? true : false) 
        .value(SysTime()); }
    else {
      this
        .isNull(false);
        // .value(fromISOExtString(newValue)); 
    }

    alias opEquals = DValue.opEquals;
  }  

  override protected void set(Json newValue) {
    if (newValue == Json(null)) { 
      _value = SysTime(); 
      this.isNull(isNullable ? true : false); }
    else {
      // _value = newValue.get!string.fromISOExtString;
      this.isNull(false);
    }
  }

  override DValue copy() {
    return SystimeValue(value);
  }

  override Json toJson() { 
    if (isNull) return Json(null); 
    return Json(this.value.toISOExtString); }

  override string toString() { 
    if (isNull) return null; 
    return this.value.toISOExtString; }
}
mixin(ValueCalls!("SystimeValue", "SysTime"));  

version(test_uim_oops) { unittest {    
    // TODO
}} 