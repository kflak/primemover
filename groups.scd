(
    ~group = Dictionary();
    ~group.put(\in, Group.new);
    ~group.put(\instr, Group.after(~group[\in]));
    ~group.put(\fx, Group.after(~group[\instr]));
    ~group.put(\mix, Group.after(~group[\fx]));
    ~group.put(\master, Group.after(~group[\mix]));
)
