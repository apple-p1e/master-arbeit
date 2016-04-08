function data = readData(filename)
% Read data from .txt and convert to decimal from hex.
% Returns a cell type value.

    data = {};
    fid = fopen(filename,'r');
    if (fid < 0) 
        printf('Error:could not open file\n')
    else
        while ~feof(fid),
            line = fgetl(fid);
            if line
                line = hex2dec(strsplit(line));
                data{end+1} = line;
            end
        end;
        fclose(fid);
    end; 
end