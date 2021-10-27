module commands;

import std, jcli, finder, parser, emitter;

@CommandDefault("Searches any provided folders for .lst files, and then produces a coverage report.")
struct DefaultCommand 
{
    @ArgOverflow
    string[] locations;

    void onExecute()
    {
        const files = findFiles(this.locations);
        CoverageFile[] coverages;
        foreach(f; files)
            coverages ~= parseFile(f);
        const output = emit(coverages);
        std.file.write("index.html", output);
    }
}