// character-detail.js

window.onload = function() {
    var search = window.location.search; 
    var id = null;
    if (search.indexOf('?id=') === 0) {
      id = search.substring(4);  // chop off the first four chars ("?id=")
    }
    if (!id) {
      document.getElementById('char-name').textContent = "No character selected.";
      return;
    }
  
    var nameH = document.getElementById('char-name');
    var img   = document.getElementById('char-portrait');
    var dl    = document.getElementById('properties');
  
    if (!id) {
      nameH.textContent = 'No character selected.';
      return;
    }
  
    nameH.textContent = 'Loading…';
  
    fetch(getAPIBaseURL() + '/characters?limit=1000')
      .then(function(resp) { return resp.json(); })
      .then(function(list) {
        var chr = null;
        for (var j = 0; j < list.length; j++) {
          if (String(list[j].id) === id) {
            chr = list[j];
            break;
          }
        }
        if (!chr) {
          nameH.textContent = 'Character not found.';
          return;
        }
  
        nameH.textContent = chr.name;
        img.src = '/static/portraits/' + chr.id + '.jpg';
        img.alt = chr.name + ' portrait';
  
        img.onerror = function() {
          this.onerror = null;
          this.src = '/static/portraits/mysterious.jpg';
          this.alt = 'Mysterious placeholder';
        };
  
       
        dl.innerHTML = '';  
        var props = [
          ['House', chr.house],
          ['Wand',chr.wand],
          ['Patronus', chr.patronus],
          ['Species',chr.species],
          ['Gender', chr.gender],
          ['Hair Color',chr.hair_color],
          ['Blood Status',chr.blood_status]
        ];
        for (var k = 0; k < props.length; k++) {
          var dt = document.createElement('dt');
          dt.textContent = props[k][0] + ':';
          var dd = document.createElement('dd');
          dd.textContent = props[k][1] || 'Unknown';
          dl.appendChild(dt);
          dl.appendChild(dd);
        }
      })
      .catch(function(err) {
        console.error(err);
        nameH.textContent = 'Error loading character.';
      });
  };
  window.addEventListener('load', initializeCharacterDetail);
  // helper to build the base API URL
  function getAPIBaseURL() {
    return location.protocol + '//' +
           location.hostname + ':' +
           location.port + '/api';
  }
  