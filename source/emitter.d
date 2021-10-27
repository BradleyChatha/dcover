module emitter;

import std, parser;

const TEMPLATE = import("page.html");

string emit(CoverageFile[] coverages)
{
    Appender!(char[]) output;

    foreach(cov; coverages)
    {
        output.put("{");
        output.put(format!`file:"%s",`(cov.file));
        output.put(format!`coverage:%s,`(cov.totalCoverage));
        output.put("lines:[");
        foreach(i, line; cov.lines)
        {
            output.put("{");
            output.put(format!`number:%s,`(i));
            output.put(format!`tracked:%s,`(line.tracked));
            output.put(format!`hits:%s,`(line.hits));
            output.put(format!`text:"%s",`(line.text.replace("\\", "\\\\").replace("\"", "\\\"")));
            output.put("},");
        }
        output.put("]");
        output.put("},");
    }

    return format!TEMPLATE(output.data);
}