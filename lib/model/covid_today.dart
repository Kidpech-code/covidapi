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
        // ignore: unnecessary_null_comparison
        "updated": updated == null ? null : updated,
        // ignore: unnecessary_null_comparison
        "country": country == null ? null : country,
        // ignore: unnecessary_null_comparison
        "cases": cases == null ? null : cases,
        // ignore: unnecessary_null_comparison
        "todayCases": todayCases == null ? null : todayCases,
        // ignore: unnecessary_null_comparison
        "deaths": covidTodayDeaths == null ? null : covidTodayDeaths,
        // ignore: unnecessary_null_comparison
        "todayDeaths": todayDeaths == null ? null : todayDeaths,
        // ignore: unnecessary_null_comparison
        "recovered": covidTodayRecovered == null ? null : covidTodayRecovered,
        // ignore: unnecessary_null_comparison
        "todayRecovered": todayRecovered == null ? null : todayRecovered,
        // ignore: unnecessary_null_comparison
        "active": active == null ? null : active,
        // ignore: unnecessary_null_comparison
        "critical": critical == null ? null : critical,
        // ignore: unnecessary_null_comparison
        "casesPerOneMillion": casesPerOneMillion == null ? null : casesPerOneMillion,
        // ignore: unnecessary_null_comparison
        "deathsPerOneMillion": deathsPerOneMillion == null ? null : deathsPerOneMillion,
        // ignore: unnecessary_null_comparison
        "tests": tests == null ? null : tests,
        // ignore: unnecessary_null_comparison
        "testsPerOneMillion": testsPerOneMillion == null ? null : testsPerOneMillion,
        // ignore: unnecessary_null_comparison
        "population": population == null ? null : population,
        // ignore: unnecessary_null_comparison
        "continent": continent == null ? null : continent,
        // ignore: unnecessary_null_comparison
        "oneCasePerPeople": oneCasePerPeople == null ? null : oneCasePerPeople,
        // ignore: unnecessary_null_comparison
        "oneDeathPerPeople": oneDeathPerPeople == null ? null : oneDeathPerPeople,
        // ignore: unnecessary_null_comparison
        "oneTestPerPeople": oneTestPerPeople == null ? null : oneTestPerPeople,
        // ignore: unnecessary_null_comparison
        "activePerOneMillion": activePerOneMillion == null ? null : activePerOneMillion,
        // ignore: unnecessary_null_comparison
        "recoveredPerOneMillion": recoveredPerOneMillion == null ? null : recoveredPerOneMillion,
        // ignore: unnecessary_null_comparison
        "criticalPerOneMillion": criticalPerOneMillion == null ? null : criticalPerOneMillion,
        // ignore: unnecessary_null_comparison
        "Confirmed": confirmed == null ? null : confirmed,
        // ignore: unnecessary_null_comparison
        "Recovered": recovered == null ? null : recovered,
        // ignore: unnecessary_null_comparison
        "Hospitalized": hospitalized == null ? null : hospitalized,
        // ignore: unnecessary_null_comparison
        "Deaths": deaths == null ? null : deaths,
        // ignore: unnecessary_null_comparison
        "NewConfirmed": newConfirmed == null ? null : newConfirmed,
        // ignore: unnecessary_null_comparison
        "NewRecovered": newRecovered == null ? null : newRecovered,
        // ignore: unnecessary_null_comparison
        "NewHospitalized": newHospitalized == null ? null : newHospitalized,
        // ignore: unnecessary_null_comparison
        "NewDeaths": newDeaths == null ? null : newDeaths,
        // ignore: unnecessary_null_comparison
        "UpdateDate": updateDate == null ? null : updateDate,
        // ignore: unnecessary_null_comparison
        "DevBy": devBy == null ? null : devBy,
    };
}
