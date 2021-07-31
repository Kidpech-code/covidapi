import 'dart:convert';

CovidToday covidTodayFromJson(String str) => CovidToday.fromJson(json.decode(str));

String covidTodayToJson(CovidToday data) => json.encode(data.toJson());

class CovidToday {
    CovidToday({
        required this.updated,
        required this.country,
        required this.cases,
        required this.todayCases,
        required this.covidTodayDeaths,
        required this.todayDeaths,
        required this.covidTodayRecovered,
        required this.todayRecovered,
        required this.active,
        required this.critical,
        required this.casesPerOneMillion,
        required this.deathsPerOneMillion,
        required this.tests,
        required this.testsPerOneMillion,
        required this.population,
        required this.continent,
        required this.oneCasePerPeople,
        required this.oneDeathPerPeople,
        required this.oneTestPerPeople,
        required this.activePerOneMillion,
        required this.recoveredPerOneMillion,
        required this.criticalPerOneMillion,
        required this.confirmed,
        required this.recovered,
        required this.hospitalized,
        required this.deaths,
        required this.newConfirmed,
        required this.newRecovered,
        required this.newHospitalized,
        required this.newDeaths,
        required this.updateDate,
        required this.devBy,
    });

    int updated;
    String country;
    int cases;
    int todayCases;
    int covidTodayDeaths;
    int todayDeaths;
    int covidTodayRecovered;
    int todayRecovered;
    int active;
    int critical;
    int casesPerOneMillion;
    int deathsPerOneMillion;
    int tests;
    int testsPerOneMillion;
    int population;
    String continent;
    int oneCasePerPeople;
    int oneDeathPerPeople;
    int oneTestPerPeople;
    double activePerOneMillion;
    double recoveredPerOneMillion;
    double criticalPerOneMillion;
    int confirmed;
    int recovered;
    int hospitalized;
    int deaths;
    int newConfirmed;
    int newRecovered;
    int newHospitalized;
    int newDeaths;
    String updateDate;
    String devBy;

    factory CovidToday.fromJson(Map<String, dynamic> json) => CovidToday(
        updated: json["updated"] == null ? null : json["updated"],
        country: json["country"] == null ? null : json["country"],
        cases: json["cases"] == null ? null : json["cases"],
        todayCases: json["todayCases"] == null ? null : json["todayCases"],
        covidTodayDeaths: json["deaths"] == null ? null : json["deaths"],
        todayDeaths: json["todayDeaths"] == null ? null : json["todayDeaths"],
        covidTodayRecovered: json["recovered"] == null ? null : json["recovered"],
        todayRecovered: json["todayRecovered"] == null ? null : json["todayRecovered"],
        active: json["active"] == null ? null : json["active"],
        critical: json["critical"] == null ? null : json["critical"],
        casesPerOneMillion: json["casesPerOneMillion"] == null ? null : json["casesPerOneMillion"],
        deathsPerOneMillion: json["deathsPerOneMillion"] == null ? null : json["deathsPerOneMillion"],
        tests: json["tests"] == null ? null : json["tests"],
        testsPerOneMillion: json["testsPerOneMillion"] == null ? null : json["testsPerOneMillion"],
        population: json["population"] == null ? null : json["population"],
        continent: json["continent"] == null ? null : json["continent"],
        oneCasePerPeople: json["oneCasePerPeople"] == null ? null : json["oneCasePerPeople"],
        oneDeathPerPeople: json["oneDeathPerPeople"] == null ? null : json["oneDeathPerPeople"],
        oneTestPerPeople: json["oneTestPerPeople"] == null ? null : json["oneTestPerPeople"],
        activePerOneMillion: json["activePerOneMillion"] == null ? null : json["activePerOneMillion"].toDouble(),
        recoveredPerOneMillion: json["recoveredPerOneMillion"] == null ? null : json["recoveredPerOneMillion"].toDouble(),
        criticalPerOneMillion: json["criticalPerOneMillion"] == null ? null : json["criticalPerOneMillion"].toDouble(),
        confirmed: json["Confirmed"] == null ? null : json["Confirmed"],
        recovered: json["Recovered"] == null ? null : json["Recovered"],
        hospitalized: json["Hospitalized"] == null ? null : json["Hospitalized"],
        deaths: json["Deaths"] == null ? null : json["Deaths"],
        newConfirmed: json["NewConfirmed"] == null ? null : json["NewConfirmed"],
        newRecovered: json["NewRecovered"] == null ? null : json["NewRecovered"],
        newHospitalized: json["NewHospitalized"] == null ? null : json["NewHospitalized"],
        newDeaths: json["NewDeaths"] == null ? null : json["NewDeaths"],
        updateDate: json["UpdateDate"] == null ? null : json["UpdateDate"],
        devBy: json["DevBy"] == null ? null : json["DevBy"],
    );

    Map<String, dynamic> toJson() => {
        "updated": updated == null ? null : updated,
        "country": country == null ? null : country,
        "cases": cases == null ? null : cases,
        "todayCases": todayCases == null ? null : todayCases,
        "deaths": covidTodayDeaths == null ? null : covidTodayDeaths,
        "todayDeaths": todayDeaths == null ? null : todayDeaths,
        "recovered": covidTodayRecovered == null ? null : covidTodayRecovered,
        "todayRecovered": todayRecovered == null ? null : todayRecovered,
        "active": active == null ? null : active,
        "critical": critical == null ? null : critical,
        "casesPerOneMillion": casesPerOneMillion == null ? null : casesPerOneMillion,
        "deathsPerOneMillion": deathsPerOneMillion == null ? null : deathsPerOneMillion,
        "tests": tests == null ? null : tests,
        "testsPerOneMillion": testsPerOneMillion == null ? null : testsPerOneMillion,
        "population": population == null ? null : population,
        "continent": continent == null ? null : continent,
        "oneCasePerPeople": oneCasePerPeople == null ? null : oneCasePerPeople,
        "oneDeathPerPeople": oneDeathPerPeople == null ? null : oneDeathPerPeople,
        "oneTestPerPeople": oneTestPerPeople == null ? null : oneTestPerPeople,
        "activePerOneMillion": activePerOneMillion == null ? null : activePerOneMillion,
        "recoveredPerOneMillion": recoveredPerOneMillion == null ? null : recoveredPerOneMillion,
        "criticalPerOneMillion": criticalPerOneMillion == null ? null : criticalPerOneMillion,
        "Confirmed": confirmed == null ? null : confirmed,
        "Recovered": recovered == null ? null : recovered,
        "Hospitalized": hospitalized == null ? null : hospitalized,
        "Deaths": deaths == null ? null : deaths,
        "NewConfirmed": newConfirmed == null ? null : newConfirmed,
        "NewRecovered": newRecovered == null ? null : newRecovered,
        "NewHospitalized": newHospitalized == null ? null : newHospitalized,
        "NewDeaths": newDeaths == null ? null : newDeaths,
        "UpdateDate": updateDate == null ? null : updateDate,
        "DevBy": devBy == null ? null : devBy,
    };
}
