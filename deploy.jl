using ArgParse
using ArtifactUtils

function parse_commandline()
    s = ArgParseSettings(description="upload folder to gist")

    @add_arg_table s begin
        "dir"
            help = "deploy target directory"
            required = true
    end

    return parse_args(s)
end

parsed_args = parse_commandline()
dir::String = parsed_args["dir"]
if !isdir(dir)
    println("[Error] given dir not exist: $dir")
    exit(1)
end

println("dir: $dir")