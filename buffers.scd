(
    //read in all samples in "audio" folder to buffers, one dictionary entry for each subfolder
    ~buffers = Dictionary.new;
    PathName((~projectfolder++"audio").standardizePath).folders.do({|folder| 
        ~buffers.add(folder.folderName.asSymbol -> folder.entries.collect({|file|
            Buffer.readChannel(s, file.fullPath, channels: 0);
        }));
    });
)
