/*********************************************************************************************************
  Copyright: © 2015-2023 Ozan Nurettin Süel (Sicherheitsschmiede)                                        
  License: Subject to the terms of the Apache 2.0 license, as written in the included LICENSE.txt file.  
  Authors: Ozan Nurettin Süel (Sicherheitsschmiede)                                                      
**********************************************************************************************************/
module  source.uim.models.attributes.entities.file;

@safe:
import uim.models;

class DFileAttribute : DEntityAttribute {
  mixin(AttributeThis!("FileAttribute"));

  // Initialization hook method.
  override void initialize(DConfigurationValue configSettings = null) {
    super.initialize(configSettings);

    this
      .name("file")
      .registerPath("file");
  }  
}
mixin(AttributeCalls!("FileAttribute"));

version(test_uim_oops) { unittest {
    testAttribute(new DFileAttribute);
    testAttribute(FileAttribute);
  }
}