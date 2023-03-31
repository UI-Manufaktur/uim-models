module uim.models.mixins.value;

@safe:
import uim.models;

template ValueProperty(string datatype, string name, string path = null, string valueClass = "DStringValue") {
  const char[] ValueProperty = `
    @property `~datatype~` `~name~`() {
      if (auto myValue = cast(`~valueClass~`)valueOfKey("`~(path ? path : name)~`")) {
        return myValue.value;
      }
      return null;       
    }
    @property O `~name~`(this O)(`~datatype~` newValue) {
      if (auto myValue = cast(`~valueClass~`)valueOfKey("`~(path ? path : name)~`")) {
        myValue.value(newValue);
        return cast(O)this;
      }
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