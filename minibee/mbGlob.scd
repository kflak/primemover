(
    //global settings for minibees
    ~mbResamplingFreq = 20;
    ~mbIDs = [10, 11, 12, 13, 14];
    ~mbData = IdentityDictionary.new;
    ~mbIDs.collect{|id| ~mbData.put(id, MBData.new(id))};
)

