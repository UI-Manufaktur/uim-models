/*********************************************************************************************************
  Copyright: © 2015-2023 Ozan Nurettin Süel (Sicherheitsschmiede)                                        
  License: Subject to the terms of the Apache 2.0 license, as written in the included LICENSE.txt file.  
  Authors: Ozan Nurettin Süel (Sicherheitsschmiede)                                                      
**********************************************************************************************************/
module uim.models.attributes.uuids.entities.organization;

@safe:
import uim.models;

class DOrganizationIdAttribute : DEntityIdAttribute {
  mixin(AttributeThis!("OrganizationIdAttribute"));

  // Initialization hook method.
  override void initialize(DConfigurationValue configSettings = null) {
    super.initialize(configSettings);

    this
      .name("organizationId")
      .registerPath("organizationId");
  }  
}
mixin(AttributeCalls!("OrganizationIdAttribute"));

///
unittest {
  auto attribute = new DOrganizationIdAttribute;
  assert(attribute.name == "organizationId");
  assert(attribute.registerPath == "organizationId");

  DAttribute generalAttribute = attribute;
  assert(cast(DEntityIdAttribute)generalAttribute);
  assert(cast(DUUIDAttribute)generalAttribute);
  assert(!cast(DIntegerAttribute)generalAttribute);

  DValue value = attribute.createValue();
  assert(cast(DUUIDValue)value);
}