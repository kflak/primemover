(
    //global settings for minibees
    ~mbResamplingFreq = 20;
    ~mbIDs = [9, 10, 11, 12, 13, 14, 15];
    ~mbData = IdentityDictionary.new;
    ~mbIDs.collect{|id| ~mbData.put(id, MBData.new(id))};
)

