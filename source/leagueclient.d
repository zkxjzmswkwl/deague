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

    private string request(string endpoint) {
        auto url = "https://127.0.0.1:" ~ this.appPort.to!string ~ endpoint;
        auto http = HTTP();
        http.handle.set(CurlOption.ssl_verifypeer, 0);
        http.addRequestHeader("Authorization", this.encodeBasicAuth());
        return get(url, http).to!string;
    }

    public CurrentSummoner getCurrentSummoner() {
        auto resp = this.request("/lol-summoner/v1/current-summoner");
	    return decodeJson!(CurrentSummoner)(resp);
    }

    public uint getAppPort() {
        return this.appPort;
    }

    public string getAuthToken() {
        return this.authToken;
    }
}