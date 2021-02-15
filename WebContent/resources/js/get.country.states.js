// Generate states/provices when country is selected
function getStates(sCountryId, sStateId) {
    var sCountry = document.getElementById(sCountryId);
    var sState = document.getElementById(sStateId);
    sState.innerHTML = "";

    // Populate states/provices according to selected country
    var country = sCountry.options[sCountry.selectedIndex].text;
    switch (country) {
        case "Canada":
            var states = [
                            "Alberta", "British Columbia", "Manitoba", "New Brunswick",
                            "Newfoundland and Labrador", "Northwest Territories", "Nova Scotia", "Nunavut",
                            "Ontario", "Prince Edward Island", "Quebec", "Saskatchewan",
                            "Yukon"
                         ];
            break;
        case "United States":
            var states = [
                            "Alaska",
                            "Alabama",
                            "Arkansas",
                            "American Samoa",
                            "Arizona",
                            "California",
                            "Colorado",
                            "Connecticut",
                            "District of Columbia",
                            "Delaware",
                            "Florida",
                            "Georgia",
                            "Guam",
                            "Hawaii",
                            "Iowa",
                            "Idaho",
                            "Illinois",
                            "Indiana",
                            "Kansas",
                            "Kentucky",
                            "Louisiana",
                            "Massachusetts",
                            "Maryland",
                            "Maine",
                            "Michigan",
                            "Minnesota",
                            "Missouri",
                            "Mississippi",
                            "Montana",
                            "North Carolina",
                            "North Dakota",
                            "Nebraska",
                            "New Hampshire",
                            "New Jersey",
                            "New Mexico",
                            "Nevada",
                            "New York",
                            "Ohio",
                            "Oklahoma",
                            "Oregon",
                            "Pennsylvania",
                            "Puerto Rico",
                            "Rhode Island",
                            "South Carolina",
                            "South Dakota",
                            "Tennessee",
                            "Texas",
                            "Utah",
                            "Virginia",
                            "Virgin Islands",
                            "Vermont",
                            "Washington",
                            "Wisconsin",
                            "West Virginia",
                            "Wyoming"
                         ];
            break;
        default:
            var states = [];
    }

    for (var option in states) {
        var newOption = document.createElement("option");
        newOption.innerHTML = states[option];
        sState.options.add(newOption);
    }
}