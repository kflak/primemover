(
    {
        //Isabell sensor on
        [12].do{|id, idx| ~deltaTriggers[\water][idx].play(out: ~bus[\master], target: ~group[\mix]) };
        // if(~hasQmidiNet){ ~light[\isaSolo].play; };
    }
)
