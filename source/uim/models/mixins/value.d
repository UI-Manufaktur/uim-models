module uim.models.mixins.value;

@safe:
import uim.models;

/* template ValueProperty(string name, string datatype, string valueClass) {
  const char[] ValueProperty = `
    @property `~datatype~` `~name~`() {
      if (auto myValue = cast(`~valueClass~`)values["`~name~`"]) {
        return myValue.value;
      }
      return null;       
    }
    @property O `~name~`(this O)(`~datatype~` newValue) {
      if (auto myValue = cast(`~valueClass~`)values["`~name~`"]) {
        myValue.value = newValue;
      }
      return cast(O)this;
    }
  `;
} */