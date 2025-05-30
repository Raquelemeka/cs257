//webapp.js
//Rui, Raquel
//29 May, 2025


window.onload = function() {
  loadCharacters();
  loadPotions();
  loadSpells();

  var input     = document.getElementById('global-search');
  var suggList  = document.getElementById('search-suggestions');
  var searchBtn = document.getElementById('search-btn');

  input.oninput = function() {
    showSuggestions(input.value);
  };

  document.body.onclick = function(e) {
    if (e.target !== input) {
      suggList.style.display = 'none';
    }
  };

  searchBtn.onclick = function() {
    var q = input.value.trim();
    if (q !== '') {
      window.location = '/search?q=' + encodeURIComponent(q);
    }
  };

  // side-menu
  document.getElementById('open-menu').onclick  = openMenu;
  document.getElementById('close-menu').onclick = closeMenu;
  document.getElementById('menu-overlay').onclick = closeMenu;
};

function apiUrl(path) {
  return window.location.protocol + '//' +
         window.location.hostname + ':' +
         window.location.port +
         '/api' + path;
}


function loadCharacters() {
  var ul = document.getElementById('character-list');
  ul.innerHTML = '<li>Loading…</li>';
  fetch(apiUrl('/characters?limit=200'))
    .then(function(r) { return r.json(); })
    .then(function(chars) {
      ul.innerHTML = '';
      for (var i = 0; i < chars.length; i++) {
        var c = chars[i];
        var li = document.createElement('li');
        var a  = document.createElement('a');
        a.href = '/character?id=' + c.id;
        a.textContent = c.name;
        li.appendChild(a);
        ul.appendChild(li);
      }
    })
    .catch(function() {
      ul.innerHTML = '<li>Error loading characters.</li>';
    });
}


function loadPotions() {
  var ul = document.getElementById('potion-list');
  ul.innerHTML = '<li>Loading…</li>';
  fetch(apiUrl('/potions?limit=200'))
    .then(function(r) { return r.json(); })
    .then(function(pots) {
      ul.innerHTML = '';
      for (var i = 0; i < pots.length; i++) {
        var p = pots[i];
        var li = document.createElement('li');
        var a  = document.createElement('a');
        a.href = '/potion?id=' + p.id;
        a.textContent = p.name;
        li.appendChild(a);
        ul.appendChild(li);
      }
    })
    .catch(function() {
      ul.innerHTML = '<li>Error loading potions.</li>';
    });
}


function loadSpells() {
  var ul = document.getElementById('spell-list');
  ul.innerHTML = '<li>Loading…</li>';
  fetch(apiUrl('/spells?limit=200'))
    .then(function(r) { return r.json(); })
    .then(function(spells) {
      ul.innerHTML = '';
      for (var i = 0; i < spells.length; i++) {
        var s = spells[i];
        var li = document.createElement('li');
        var a  = document.createElement('a');
        a.href = '/spell?id=' + s.id;
        a.textContent = s.name;
        li.appendChild(a);
        ul.appendChild(li);
      }
    })
    .catch(function() {
      ul.innerHTML = '<li>Error loading spells.</li>';
    });
}

// suggestion bar
function showSuggestions(query) {
  var ul = document.getElementById('search-suggestions');
  ul.innerHTML = '';          
  if (query === '') {
    ul.style.display = 'none';
    return;
  }
  ul.style.display = 'block'; 

  // characters
  fetch(apiUrl('/characters?name=' + encodeURIComponent(query) + '&limit=5'))
    .then(function(r) { return r.json(); })
    .then(function(chars) {
      addSuggestions('character', chars);
      // potions
      return fetch(apiUrl('/potions?name=' + encodeURIComponent(query) + '&limit=5'));
    })
    .then(function(r) { return r.json(); })
    .then(function(pots) {
      addSuggestions('potion', pots);
      //spells
      return fetch(apiUrl('/spells?name=' + encodeURIComponent(query) + '&limit=5'));
    })
    .then(function(r) { return r.json(); })
    .then(function(spells) {
      addSuggestions('spell', spells);
    })
    .catch(function() {
      ul.style.display = 'none'; 
    });
}

function addSuggestions(type, items) {
  var ul = document.getElementById('search-suggestions');
  for (var i = 0; i < items.length; i++) {
    var item = items[i];
    var li = document.createElement('li');
    var a = document.createElement('a');
    a.href = '/' + type + '?id=' + item.id;
    a.textContent = item.name + ' (' + type + ')';
    li.appendChild(a);
    ul.appendChild(li);
  }
}

// side-menu open/close
function openMenu() {
  document.getElementById('side-menu').classList.add('open');
  document.getElementById('menu-overlay').classList.add('open');
}
function closeMenu() {
  document.getElementById('side-menu').classList.remove('open');
  document.getElementById('menu-overlay').classList.remove('open');
}
