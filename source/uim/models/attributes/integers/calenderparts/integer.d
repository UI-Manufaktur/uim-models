/*********************************************************************************************************
  Copyright: © 2015-2023 Ozan Nurettin Süel (Sicherheitsschmiede)                                        
  License: Subject to the terms of the Apache 2.0 license, as written in the included LICENSE.txt file.  
  Authors: Ozan Nurettin Süel (Sicherheitsschmiede)                                                      
**********************************************************************************************************/
module uim.oop.attributes.integers.calenderparts.integer;

@safe:
import uim.models;

class DIntegerCalendarPart : DIntegerAttribute {
  mixin(AttributeThis!"IntegerCalendarPart");

/* means.calendar
means.calendar.day
 */  // Initialization hook method.
  override void initialize(DConfigurationValue configSettings = null) {
    super.initialize(configSettings);

    this
      .name("integerCalendarPart")
      .registerPath("integerCalendarPart");
  }    
}
mixin(AttributeCalls!"IntegerCalendarPart");

version(test_uim_oops) { unittest {
    testAttribute(new DIntegerCalendarPart);
    testAttribute(IntegerCalendarPart);
  }
}