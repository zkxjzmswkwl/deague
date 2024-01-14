import std.stdio;
import types;
import leagueclient;

void main()
{
	auto leagueClient = new LeagueClient();
	writeln(leagueClient.getCurrentSummoner().gameName);
	writeln(leagueClient.getAccountAndSummonerIds().accountId);
	writeln(leagueClient.getSummonerProfile());
	leagueClient.setSummonerIcon(1337);
}
