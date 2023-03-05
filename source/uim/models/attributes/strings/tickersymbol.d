/*********************************************************************************************************
  Copyright: © 2015-2023 Ozan Nurettin Süel (Sicherheitsschmiede)                                        
  License: Subject to the terms of the Apache 2.0 license, as written in the included LICENSE.txt file.  
  Authors: Ozan Nurettin Süel (Sicherheitsschmiede)                                                      
**********************************************************************************************************/
module uim.models.attributes.strings.tickersymbol;

/* any <- char <- string <- tickerSymbol
Traits
is.dataFormat.character
is.dataFormat.big
is.dataFormat.array
means.identity.tickerSymbol */

@safe:
import uim.models;

class DTickerSymbolAttribute : DStringAttribute {
  mixin(AttributeThis!("TickerSymbolAttribute"));

  // Initialization hook method.
  override void initialize(DConfigurationValue configSettings = null) {
    super.initialize(configSettings);

    this
      .name("tickerSymbol")
      .registerPath("tickerSymbol");
  }
}
mixin(AttributeCalls!("TickerSymbolAttribute"));

///
unittest {
  auto attribute = new DTickerSymbolAttribute;
  assert(attribute.name == "tickerSymbol");
  assert(attribute.registerPath == "tickerSymbol");

  DAttribute generalAttribute = attribute;
  assert(cast(DStringAttribute)generalAttribute);
  assert(!cast(DIntegerAttribute)generalAttribute);

  DValue value = attribute.createValue();
  assert(cast(DStringValue)value);
}