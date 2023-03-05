/*********************************************************************************************************
	Copyright: © 2015-2023 Ozan Nurettin Süel (Sicherheitsschmiede)                                        
	License: Subject to the terms of the Apache 2.0 license, as written in the included LICENSE.txt file.  
	Authors: Ozan Nurettin Süel (Sicherheitsschmiede)                                                      
**********************************************************************************************************/
module uim.oop.attributes.datetimes.birthdate;

@safe:
import uim.oop;

class DBirthDateAttribute : DDatetimeAttribute {
  mixin(AttributeThis!("BirthDateAttribute"));

  // Initialization hook method.
  override void initialize(DConfigurationValue configSettings = null) {
    super.initialize(configSettings);

    /* is.dataFormat.date
    means.measurement.date
    is.dataFormat.time
    means.measurement.time
    means.demographic.birthDate
 */
    this
      .dataFormats(["time"])
      .name("birthdate")
      .registerPath("birthdate");

  }
  override DValue createValue() {
    return DatetimeValue(this); }
}
mixin(AttributeCalls!"BirthDateAttribute");

version(test_uim_oops) { unittest {
    testAttribute(new DBirthDateAttribute);
    testAttribute(BirthDateAttribute);
  }
}