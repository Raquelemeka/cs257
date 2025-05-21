
/*
 * webapp.js
 * Rui, Raquel 
 * 20 May, 2025
 * based on books.js by Jeff Ondich
 */

window.addEventListener("load", initialize)
function initialize(){
  var element = document.getElementById("get-characters");
  element.onclick = loadCharacters;
}

function getAPIBaseURL() {
  var baseURL = window.location.protocol + '//' + window.location.hostname + ':' + window.location.port + '/api';
  return baseURL;
}

function loadCharacters() {
  var url = getAPIBaseURL() + '/characters';

  fetch(url, {method: 'get'})

  .then((response) => response.json())

  .then(function(charactersList) {
      buildCharactersTable(charactersList);
  })

  .catch(function(error) {
      console.log(error);
  });
}

// 4) build the <tbody> just like your authors example
function buildCharactersTable(charactersList) {
  var tableBody = '';
  for (var k = 0; k < charactersList.length; k++) {
      var ch = charactersList[k];

      tableBody += '<tr>';
      tableBody += '<td>' + (ch.name || ''  ) + '</td>';
      tableBody += '<td>' + (ch.house  || '') + '</td>';
      tableBody += '<td>' + (ch.blood_status || '') + '</td>';
      tableBody += '<td>' + (ch.species|| '') + '</td>';
      tableBody += '<td>' + (ch.gender || '') + '</td>';
      tableBody += '<td>' + (ch.wand   || '') + '</td>';
      tableBody += '<td>' + (ch.patronus || '') + '</td>';
      tableBody += '<td>' + (ch.hair_color || '') + '</td>';
      tableBody += '</tr>';
  }

  var resultsTableElement = document.getElementById('results_table');
  if (resultsTableElement) {
      resultsTableElement.innerHTML = tableBody;
  }
}

