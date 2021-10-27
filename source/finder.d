module finder;

import std;

string[] findFiles(string[] locations)
{
    string[] ret;
    foreach(loc; locations)
    {
        if(loc.isFile)
            ret ~= loc;
        else
        {
            foreach(entry; dirEntries(loc, "*.lst", SpanMode.breadth))
                ret ~= entry;
        }
    }
    
    return ret;
}