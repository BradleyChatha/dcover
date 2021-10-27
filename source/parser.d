module parser;

import std;

struct CoverageFile
{
    Line[] lines;
    int totalCoverage;
    string file;
}

struct Line
{
    bool tracked;
    uint hits;
    string text;
}

CoverageFile parseFile(string file)
{
    const text = readText(file);
    CoverageFile f;

    foreach(line; text.lineSplitter)
    {
        const splitIndex = line.countUntil('|');
        if(splitIndex < 0)
        {
            const reg = regex(`(\d+)%`);
            const match = line.matchFirst(reg);
            if(!match.empty)
            {
                f.totalCoverage = match[1].to!uint;
                const spaceIndex = line.countUntil(' ');
                f.file = line[0..spaceIndex];
            }
        }
        else
        {
            Line l;
            const hits = line[0..splitIndex];
            const lineText = line[splitIndex+1..$];
            l.text = lineText;
            import std.uni : isWhite;
            if(hits.all!(c => c.isWhite))
            {
                l.tracked = false;
            }
            else
            {
                l.tracked = true;
                l.hits = hits.strip.to!uint;
            }
            f.lines ~= l;
        }
    }

    return f;
}