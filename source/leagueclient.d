module leagueclient;

class LeagueClient {
    private uint appPort;
    private string authToken;

    this(uint appPort, string authToken) {
        this.appPort = appPort;
        this.authToken = authToken;
    }

    public uint getAppPort() {
        return this.appPort;
    }

    public string getAuthToken() {
        return this.authToken;
    }
}