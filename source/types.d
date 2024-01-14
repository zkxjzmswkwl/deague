module types;

struct RerollPoints {
    int currentPoints;
    int maxRolls;
    int numberOfRolls;
    int pointsCostToRoll;
    int pointsToReroll;
}

struct CurrentSummoner {
    long accountId;
    string displayName;
    string gameName;
    string internalName;
    bool nameChangeFlag;
    int percentCompleteForNextLevel;
    string privacy;
    int profileIconId;
    string puuid;
    RerollPoints rerollPoints;
    long summonerId;
    int summonerLevel;
    string tagLine;
    int xpSinceLastLevel;
    int xpUntilNextLevel;
}

struct AccountAndSummonerIds {
    long accountId;
    long summonerId;
}

// TODO: Dackson doesn't support this shit yet. 
struct Autofill {
    struct Entry {
        bool autoFillEnable;
        bool autoFillProtectedForPomos;
        bool autoFillProtectedForStreaking;
        int queueId;
    }

    Entry[] queues;
}

struct Regalia {
    int bannerType;
    int crestType;
    int selectedPrestigeCrest;
}

struct SummonerProfileRegaliaStr {
    int backgroundSkinId;
    string regalia;
}

struct SummonerProfile {
    this(int bgId, Regalia regalia) {
        this.backgroundSkinId = bgId;
        this.regalia = regalia;
    }
    int backgroundSkinId;
    Regalia regalia;
}

struct SummonerIconPayload {
    this(int profileIconId) {
        this.inventoryToken = "string";
        this.profileIconId = profileIconId;
    }
    string inventoryToken;
    int profileIconId;
}