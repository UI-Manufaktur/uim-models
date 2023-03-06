/*********************************************************************************************************
  Copyright: © 2015-2023 Ozan Nurettin Süel (Sicherheitsschmiede)                                        
  License: Subject to the terms of the Apache 2.0 license, as written in the included LICENSE.txt file.  
  Authors: Ozan Nurettin Süel (Sicherheitsschmiede)                                                      
**********************************************************************************************************/
module uim.models.attributes.strings.languagetags.languagetag;

@safe:
import uim.models;

// means.reference.language.tag
class DLanguageTagAttribute : DStringAttribute {
  mixin(AttributeThis!("LanguageTagAttribute"));

  // Initialization hook method.
  override void initialize(DConfigurationValue configSettings = null) {
    super.initialize(configSettings);

    this
      .name("languageTag")
      .registerPath("languagetag");
  }
}
mixin(AttributeCalls!("LanguageTagAttribute"));

version(test_uim_models) { unittest {
    // TODO
  }
}