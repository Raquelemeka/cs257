// character-detail.js
//9 Jun, 2025
//Rui Shen

window.addEventListener("load", initialize);

function initialize() {
  var search = window.location.search;
  var id = null;
  if (search.indexOf("?id=") === 0) {
    id = search.substring(4).split("&")[0];
  }

  var nameH = document.getElementById("char-name");
  var img = document.getElementById("char-portrait");
  var dl = document.getElementById("properties");

  if (!id) {
    nameH.textContent = "No character selected.";
    return;
  }
  nameH.textContent = "Loading…";

  fetch(getAPIBaseURL() + "/characters?limit=1000")
    .then(function(resp) { return resp.json(); })
    .then(function(list) {
      var chr = null;
      for (var i = 0; i < list.length; i++) {
        if (String(list[i].id)=== id) {
          chr = list[i];
          break;
        }
      }

      if (!chr) {
        nameH.textContent = "Character not found.";
        return;
      }

      nameH.textContent = chr.name;
      img.src  = "/static/portraits/" + chr.id + ".jpg";
      img.alt  = chr.name + " portrait";

      
      img.onerror = function() {
        this.onerror = null;
        this.src = "/static/portraits/mysterious.jpg";
        this.alt = "Mysterious placeholder";
      };

      dl.innerHTML = "";  
      var props = [
        ["House", chr.house],
        ["Wand", chr.wand],
        ["Patronus",chr.patronus],
        ["Species",chr.species],
        ["Gender", chr.gender],
        ["Hair Color", chr.hair_color],
        ["Blood Status",chr.blood_status]
      ];
      for (var j = 0; j < props.length; j++) {
        var dt = document.createElement("dt");
        var dd = document.createElement("dd");
        dt.textContent = props[j][0] + ":";
        dd.textContent = props[j][1] || "Unknown";
        dl.appendChild(dt);
        dl.appendChild(dd);
      }
    })
    .catch(function(err) {
      console.error(err);
      nameH.textContent = "Error loading character.";
    });
}

function getAPIBaseURL() {
  return window.location.protocol + "//" +
         window.location.hostname + ":" +
         window.location.port + "/api";
}
