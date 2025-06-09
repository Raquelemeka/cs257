// static/spell-detail.js
//9 Jun, 2025
//Rui Shen

window.addEventListener('load', initialize);

function initialize() {
  
  var search = window.location.search; 
  var id     = null;
  if (search.indexOf('?id=') === 0) {
    id = search.substring(4);           
  }

  var nameH = document.getElementById('spell-name');
  var dl= document.getElementById('properties');

  if (!id) {
    nameH.textContent = 'No spell selected.';
    return;
  }

  nameH.textContent = 'Loading…';

  fetch(getAPIBaseURL() + '/spells?limit=1000')
    .then(function(response) {
      return response.json();
    })
    .then(function(list) {

      var spell = null;
      for (var i = 0; i < list.length; i++) {
        if (String(list[i].id) === id) {
          spell = list[i];
          break;
        }
      }
 
      if (!spell) {
        nameH.textContent = 'Spell not found.';
        return;
      }

      nameH.textContent = spell.name;
      dl.innerHTML = '';  

      var props = [
        ['Name', spell.name],
        ['Incantation',spell.incantation],
        ['Type',spell.type],
        ['Effect',spell.effect],
        ['Light',spell.light]
      ];

      for (var j = 0; j < props.length; j++) {
        var dt = document.createElement('dt');
        dt.textContent = props[j][0] + ':';
        var dd = document.createElement('dd');
        dd.textContent = props[j][1] || 'Unknown';
        dl.appendChild(dt);
        dl.appendChild(dd);
      }
    })
    .catch(function(err) {
      console.error(err);
      nameH.textContent = 'Error loading spell.';
    });
}

function getAPIBaseURL() {
  return window.location.protocol + '//' +
         window.location.hostname + ':' +
         window.location.port + '/api';
}
