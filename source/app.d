import std.stdio;
import dackson;
import leagueclient;
import types;

void main()
{
	auto leagueClient = new LeagueClient();
	writeln(leagueClient.getCurrentSummoner().gameName);
}
