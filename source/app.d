import std, jcli, commands;

int main(string[] args)
{
	return (new CommandLineInterface!commands).parseAndExecute(args);
}
