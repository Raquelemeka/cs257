//filterpage.js
//9 Jun, 2025
//Rui Shen
window.addEventListener("load", initialize);

function initialize() {
  var typeSelect = document.getElementById("item-type");
  var filtersDiv = document.getElementById("filters");
  var applyButton = document.getElementById("apply-filters");
  var resultsDiv = document.getElementById("results");

 // reconstruct the filter
  typeSelect.onchange = function() {
    filtersDiv.innerHTML = "";
    resultsDiv.innerHTML = "<p>Select filters and click Apply to see results.</p>";

    var t = typeSelect.value;
    if (t === "characters") {
      createDropdown(filtersDiv, "house",["Gryffindor","Slytherin","Ravenclaw","Hufflepuff"]);
      createDropdown(filtersDiv, "gender",["Male","Female"]);
      createDropdown(filtersDiv, "species",["Human","Elf","Goblin","Werewolf"]);
    }
    else if (t === "potions") {
      createTextInput(filtersDiv, "effect");
      createDropdown(filtersDiv, "difficulty",["Beginner","Intermediate","Advanced"]);
    }
    else if (t === "spells") {
      createTextInput(filtersDiv, "effect");
      createDropdown(filtersDiv, "type",["Charm","Curse","Hex","Jinx"]);
    }
  };
//gather all of the selected filters
  applyButton.onclick = function() {
    var t = typeSelect.value;
    if (!t) {
      alert("Please choose Characters, Potions or Spells first.");
      return;
    }

    //non-empty filters, build the API URL
    var params = ["type=" + encodeURIComponent(t)];
    var selects = filtersDiv.getElementsByTagName("select");
    for (var i = 0; i < selects.length; i++) {
      if (selects[i].value) {
        params.push(selects[i].id + "=" + encodeURIComponent(selects[i].value));
      }
    }
    var inputs = filtersDiv.getElementsByTagName("input");
    for (var j = 0; j < inputs.length; j++) {
      if (inputs[j].value) {
        params.push(inputs[j].id + "=" + encodeURIComponent(inputs[j].value));
      }
    }

    var apiPath = "/" + t + "?" + params.slice(1).join("&");  
    var url = getAPIBaseURL() + apiPath;

    fetch(url)
      .then(function(r) {return r.json(); })
      .then(function(items) {
        // if nothing came back, show a message
        if (!items.length) {
          resultsDiv.innerHTML = "<p>No results found.</p>";
          return;
        }
        const current = new URLSearchParams(window.location.search);
        // else build links to each detail page
        let html = "<ul>";
        items.forEach(it => {
          const page = t.slice(0, -1);        
          html += `<li><a href="/${page}?id=${it.id}">${it.name}</a></li>`;
        });
        html += "</ul>";
        resultsDiv.innerHTML = html;
      })
      .catch(function() {
        resultsDiv.innerHTML = "<p>Error fetching data.</p>";
      });
  };

  var params = new URLSearchParams(window.location.search);
  var initialType = params.get("type");
  if (initialType) {
    typeSelect.value = initialType;   
    typeSelect.onchange();             
    applyButton.onclick();  
  }
}

//helpers automatically build, label, and insert HTML 
function createDropdown(parent, id, options) {
  var label = document.createElement("label");
  label.textContent = id.charAt(0).toUpperCase() + id.slice(1) + ": ";
  var sel = document.createElement("select"); sel.id = id;
  var empty = document.createElement("option");
  empty.value = ""; empty.textContent = "--";
  sel.appendChild(empty);
  for (var i = 0; i < options.length; i++) {
    var opt = document.createElement("option");
    opt.value = options[i]; opt.textContent = options[i];
    sel.appendChild(opt);
  }
  label.appendChild(sel);
  parent.appendChild(label);
}

function createTextInput(parent, id) {
  var label = document.createElement("label");
  label.textContent = id.charAt(0).toUpperCase() + id.slice(1) + ": ";
  var inp = document.createElement("input");
  inp.type = "text"; inp.id = id;
  label.appendChild(inp);
  parent.appendChild(label);
}

function getAPIBaseURL() {
  return window.location.protocol + "//" +
         window.location.hostname + ":" +
         window.location.port + "/api";
}
