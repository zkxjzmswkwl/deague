import std.stdio;
import leagueclient;

void main()
{
	auto leagueClient = new LeagueClient();
	writeln(leagueClient.getCurrentSummoner().gameName);
	writeln(leagueClient.getAccountAndSummonerIds().accountId);
	writeln(leagueClient.getSummonerProfile());
}
