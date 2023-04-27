module uim.models.mixins.entity;

template EntityThis(string name) {
  const char[] EntityThis = `
    this() { super(); this.className("`~name~`"); }
    this(UUID myId) { this().id(myId).name("`~name~`-"~this.id.toString); }
    this(string myName) { this().name(myName); }
    this(UUID myId, string myName) { this(myId).name(myName); }
    this(Json aJson) { this().fromJson(aJson); }

    override DEntity create() { return `~name~`; }
  `;
}

template EntityCalls(string name) {
  const char[] EntityCalls = `
    auto `~name~`() { return new D`~name~`; } 
    auto `~name~`(UUID myId) { return new D`~name~`(myId); } 
    auto `~name~`(string myName) { return new D`~name~`(myName); } 
    auto `~name~`(UUID myId, string myName) { return new D`~name~`(myId, myName); } 
    auto `~name~`(Json json) { return new D`~name~`(json); } 
  `;
}
