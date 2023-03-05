/*********************************************************************************************************
  Copyright: © 2015-2023 Ozan Nurettin Süel (Sicherheitsschmiede)                                        
  License: Subject to the terms of the Apache 2.0 license, as written in the included LICENSE.txt file.  
  Authors: Ozan Nurettin Süel (Sicherheitsschmiede)                                                      
**********************************************************************************************************/
module uim.oop.attributes;

@safe:
import uim.oop;

public import uim.oop.attributes.attribute;
public import uim.oop.attributes.interface_;

public import uim.oop.attributes.lookups;
public import uim.oop.attributes.codes;

public import uim.oop.attributes.arrays;
public import uim.oop.attributes.booleans;
public import uim.oop.attributes.bytes;
public import uim.oop.attributes.chars;
public import uim.oop.attributes.dates;
public import uim.oop.attributes.datetimes;
public import uim.oop.attributes.decimals;
public import uim.oop.attributes.doubles;
public import uim.oop.attributes.elements;
public import uim.oop.attributes.entities;
public import uim.oop.attributes.integers;
public import uim.oop.attributes.ulongs;
public import uim.oop.attributes.uuids;

template AttributeThis(string name) {
  const char[] AttributeThis = q{
    this() { initialize(); this.name(name);  }
    this(Json newData) { this().fromJson(newData); }
    this(UUID myId) { this().id(myId); }
    this(string myName) { this().name(myName); }
    this(UUID myId, string myName) { this(myId).name(myName); }  
  };
}

template AttributeCalls(string name) {
  const char[] AttributeCalls = `
auto `~name~`() { return new D`~name~`();  }
auto `~name~`(Json newData) { return new D`~name~`(newData); }
auto `~name~`(UUID myId) { return new D`~name~`(myId); }
auto `~name~`(string myName) { return new D`~name~`(myName); }
auto `~name~`(UUID myId, string myName) { return new D`~name~`(myId, myName); }  
`;
}

void testAttribute(DAttribute attribute) {
  assert(attribute);
}

static this() {
  AttributeRegistry
    // Booleans
    .register(BooleanAttribute)
    // Bytes
    .register(BinaryAttribute)
    .register(ByteAttribute)
    // Chars
    .register(CharAttribute)
    // Chars -> Strings
    .register(AddressLineAttribute)
    .register(AttributeNameAttribute)
    .register(CityNameAttribute)
    .register(ColorNameAttribute)
    .register(CompanyNameAttribute)
    .register(CountryAttribute)
    .register(CountyAttribute)
    .register(LanguageTagAttribute)
    .register(LastNameAttribute)
    .register(LinkAttribute)
    .register(ListAttribute)
    .register(StringAttribute)
    .register(UrlAttribute)
    // Dates
    .register(DateAttribute)
    // DateTimes
    .register(BirthDateAttribute)
    .register(DatetimeAttribute)
    .register(TimeAttribute);
    // Decimals
}

version(test_uim_oops) { unittest {
    writeln(AttributeRegistry["boolean"].name);
    writeln(AttributeRegistry["byte"].name);
    writeln(AttributeRegistry["binary"].name);

    writeln(AttributeRegistry.paths);
  }
}
