// potion-detail.js

window.onload = function() {
    var search = window.location.search;
    var id     = null;
  
   
    if (search.indexOf('?id=') === 0) {
      id = search.substring(4); 
    }
  
    var nameH = document.getElementById('potion-name');
    var dl    = document.getElementById('properties');
  
    if (!id) {
      nameH.textContent = 'No potion selected.';
      return;
    }
    
    nameH.textContent = 'Loading…';
  
    fetch(getAPIBaseURL() + '/potions?limit=1000')
      .then(function(resp) {
        return resp.json();
      })
      .then(function(list) {
  
        var pot = null;
        for (var i = 0; i < list.length; i++) {
          if (String(list[i].id) === id) {
            pot = list[i];
            break;
          }
        }
  
  
        if (!pot) {
          nameH.textContent = 'Potion not found.';
          return;
        }
  
        nameH.textContent = pot.name;
        dl.innerHTML = '';  
  
        var props = [
          ['Effect', pot.effect],
          ['Difficulty level', pot.difficulty_level],
          ['Characteristics', pot.characteristics]
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
        nameH.textContent = 'Error loading potion.';
      });
  };
  
  window.addEventListener('load', initializePotionDetail);
  
  function getAPIBaseURL() {
    return window.location.protocol + '//' +
           window.location.hostname + ':' +
           window.location.port + '/api';
  }
  