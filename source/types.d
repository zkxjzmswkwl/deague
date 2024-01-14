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

