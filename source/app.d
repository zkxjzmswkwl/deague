import std.stdio;
import connector;

void main()
{
	auto leagueClient = Connector.connect();
	writeln(leagueClient.getAppPort());
	writeln(leagueClient.getAuthToken());
}
