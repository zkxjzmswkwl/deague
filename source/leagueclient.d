module leagueclient;

import std.stdio;
import std.base64;
import std.string;
import std.conv;
import etc.c.curl : CurlOption;
import std.net.curl;
import std.file;
import dackson;
import types;


class LeagueClient {
    private uint appPort;
    private string authToken;

    this() {
        auto lockfilePath = "C:\\Riot Games\\League of Legends\\lockfile";
        auto lockfileContents = read(lockfilePath).to!string.split(":");
        this.appPort = lockfileContents[2].to!uint;
        this.authToken = lockfileContents[3];
    }

    private string encodeBasicAuth() {
        auto ret = "riot:" ~ authToken;
        return "Basic " ~ cast(string)Base64.encode(cast(ubyte[])ret);
    }

    private string get(string endpoint) {
        auto url = "https://127.0.0.1:" ~ this.appPort.to!string ~ endpoint;
        auto http = HTTP();
        http.handle.set(CurlOption.ssl_verifypeer, 0);
        http.addRequestHeader("Authorization", this.encodeBasicAuth());
        return std.net.curl.get(url, http).to!string;
    }

    private string put(string endpoint, string payload) {
        auto url = "https://127.0.0.1:" ~ this.appPort.to!string ~ endpoint;
        auto http = HTTP();
        http.handle.set(CurlOption.ssl_verifypeer, 0);
        http.addRequestHeader("Authorization", this.encodeBasicAuth());
        http.addRequestHeader("Content-Type", "application/json");
        return std.net.curl.put(url, payload, http).to!string;
    }

    public CurrentSummoner getCurrentSummoner() {
        auto resp = this.get("/lol-summoner/v1/current-summoner");
	    return decodeJson!(CurrentSummoner)(resp);
    }

    public AccountAndSummonerIds getAccountAndSummonerIds() {
        auto resp = this.get("/lol-summoner/v1/current-summoner/account-and-summoner-ids");
	    return decodeJson!(AccountAndSummonerIds)(resp);
    }

    public SummonerProfile* getSummonerProfile() {
        auto resp = this.get("/lol-summoner/v1/current-summoner/summoner-profile");
        auto obj = decodeJson!(SummonerProfileRegaliaStr)(resp);
	    return new SummonerProfile(obj.backgroundSkinId, decodeJson!(Regalia)(obj.regalia));
    }

    public void setSummonerIcon(int iconId) {
        auto iconPayload = SummonerIconPayload(iconId);
        this.put("/lol-summoner/v1/current-summoner/icon", encodeJson(iconPayload));
    }

    public uint getAppPort() {
        return this.appPort;
    }

    public string getAuthToken() {
        return this.authToken;
    }
}