/***********************************************************************************************
*	Copyright: © 2017-2022 UI Manufaktur UG / 2022 Ozan Nuretin Süel (Sicherheitsschmiede)
*	License: Subject to the terms of the MIT license, as written in the included LICENSE.txt file.
*	Authors: UI Manufaktur Team
************************************************************************************************/
module uim.oop.attributes.arrays.strings.tags;

@safe:
import uim.models;

class DTagsAttribute : DStringArrayAttribute {
  mixin(AttributeThis!("TagsAttribute"));

  // Initialization hook method.
  override void initialize(DConfigurationValue configSettings = null) {
    super.initialize(configSettings);

    this
      .name("TagsAttribute")
      .dataFormats(["string", "array"])
      .registerPath("TagsAttribute");
  }

  override DValue createValue() {
    return TagArrayValue(this); }
}
mixin(AttributeCalls!"TagsAttribute");

version(test_uim_oops) { unittest {
    testAttribute(new DTagsAttribute);
    testAttribute(TagsAttribute);
  }
}