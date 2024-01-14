module connector;

import std.conv;
import std.stdio;
import std.algorithm;
import std.array;
import std.process;
import std.regex;
import leagueclient;

class Connector
{
    // Vanguard around the corner. Linux support does not matter.
    static LeagueClient connect()
    {
        auto pidList = execute(["tasklist"]).output.split("\r\n");
        auto pwshCmd = "Get-WmiObject Win32_Process -Filter \"name = 'LeagueClientUX.exe'\" | Select-Object CommandLine";
        auto pwshResults = execute(["powershell", pwshCmd]);
        auto re = regex(`"([^"]+)"`);
        auto matches = pwshResults.output.matchAll(re);

        string authToken;
        string appPort;
        foreach (match; matches)
        {
            if (!match[1].findSplit("="))
                continue;

            if (match[1].findSplit("riotclient-auth-token"))
            {
                authToken = match[1].split("=")[1];
                continue;
            }

            if (match[1].findSplit("riotclient-app-port"))
            {
                appPort = match[1].split("=")[1];
                continue;
            }

        }
        auto leagueClient = new LeagueClient(appPort.to!uint, authToken);
        return leagueClient;
    }
}
