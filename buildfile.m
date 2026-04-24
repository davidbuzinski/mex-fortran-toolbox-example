function plan = buildfile
import matlab.buildtool.tasks.*;
import matlab.buildtool.Task;

plan = buildplan(localfunctions);

plan("clean") = CleanTask;
plan("check") = CodeIssuesTask;
plan("mex") = MexTask.forEachFile("fortran/**/*.F", "toolbox");
plan("test") = TestTask(Dependencies="mex");
plan("package") = Task(Description="Package toolbox", ...
    Actions=@packageToolbox, ...
    Dependencies= ["check" "test" "mex"]);

plan.DefaultTasks = "package";
end

function packageToolbox(~)
% Create an mltbx toolbox package
identifier = "e5169f97-e7db-4a56-8461-01206cc29a42";
toolboxFolder = "toolbox";

opts = matlab.addons.toolbox.ToolboxOptions(toolboxFolder,identifier);
opts.ToolboxName = "Mex Example";
opts.MinimumMatlabRelease = "R2025b";

matlab.addons.toolbox.packageToolbox(opts);
end