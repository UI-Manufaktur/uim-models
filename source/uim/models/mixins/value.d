module uim.models.mixins.value;

@safe:
import uim.models;

template ValueProperty(string datatype, string name, string path = null, string valueClass = "DStringValue") {
  const char[] ValueProperty = `
    @property `~datatype~` `~name~`() {
      if (auto myValue = cast(`~valueClass~`)values["`~(path ? path : name)~`"]) {
        writeln("Get DValue for `~(path ? path : name)~`");
        return myValue.value;
      }
      writeln("No get DValue for `~(path ? path : name)~`");
      return null;       
    }
    @property O `~name~`(this O)(`~datatype~` newValue) {
      if (auto myValue = cast(`~valueClass~`)values["`~(path ? path : name)~`"]) {
        writeln("Set DValue for `~(path ? path : name)~` with ", newValue);
        myValue.value(newValue);
        return cast(O)this;
      }
      writeln("No set found DValue for `~(path ? path : name)~`");
      return cast(O)this;
    }
  `;
} 

template StringValueProperty(string datatype, string name, string path) {
  const char[] StringValueProperty = `
    @property `~datatype~` `~name~`() {
      if (auto myValue = cast(DStringValue)values["`~(path ? path : name)~`"]) {
        return myValue.value;
      }
      return null;       
    }
    @property O `~name~`(this O)(`~datatype~` newValue) {
      if (auto myValue = cast(DStringValue)values["`~(path ? path : name)~`"]) {
        myValue.value(newValue);
        return cast(O)this;
      }
      return cast(O)this;
    }
  `;
} 